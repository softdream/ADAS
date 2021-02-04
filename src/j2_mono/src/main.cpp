#include <vector>
#include <set>
#include <map>
#include <utility>
#include <algorithm>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <string>
#include <list>
#include <mutex>
#include <condition_variable>
#include <memory>
#include <thread>

#include <stdint.h>
#include <sys/stat.h>
#include <sys/types.h>

#include <meta.pb.h>
#include <opencv2/opencv.hpp>

#include <string.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <pthread.h>

#include "DataReceiver.h"
#include "udp_receiver.h"

#include <ros/ros.h>
#include <j2_mono/Meta.h>

#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#define WORD short
#define MAX_PATH 256

int imageWidth = 1280;
int imageHeight = 720;


ros::Publisher pub;
image_transport::Publisher image_pub;


/**
 * @brief class UndistortInfo
 * Used to get undistort imge from raw image
 */
class UndistortInfo {
public:
  UndistortInfo() {
    inited = false;
  }
  void InitUndistort(int w, int h, int type,
                     float focal_u, float focal_v,
                     float center_u, float center_v,
                     const float *distort_param,
                     int distort_param_num);

  cv::Mat UndistortImage(cv::Mat image);

  int img_w_;
  int img_h_;
  float focal_u_;
  float focal_v_;
  float center_u_;
  float center_v_;
  std::vector<float> distort_;
  std::vector<cv::Mat> distort_map1_;
  std::vector<cv::Mat> distort_map2_;
  bool inited;
};

/**
* @brief class ParsingInfo
* Used to get parisng label image
*/
class ParsingInfo {
public:
  ParsingInfo() {
    inited = false;
  }

  void InitParsingInfo(const CommonProto::ParsingSetting *parsing_setting,
                       const CommonProto::Image *parsing,
                       const CommonProto::Image *image);

  cv::Mat GetParsingLabelMat(SharedVector(uint8_t) parsing_data);

  cv::Mat GetParsingMat(cv::Mat &label);
  cv::Mat GetParsingMatByName(cv::Mat &label, std::string name);
  cv::Mat GetParsingMatByNames(cv::Mat &label, std::initializer_list<std::string> names);

  int parsing_label_width_;
  int parsing_label_height_;

  int parsing_format_;
  int parsing_type_;
  int parsing_label_channels_;
  
  int parsing_width_;
  int parsing_height_;

  std::vector<uint64> channel_label_;
  std::vector<CommonProto::Color> channel_color_;

  std::vector<uint64> boundspace_channels_;
  std::vector<uint64> freespace_channels_;

  std::map < std::string, uint64> label_map_;

  int parsing_id_;
  bool parsing_id_inited_;


  std::set<int> parsing_ids_;
  bool parsing_ids_inited_;

  bool inited;
};

enum ParsingType {
  ParsingType_Parsing = 0,
  ParsingType_LaneParsing = 1,
};

enum LogEnable {
  LogEnable_CANFrameRaw = 0,
  LogEnable_CANFrame = 1,
  LogEnable_OdometryFrame = 2,
  LogEnable_ObstacleRaw = 3,
  LogEnable_Obstacle = 4,
  LogEnable_FreeSpace = 5,
  LogEnable_Line = 6,
  LogEnable_ParsingSetting = 7,
  LogEnable_Count = 8
};

static int log_enable[LogEnable_Count] = {
   0, //CANFrameRaw
   0, //CANFrame
   0, //OdometryFrame
   0, //ObstacleRaw
   0, //Obstacle
   0, //FreeSpace
   0, //Line
   0, //ParsingSetting
};

static int parsing_label_count = 42;

const std::string parsing_label_name[42] = {
  "Road",
  "Sidewalk",
  "Building",
  "LaneMarking",
  "Fence",
  "Pole",
  "TrafficLight",
  "TrafficSign",
  "Vegetation",
  "Terrain",
  "Sky",
  "Person",
  "Rider",
  "Car",
  "Truck",
  "Bus",
  "Train",
  "Motorcycle",
  "Bicycle",
  "GuidePost",
  "CrosswalkLine",
  "TrafficArrow",
  "SignLine",
  "GuideLine",
  "TrafficCone",
  "Barrel",
  "StopLine",
  "SpeedMark",
  "Diamond",
  "BicycleSign",
  "SpeedBumps",
  "Tricycle",
  "SlowDownTriangle",
  "Mask",
  "PotHole",
  "Other", 
  "Curb",
  "ParkingLine",
  "ParkingSpace",
  "ParkingRod",
  "ParkingLock",
  "Column",
};

static std::vector<UndistortInfo> g_undistort;
static std::vector<uint8_t> g_rledecompressbuf;

static std::vector<ParsingInfo> g_parsinginfo;

void GetUndistortInfo(Meta::Meta *meta);
std::vector<cv::Mat> ParseImage(FrameInfo *frame);
bool ParseMeta(std::vector<cv::Mat> image, Meta::Meta *fproto);

void GetParsingInfo(const Meta::Meta *meta);
static bool g_getparsinginfo = false;

void DealParsingData(const CommonProto::Image &parsing,
                     const std::vector<int8_t> &parsing_data,
                     int idx);


void DealWithSerializedData(const FrameInfo *frame);

LogUDPReceiver log_receiver;

ImageUDPReceiver udp_im_receiver;

// thread for receive
static bool g_bStopReceive = false;
static bool g_bReceiveOver = false;

static bool g_bStopReceiveUDPLog = false;
static bool g_bReceiveUDPLogOver = false;

static bool g_bStopReceiveUDPImage = false;
static bool g_bReceiveUDPImageOver = false;

std::mutex g_lckReceiveUDPLogOver;
std::condition_variable g_condReceiveUDPLogOver;

std::mutex g_lckReceiveUDPImageOver;
std::condition_variable g_condReceiveUDPImageOver;

std::mutex g_lckReceiveOver;
std::condition_variable g_condReceiveOver;

std::mutex g_lckProcess;
std::condition_variable g_condProcess;
std::list<std::shared_ptr<FrameInfo> > g_listFrames;
static const int kMaxListFrameSize = 5;
static bool g_bProcessOver = false;

/**
 * @brief process thread fucntion
 * @details handle received frame, parse the meta, get undistort image and
 *          parsing data
 */
void * ThreadProcess() {
  while (!g_bStopReceive) {
    std::shared_ptr<FrameInfo> frame;
    {
      std::unique_lock<std::mutex> lck(g_lckProcess);
      if (g_listFrames.empty()) {
        g_condProcess.wait_for(lck, std::chrono::milliseconds(100));
        continue;
      }

      frame = g_listFrames.front();
      g_listFrames.pop_front();
    }


    // TODO: deal with frame
    {
      imageWidth = frame->meta.data().image(0).width();
      imageHeight = frame->meta.data().image(0).height();

      GetUndistortInfo(&frame->meta);

      std::vector<cv::Mat> image;
      image = ParseImage(frame.get());

      ParseMeta(image, &frame->meta);


      GetParsingInfo(&frame->meta);

      DealWithSerializedData(frame.get());

      for (size_t i = 0; i < frame->parsing_data.size(); i++) {
#if 0
        DealParsingData(frame->meta.data().structure_perception().parsing(i),
                        frame->parsing_data[i], i);
#else
        cv::Mat label = g_parsinginfo[0].GetParsingLabelMat(frame->parsing_data[i]);

        // Choose as your needs
        cv::Mat full = g_parsinginfo[0].GetParsingMat(label);
        cv::Mat one_channel = g_parsinginfo[0].GetParsingMatByName(label, "LaneMarking");
        cv::Mat channels = g_parsinginfo[0].GetParsingMatByNames(label, { "Road" , "Car", "LaneMarking", "Truck"});
        cv::Mat lane = g_parsinginfo[1].GetParsingMat(label);
	
	//sensor_msgs::ImagePtr msg = cv_bridge::CvImage( std_msgs::Header(), "bgr8", channels ).toImageMsg();
	//image_pub.publish( msg );

        // TODO
        // resize and undistortion as your needs
#endif
      }
    }
  }

  g_bProcessOver = true;

  std::unique_lock<std::mutex> lck(g_lckProcess);
  g_condProcess.notify_all();

  return 0;
}
#ifndef _WIN32
std::string GetLocalIP(std::string net_name) {
  // std::string net_name = "eth0";
  std::string ip = "";
  int sock_fd;
  struct ifconf conf;
  struct ifreq *ifr;
  char buff[256] = { 0 };
  sock_fd = socket(PF_INET, SOCK_DGRAM, 0);
  if (sock_fd < 0) {
    std::cout << __LINE__ << " init socket for get ip failed" << std::endl;
    return ip;
  }
  conf.ifc_len = 256;
  conf.ifc_buf = buff;
  if (ioctl(sock_fd, SIOCGIFCONF, &conf) < 0) {
    std::cout << __LINE__ << " ioctl init failed" << std::endl;
    close(sock_fd);
    return ip;
  }
  int num = conf.ifc_len / sizeof(struct ifreq);
  ifr = conf.ifc_req;
  for (int i = 0; i < num; i++) {
    struct sockaddr_in *sin = (struct sockaddr_in *)(&ifr->ifr_addr);
    if (ioctl(sock_fd, SIOCGIFFLAGS, ifr) < 0) {
      close(sock_fd);
      return ip;
    }
    if ((ifr->ifr_flags & IFF_UP) &&
      strcmp(net_name.c_str(), ifr->ifr_name) == 0) {
      ip = inet_ntoa(sin->sin_addr);
      close(sock_fd);
      return ip;
    }
    ifr++;
  }
  close(sock_fd);
  return ip;
}
#else
std::string GetLocalIP() {
  int ret;
  WSADATA wsaData;
  char hostname[256];
  std::string ip = "";
  ret = WSAStartup(MAKEWORD(2, 2), &wsaData);
  if (ret != 0) {
    std::cout << "winsock init failed";
    return ip;
  }
  ret = gethostname(hostname, sizeof(hostname));
  if (ret != 0) {
    std::cout << "Get host name failed";
    return ip;
  }
  hostent* host = gethostbyname(hostname);
  if (host == NULL) {
    std::cout << "Get host failed";
    return ip;
  }
  int i = 0;
  std::string tmp = inet_ntoa(*reinterpret_cast<in_addr*>(host->h_addr_list[0]));
  while (!tmp.empty()) {
    if (tmp.find("192.168.1.") != std::string::npos) {
      break;
    }
    i++;
    tmp = inet_ntoa(*reinterpret_cast<in_addr*>(host->h_addr_list[i]));
  }
  in_addr *pAddr = reinterpret_cast<in_addr*>(host->h_addr_list[i]);
  ip = inet_ntoa(*pAddr);
  return ip;
}
#endif

/**
 * @brief receive thread fucntion
 * @details receive frame data from data provider and add to frame list
 * @param ip_param IP address and port number
 */
void * ThreadRecieve(void *ip_param) {
  std::string server = (char *)ip_param;
  std::cout << "connect to " << server << std::endl;

  DataReceiver mq_sub;
  std::string end_point;
  if (server.substr(0, 3) != "tcp") {
    if (server.substr(0, 4) == "epgm") {
#ifndef _WIN32
      std::string net_name = server.substr(7, 4);
      std::string ip = GetLocalIP(net_name);
      server = server.substr(0, 7) + ip + server.substr(11);
#else
      std::string ip = GetLocalIP();
      server = server.substr(0, 7) + ip + server.substr(11);
#endif
      end_point = server;
    } else {
      end_point = "tcp://";
      end_point += server;
    }
  }
  else {
    end_point = server;
  }
  mq_sub.init(end_point.c_str());

  unsigned int mq_count = 0;

  float avg_fps = 12.0f;
  float avg_delay = 180.0f;

  bool bRecvFail = false;
  int nRecvFailCount = 0;
  int64_t last_ts = 0;
  while (!g_bStopReceive)
  {
    std::shared_ptr<FrameInfo> frame = std::make_shared<FrameInfo>();

    if (!mq_sub.RecvFrame(frame.get())) {
      {
        bRecvFail = true;
        nRecvFailCount++;

        if (nRecvFailCount > 20) {
          std::cout << "Recv Frame Timeout" << std::endl;
          mq_sub.reconnect();
          nRecvFailCount = 0;
        }
      }
      continue;
    }
    
    int ts = GetTimeStamp();
    {
      std::unique_lock<std::mutex> lck(g_lckProcess);
      if (g_listFrames.size() >= kMaxListFrameSize) {
        g_listFrames.pop_front(); //超过list大小的数据丢弃
      }
      g_listFrames.push_back(frame);
    }

    bRecvFail = false;
    nRecvFailCount = 0;
    mq_count++;

    if (last_ts != 0) {
      int64_t time = ts - last_ts;
      if (time > 0) {
        avg_fps = avg_fps * 0.9f + 1000.0f / time * 0.1f;
      }

      int64_t delay = frame->ts - frame->meta.data().image(0).time_stamp();
      avg_delay = avg_delay * 0.9f + delay * 0.1f;

      if (mq_count % 20 == 0) {
        printf("current eth recv: avg fps: %.1f, avg delay: %.1f\n",
              avg_fps, avg_delay);
      }
    }
    last_ts = ts;
  } // end of while

  g_bReceiveOver = true;

  std::unique_lock<std::mutex> lck(g_lckReceiveOver);
  g_condReceiveOver.notify_all();

  return 0;
}

void ThreadUDPImage() {
  while (!g_bStopReceiveUDPImage) {
    ImageData image;
    int ret = udp_im_receiver.RecvFrame(&image);
    if (ret < 0) {
      continue;
    }

    std::cout << "udp image id: " << (int)image.frame_id << std::endl;
    // TODO:
    // image.frame_id can be matched with (frame->meta.data().frame_id() & 0xFF)
    // image data layout is [len, data], [len, data], ...
    int offset = 0;
    while (offset < image.image_len_) {
      size_t im_len = *(size_t *)&image.image_len_;
      uint8_t *im_data = image.image_data_ + 4;
      // TODO: deal with image data

      offset += 4 + im_len;
    }
  }

  g_bReceiveUDPImageOver = true;

  std::unique_lock<std::mutex> lck(g_lckReceiveUDPImageOver);
  g_condReceiveUDPImageOver.notify_all();
}

void ThreadUDPLog() {
  while (!g_bStopReceive) {
    LogInfo info;
    if (log_receiver.RecvFrame(&info) == 0) {
      std::cout << std::string((char *)info.log_data) << std::endl;
    }
  }

  g_bReceiveUDPLogOver = true;

  std::unique_lock<std::mutex> lck(g_lckReceiveUDPLogOver);
  g_condReceiveUDPLogOver.notify_all();
}

/**
 * @brief program entry
 * @details start receive & process thread, and listen to keyboard input
 *          in main thread, press 'q' + Enter to stop the program
 */

int main(int argc, char **argv) {
  //////////////////////////////////////////////////////////
  ROS_INFO( "Program started ..." );

  ros::init( argc, argv, "j2_mono" );
  ros::NodeHandle n;

  image_transport::ImageTransport it(n);

  pub = n.advertise<j2_mono::Meta>( "/Meta/SourceData", 1);
  image_pub = it.advertise("/Image/RawData", 1);

  if (argc != 2) {
    printf("usage: tcp://ip:port\nor\n\"epgm://eth0;multicast_group:port\"\n"\
           "P.S. multicast_group could be 239.192.1.1, port should be 5560\n");
    return 0;
  }
  char *server = argv[1];

  if (strncmp(server, "tcp", 3) != 0
      && strncmp(server, "epgm", 4) != 0) {
    printf("invalid server protocol.\n");
    return -1;
  }

  {
    if (strncmp(server, "tcp", 3) == 0) {
      char *server_ip = server + 6;
      int i = 0;
      for (i = 0; i < strlen(server_ip); i++) {
        if (server_ip[i] == ':') {
          break;
        }
      }
      char tmp = server_ip[i];
      server_ip[i] = '\0';
      
      log_receiver.AddTargetServer(server_ip);
      udp_im_receiver.AddTargetServer(server_ip);
      server_ip[i] = tmp;
    }
  }


  //////////////////////////////////////////////////////////////////////////
  g_bStopReceive = false;
  g_bStopReceiveUDPLog = false;
  g_bStopReceiveUDPImage = false;

  g_bReceiveOver = false;
  g_bReceiveUDPLogOver = false;
  g_bReceiveUDPImageOver = false;

  std::thread th_recv(ThreadRecieve, server);
  std::thread th_process(ThreadProcess);
  std::thread th_udp_image(ThreadUDPImage);
  std::thread th_udp_log(ThreadUDPLog);

  while (true) {
    char c;
    std::cin >> c;
    if (c == 'q') {
      break;
    }
  }

  g_bStopReceive = true;
  g_bStopReceiveUDPLog = true;
  g_bStopReceiveUDPImage = true;

  {
    std::unique_lock<std::mutex> lck(g_lckReceiveOver);
    while (!g_bReceiveOver) {
      g_condReceiveOver.wait_for(lck,
                                 std::chrono::milliseconds(10));
    }
    if (th_recv.joinable()) {
      th_recv.join();
    }
    if (th_process.joinable()) {
      th_process.join();
    }

  }

  {
    std::unique_lock<std::mutex> lck(g_lckReceiveUDPLogOver);
    while (!g_bReceiveUDPLogOver) {
      g_condReceiveUDPLogOver.wait_for(lck,
                                 std::chrono::milliseconds(10));
    }

    if (th_udp_log.joinable()) {
      th_udp_log.join();
    }
  }

  {
    std::unique_lock<std::mutex> lck(g_lckReceiveUDPImageOver);
    while (!g_bReceiveUDPImageOver) {
      g_condReceiveUDPImageOver.wait_for(lck,
                                 std::chrono::milliseconds(10));
    }

    if (th_udp_image.joinable()) {
      th_udp_image.join();
    }
  }


  google::protobuf::ShutdownProtobufLibrary();

  return 0;
}

enum SubSampleMode {
  SubSample_None = 0,
  SubSample_Invalid = 1,    // reserved
  SubSample_Half = 2,
  SubSample_Quarter = 3,
  SubSample_NoImage = 4,    // 
};

const char *g_image_format[] = {
  "Gray",
  "YV12",
  "JPEG",     // jpeg compressed
  "PNG",      // png compressed
  "CR12",     // reserved
  "BAD",      // reserved
  "NV12",
  "NV21",
  "Timeout",   // timeout image
  "bypass"
};

/**
 * IsJpegStream() is a simple version of jpeg check
 * 
 */
bool IsJpegStream(uint8_t *data, int len) {
  if (data[0] == 0xFF && data[1] == 0xD8
      && data[2] == 0xFF && data[3] == 0xE0
      && data[len - 2] == 0xFF && data[len - 1] == 0xD9) {
    return true;
  } else {
    return false;
  }
}

bool NV12ToBGR24_Opencv( unsigned char *pYUV, int width, int height )
{
	if( width < 1 || height < 1 || pYUV == NULL ){
		return false;
	}
}

/**
 * @brief raw image data processing
 * @details parse the raw image from received frame data according to
 *          color mode and do the undistortion
 * @param pointer to frame
 */
std::vector<cv::Mat> ParseImage(FrameInfo *frame) {
  std::vector<cv::Mat> img_mat;
  if (frame->send_mode == 4) {
    // no image
    return img_mat;
  }
  static int subsample_rate[] = {
    1, 1, 2, 4, 1
  };

  for (int i = 0; i < frame->img_data.size(); i++) {
    const CommonProto::Image &img_info = frame->meta.data().image(i);
    uint32_t width = img_info.width();
    uint32_t height = img_info.height();
    int sub_sample = img_info.send_mode();
    int scale = subsample_rate[sub_sample];
    // for matrix 1.7, format could only be NV12 and jpeg;
    // for matrix 2.0, nv12 only
    // format only indicate direct output from device
    // matrix client may compress yuv to jpeg without modify this format field
    int color_mode = img_info.format();

    // check data filed if jpeg
    bool is_jpg = color_mode == CommonProto::ImageFormat::JPEG
      || IsJpegStream(frame->img_data[i]->data(), frame->img_data[i]->size());

    std::cout << "Image " << i << ": ("
      << width << ", "
      << height << ", "
      << scale << ", "
      << g_image_format[color_mode] << ")" << std::endl;

    cv::Mat image;
    if (color_mode == CommonProto::ImageFormat::TIMEOUT) {
      // this is a fake image when camera interrupt timeout happened
    } 
    else if (is_jpg) {
      std::cout<<"---------------------------------- IS JPEG ------------------------------------"<<std::endl;
      if (frame->send_mode == 4) {
    
        return img_mat;
      }
      // sample to get jpeg image form raw data
      cv::Mat im_stream(1, frame->img_data[i]->size(), CV_8UC1,
                        frame->img_data[i]->data());
      image = cv::imdecode(im_stream, cv::IMREAD_COLOR);
  
      sensor_msgs::ImagePtr msg = cv_bridge::CvImage( std_msgs::Header(), "bgr8", image ).toImageMsg();
      image_pub.publish( msg );

    } else {
      uint8_t *img_data = frame->img_data[i]->data();
      uint8_t *img_y = img_data;
      uint8_t *img_uv = img_data + width * height;  // uvuvuv pattern
    
      // sample for a gray image
      cv::Mat mat_gray(height, width, CV_8UC1, img_data, width);

      // sample for resize back to origin image size
      cv::Mat mat_resize(height * scale, width * scale, mat_gray.type());
      cv::resize(mat_gray, mat_resize, mat_resize.size());
      image = mat_resize;


      cv::Mat rgb_image( height, width, CV_8UC3 );
      cv::Mat src( height + height / 2, width, CV_8UC1, img_data );
      cv::cvtColor( src, rgb_image, cv::COLOR_YUV2BGR_NV12 );
      cv::imshow( "image", rgb_image );
      sensor_msgs::ImagePtr msg = cv_bridge::CvImage( std_msgs::Header(), "bgr8", rgb_image ).toImageMsg();
      image_pub.publish( msg );
    }
    

    // Get Undistort Image
    cv::Mat undistort_image = g_undistort[i].UndistortImage(image);
    img_mat.push_back(undistort_image);
  }
  return img_mat;
}

/**
 * @brief get the undistort info
 * @details get undistort parameters from meta and populate
 *          the undistort map of UndistortInfo
 * @param meta pointer to received meta
 */
void GetUndistortInfo(Meta::Meta *meta) {
  int cam_count = meta->data().camera_size();
  if (g_undistort.size() < cam_count) {
    g_undistort.resize(cam_count);
  }
  for (int idx = 0; idx < cam_count; idx++) {
    const CommonProto::CameraParam &cam = meta->data().camera(idx);
    if (cam.has_distort()) {
      g_undistort[idx].InitUndistort(imageWidth, imageHeight, cam.type(),
                                     cam.focal_u(), cam.focal_v(),
                                     cam.center_u(), cam.center_v(),
                                     cam.distort().param().data(),
                                     cam.distort().param_size());
    }
  }
}

static std::string Point2Str(const CommonProto::Point &p)
{
  std::string s = "(" + std::to_string(p.x()) + ", "
                      + std::to_string(p.y())
                      + (p.has_z() ? (", " + std::to_string(p.z())) : "") +  ")";
  return s;
}

static std::string Vel2Str(const CommonProto::Velocity &v)
{
  std::string s = "(" + std::to_string(v.vx()) + ", "
                      + std::to_string(v.vy())
                      + (v.has_vz() ? (", " + std::to_string(v.vz())) : "") +  ")";
  return s;
}

static std::string Rect2Str(const CommonProto::Rect &r)
{
  std::string s = "[" + std::to_string(r.left()) + ", "
                      + std::to_string(r.top()) + "; "
                      + std::to_string(r.right()) + ", "
                      + std::to_string(r.bottom()) + "]";
  return s;
}

static std::string Box3D2Str(const CommonProto::Box3D &b)
{
  std::string s = "{" + Point2Str(b.lower_lt()) + ", "
                      + Point2Str(b.lower_lb()) + ", "
                      + Point2Str(b.lower_rb()) + ", "
                      + Point2Str(b.lower_rt()) + ", "
                      + Point2Str(b.upper_lt()) + ", "
                      + Point2Str(b.upper_lb()) + ", "
                      + Point2Str(b.upper_rb()) + ", "
                      + Point2Str(b.upper_rt())
                      + (b.has_conf() ? ("; conf: " + std::to_string(b.conf())) : "")
                      + "}";
  return s;
}

static void PrintCANFrameRaw(const CANProto::CANFrameRaw &raw_proto)
{
  if (log_enable[LogEnable_CANFrameRaw] == 0)
    return;

  std::cout << "CANFrameRaw -> CAN id: 0x"
            << std::hex << raw_proto.can_id() << ", "
            << "dlc: " << std::dec << raw_proto.can_dlc() << ", "
            << "ts: " << raw_proto.time_stamp() << ", "
            << "data: ";
  for (int j = 0; j < raw_proto.data_size(); j++) {
    std::cout << std::setw(2) << std::hex << raw_proto.data(j) << " ";
  }

  std::cout << std::dec << std::endl << std::endl;
}

static void PrintCANFrame(const CANProto::CANFrame &can_frame)
{

  if (log_enable[LogEnable_CANFrame] == 0)
    return;

  //TurnSignal
  for (int i = 0; i < can_frame.ts_size(); i++) {
    std::cout << "CANFrame -> TurnSignal -> No " << i << ": "
              << "type: " << can_frame.ts(i).type() << ", "
              << "ts: " << can_frame.ts(i).time_stamp() << std::endl;
  }
  //Gear
  for (int i = 0; i < can_frame.gt_size(); i++) {
    std::cout << "CANFrame -> Gear -> No " << i << ": "
              << "type: " << can_frame.gt(i).type() << ", "
              << "ts: " << can_frame.gt(i).time_stamp() << std::endl;
  }
  //VehSpeed
  for (int i = 0; i < can_frame.sp_size(); i++) {
    std::cout << "CANFrame -> VehSpeed -> No " << i << ": "
              << "speed: " << can_frame.sp(i).speed() << ", "
              << "ts: " << can_frame.sp(i).time_stamp() << std::endl;
  }
  //WheelAngle
  for (int i = 0; i < can_frame.wa_size(); i++) {
    std::cout << "CANFrame -> WheelAngle -> No " << i << ": "
              << "angle: " << can_frame.wa(i).angle() << ", "
              << "ts: " << can_frame.wa(i).time_stamp() << std::endl;
  }
  //CANIMU
  for (int i = 0; i < can_frame.imu_size(); i++) {
    std::cout << "CANFrame -> CANIMU -> No " << i << ": "
              << "acc: " << can_frame.imu(i).acc() << ", "
              << "yaw: " << can_frame.imu(i).yaw() << ", "
              << "yaw_rate: " << can_frame.imu(i).yaw_rate() << ", "
              << "ts: " << can_frame.imu(i).time_stamp() << std::endl;
  }

  std::cout << std::endl;
}

static void PrintOdometryFrame(const CommonProto::OdometryFrame &odo_frame)
{
  if (log_enable[LogEnable_OdometryFrame] == 0)
    return;

  std::cout << "Odometry -> "
            << "x: " << odo_frame.x() << ", "
            << "y: " << odo_frame.y() << ", "
            << "yaw: " << odo_frame.yaw() << ", "
            << "speed: " << odo_frame.speed() << ", "
            << "yaw_rate: " << odo_frame.yaw_rate() << ", "
            << "ts: " << odo_frame.time_stamp() << std::endl << std::endl;
}

static void PrintObstacleRaw(const CommonProto::ObstacleRaw &obs_raw,
                             float conf)
{
  if (log_enable[LogEnable_ObstacleRaw] == 0)
    return;

  std::string type;

  if (obs_raw.model() == CommonProto::ObstacleRawModel_Car) {
    type = "ObstacleRawModel_Car";
  } else if (obs_raw.model() == CommonProto::ObstacleRawModel_FullCar) {
    type = "ObstacleRawModel_FullCar";
  } else if (obs_raw.model() == CommonProto::ObstacleRawModel_Ped) {
    type = "ObstacleRawModel_Ped";
  } else if (obs_raw.model() == CommonProto::ObstacleRawModel_TrafficSign) {
    type = "ObstacleRawModel_TrafficSign";
  } else if (obs_raw.model() == CommonProto::ObstacleRawModel_TrafficLight) {
    type = "ObstacleRawModel_TrafficLight";
  } else if (obs_raw.model() == CommonProto::ObstacleRawModel_Cyclist) {
    type = "ObstacleRawModel_Cyclist";
  } else {
    type = "Other";
  }

  std::cout << "obs raw -> "
            << "type: " << type << ", "
            << "conf: " << conf << ", "
            << "Rect: "  << Rect2Str(obs_raw.rect()) << ", "
            << "model: " << obs_raw.model() << std::endl;

  for (int j = 0; j < obs_raw.property_size(); j++) {
    std::cout << "obs raw -> prop -> " << j << ": property: " << obs_raw.property(j) << ", "
              << "property_name: " << obs_raw.property_name(j) << ", "
              << "property_type: " << obs_raw.property_type(j) << ", "
              << "property_conf: " << obs_raw.property_conf(j) << std::endl;
  }

  std::cout << std::endl;
}

static void PrintObstacle(const CommonProto::Obstacle &obs, float conf)
{
  if (log_enable[LogEnable_Obstacle] == 0)
    return;

  std::string type;

  if (obs.type() == CommonProto::ObstacleType_VehicleRear) {
    type = "ObstacleType_VehicleRear";
  } else if (obs.type() == CommonProto::ObstacleType_VehicleFull) {
    type = "ObstacleType_VehicleFull";
  } else if (obs.type() == CommonProto::ObstacleType_Pedestrian) {
    type = "ObstacleType_Pedestrian";
  } else if (obs.type() == CommonProto::ObstacleType_TrafficSign) {
    type = "ObstacleType_TrafficSign";
  } else if (obs.type() == CommonProto::ObstacleType_TrafficLight) {
    type = "ObstacleType_TrafficLight";
  } else if (obs.type() == CommonProto::ObstacleType_Cyclist) {
    type = "ObstacleType_Cyclist";
  } else {
    type = "Other";
  }

  std::cout << "obs -> "
            << "type: " << type << ", "
            << "conf: " << conf << ", "
            << "obj id: " << obs.id() << ", "
            << "type id: " << obs.type() << ", "
            << "conf :" << obs.conf() << ", "
            << "life_time: " << obs.life_time() << ", "
            << "age: " << obs.age() << std::endl;

  if (obs.has_img_info()) {
    if (obs.img_info().has_rect()) {
      std::cout << "obs -> ImageSpaceInfo -> Rect: "
                << Rect2Str(obs.img_info().rect()) << std::endl;
    }

    if (obs.img_info().has_box()) {
      std::cout << "obs -> ImageSpaceInfo -> Box3D: "
                << Box3D2Str(obs.img_info().box()) << std::endl;
    }

    std::cout << "obs -> ImageSpaceInfo -> "
              << "sigma_width: " << obs.img_info().sigma_width() << ", "
              << "sigma_height: " << obs.img_info().sigma_height() << ", "
              << "sigma_x: " << obs.img_info().sigma_x() << ", "
              << "sigma_y: " << obs.img_info().sigma_y() << std::endl;
  }

  if (obs.has_world_info()) {
    std::cout << "obs -> WorldSpaceInfo -> yaw: "
              << obs.world_info().yaw() << std::endl;

    std::cout << "obs -> WorldSpaceInfo -> vel: "
              << Vel2Str(obs.world_info().vel()) << std::endl;

    std::cout << "obs -> WorldSpaceInfo -> length: "
              << obs.world_info().length() << ", "
              << "width: " << obs.world_info().width() << ", "
              << "height: " << obs.world_info().height() << std::endl;

    //enable on demand
#if 0
    std::cout << "obs -> WorldSpaceInfo -> poly: ";
    for (int i = 0; i < obs.world_info().poly().pts_size(); i++) {
      std::cout << Point2Str(obs.world_info().poly().pts(i));
    }
    std::cout << endl;
#endif
    std::cout << "obs -> WorldSpaceInfo -> position: "
              << Point2Str(obs.world_info().position()) << std::endl;

    std::cout << "obs -> WorldSpaceInfo -> traversable: "
              << obs.world_info().traversable() << ", "
              << "hmw: " << obs.world_info().hmw() << ", "
              << "ttc: " << obs.world_info().ttc() << ", "
              << "curr_lane: " << obs.world_info().curr_lane() << ", "
              << std::endl;

    std::cout << "obs -> WorldSpaceInfo -> sigma_yaw: "
              << obs.world_info().sigma_yaw() << ", "
              << "sigma_width: " << obs.world_info().sigma_width() << ", "
              << "sigma_height: " << obs.world_info().sigma_height()
              << std::endl;

    for (int i = 0; i < obs.world_info().sigma_vel_size(); i++) {
      if (i == 0) {
        std::cout << "obs -> WorldSpaceInfo -> sigma_vel: ";
      }
      std::cout << obs.world_info().sigma_vel(i);
      if (i == obs.world_info().sigma_vel_size() - 1) {
        std::cout << std::endl;
      } else {
        std::cout << ", ";
      }
    }

    for (int i = 0; i < obs.world_info().sigma_position_size(); i++) {
      if (i == 0) {
        std::cout << "obs -> WorldSpaceInfo -> sigma_position: ";
      }
      std::cout << obs.world_info().sigma_position(i);
      if (i == obs.world_info().sigma_position_size() - 1) {
        std::cout << std::endl;
      } else {
        std::cout << ", ";
      }
    }
  }

  for (int j = 0; j < obs.property_size(); j++) {
    std::cout << "obs -> prop: " << j << ": property: " << obs.property(j) << ", "
              << "property_name: " << obs.property_name(j) << ", "
              << "property_type: " << obs.property_type(j) << ", "
              << "property_conf: " << obs.property_conf(j) << std::endl;
  }

  std::cout << std::endl;
}

static void PrintFreeSpacePoint(const CommonProto::Point &pt_img,
                                const CommonProto::Point &pt_vcs)
{
  if (log_enable[LogEnable_FreeSpace] == 0)
    return;

  std::cout << "FreeSpacePoint -> pt_img: " << Point2Str(pt_img) << ", "
            << "pt_vcs: " << Point2Str(pt_vcs) << std::endl;
}

/**
* @brief convert vcsgnd point to img point
* @details use the convert mat to convert points from
*          vcsgnd(z = 0) coordinate system to image coordinate system
* @param points in vcsgnd, the mat to convert coordinate system
*/
static cv::Point2f CvtVcsGndToImage(
  const cv::Point2f &pt, const cv::Mat &cvt_mat) {
    float *p = reinterpret_cast<float *>(cvt_mat.data);
    float t = p[6] * pt.x + p[7] * pt.y + p[8];
    float x = (p[0] * pt.x + p[1] * pt.y + p[2]) / t;
    float y = (p[3] * pt.x + p[4] * pt.y + p[5]) / t;
    return cv::Point2f(x, y);
}

float line_f(float y, const google::protobuf::RepeatedField<float> &coeffs) {
  const float *data = coeffs.data();
  float x = data[0];
  float factor = 1.0f;
  for (int i = 1; i < coeffs.size(); i++) {
    factor *= y;
    x += factor * data[i];
  }
  return x;
}

static void DrawLines(cv::Mat image,
                      const CommonProto::Lines &lines,
                      const cv::Mat &vcsgnd2img) {
  if (vcsgnd2img.empty())
    return;

  if (image.empty()) {
    return;
  }

  for (int i = 0; i < lines.lines_size(); i++) {
    const CommonProto::Line &line = lines.lines(i);
    // only draw line raw
    if (line.end_points_size() == 2 &&
      line.type() & CommonProto::LineType::LINE_RAW) {
      // get the endpoints
      float end_pt_x1 = line.end_points(1).x();
      float end_pt_x0 = line.end_points(0).x();
      float end_pt_y1 = line.end_points(1).y();
      float end_pt_y0 = line.end_points(0).y();
      float st_x = std::fmin(end_pt_x0, end_pt_x1);
      float ed_x = std::fmax(end_pt_x0, end_pt_x1);
      float st_y = line_f(st_x, line.coeffs());
      cv::Point2f pt_im1 = CvtVcsGndToImage(
        cv::Point2f(st_x, st_y), vcsgnd2img);

      // draw line on image
      for (float x = st_x + 0.1f; x < ed_x + 0.00001f; x += 0.1f) {
        auto y = line_f(x, line.coeffs());
        cv::Point2f pt_im2 = CvtVcsGndToImage(cv::Point2f(x, y), vcsgnd2img);
        if (0 < pt_im1.x && pt_im1.x < image.cols &&
          pt_im1.y < image.rows && 0 < pt_im2.x &&
          pt_im2.x < image.cols && pt_im2.y < image.rows) {
          cv::line(image, pt_im1, pt_im2, cv::Scalar(255, 0, 0));
        }
        pt_im1 = pt_im2;
      }
    }
  }

//   static int counter = 0;
//   char filename[255];
//   sprintf(filename, "%04d.bmp", counter++);
//   cv::imwrite(filename, image);
}

static void PrintLine(const CommonProto::Line &line)
{
  if (log_enable[LogEnable_Line] == 0)
    return;

  std::cout << "Line -> id: " << line.id() << ", "
            << "life_time: " << line.life_time() << ", "
            << "type: " << line.type() << ", "
            << "source: " << line.source() << ", "
            << "width: " << line.width() << std::endl;

  for (int i = 0; i < line.end_points_size(); i++) {
    std::cout << "Line -> end_point " << i << ": "
              << Point2Str(line.end_points(i)) << std::endl;
  }

  std::cout << std::endl;
}

static void PrintParsingSettings(const CommonProto::ParsingSetting &parsing_setting) {
  if (log_enable[LogEnable_ParsingSetting] == 0)
    return;

  std::cout << "Parsing Setting -> parsing_type: " << parsing_setting.parsing_type() << ", "
    << "parsing_channels: " << parsing_setting.parsing_channels() << std::endl;

  for (int i = 0; i < parsing_setting.channel_labels_size(); i++) {
    std::cout << "Parsing Setting -> channel_labels " << i << " : "
      << parsing_setting.channel_labels(i) << std::endl;
  }

  for (int i = 0; i < parsing_setting.channel_colors_size(); i++) {
    std::cout << "Parsing Setting -> channel_colors " << i << " : "
      << "b(0x" << std::hex << parsing_setting.channel_colors(i).b() << ") "
      << "g(0x" << parsing_setting.channel_colors(i).g() << ") "
      << "r(0x" << parsing_setting.channel_colors(i).r() << ")" << std::dec << std::endl;
  }

  std::cout << "Parsing Setting -> freespace_channels : ";
  for (int i = 0; i < parsing_setting.freespace_channels_size(); i++) {
    std::cout << parsing_setting.freespace_channels(i) << " ";
  }
  std::cout << std::endl;

  std::cout << "Parsing Setting -> boundspace_channels : ";
  for (int i = 0; i < parsing_setting.boundspace_channels_size(); i++) {
    std::cout << parsing_setting.boundspace_channels(i) << " ";
  }
  std::cout << std::endl;
}

/**
 * @brief meta parsing
 * @details parse interested info from meta, like sensor data, odo info,
 *          obstacle info, freespace info ... and do further processing
 *          if needed, please refer to corresponding proto files for message
 *          details
 * @param meta pointer to meta
 */
bool ParseMeta(std::vector<cv::Mat> img_mat, Meta::Meta *meta) {
	std::cout << "-----------" << std::endl;
	int img_count = meta->data().image_size();	

	// for ros publishing
	j2_mono::Meta metaPub;
	metaPub.version = meta->version();
	metaPub.frame_id = meta->frame_id();
	metaPub.data.version = meta->data().version();
	metaPub.data.frame_id = meta->data().frame_id();
	//metaPub.data.data_descriptor = meta->data().data_descriptor();	

	if( meta->data().has_odometry() ){
		metaPub.data.frame_id = meta->data().version();
		metaPub.data.odometry.x = meta->data().odometry().x();
		metaPub.data.odometry.y = meta->data().odometry().y();
		metaPub.data.odometry.yaw = meta->data().odometry().yaw();
		metaPub.data.odometry.speed = meta->data().odometry().speed();
		metaPub.data.odometry.yaw_rate = meta->data().odometry().yaw_rate();
		metaPub.data.odometry.time_stamp = meta->data().odometry().time_stamp();
	}
	const MetaData::StructurePerception &percepts = meta->data().structure_perception();
	for( int idx = 0; idx < img_count; idx ++ ){
		std::cout << "Camera " << idx << ": " << std::endl;

    		if (idx >= percepts.obstacles_raws_size()) continue;
    
   	 	const CommonProto::Image &image = meta->data().image(idx);
		j2_mono::Image ig;
		ig.width = image.width();
		ig.height = image.height();	
		ig.channel = image.channel();
		ig.time_stamp = image.time_stamp();
		ig.send_mode = image.send_mode();
		ig.format = image.format();
		ig.index = image.index();
		ig.count = image.count();
		ig.depth = image.depth();
		ig.align = image.align();
		ig.image_counter = image.image_counter();
		metaPub.data.image.push_back( ig );
		
		//j2_mono::StructurePerception stp;
		if (idx < percepts.obstacles_size()) {
      			const CommonProto::Obstacles &obstacles = percepts.obstacles(idx);
			const float conf_scale = obstacles.conf_scale();
			
			j2_mono::Obstacles obss;
			obss.cam_id = obstacles.cam_id();
			for (int i = 0; i < obstacles.obstacle_size(); i++) {
				const CommonProto::Obstacle &obs = obstacles.obstacle(i);
				float conf = obs.conf() * conf_scale;
        			if (conf > 1.0) conf = 1.0;
				
				j2_mono::Obstacle ob;
				ob.id = obs.id();
				ob.type = obs.type();
				ob.conf = obs.conf();
				ob.life_time = obs.life_time();
				ob.age = obs.age();
				ob.img_info.rect.left = obs.img_info().rect().left();
				ob.img_info.rect.top = obs.img_info().rect().top();
				ob.img_info.rect.right = obs.img_info().rect().right();
				ob.img_info.rect.bottom = obs.img_info().rect().bottom();
				ob.img_info.box.lower_lt.x = obs.img_info().box().lower_lt().x();
				ob.img_info.box.lower_lt.y = obs.img_info().box().lower_lt().y();
				ob.img_info.box.lower_lt.z = obs.img_info().box().lower_lt().z();
				ob.img_info.box.lower_lb.x = obs.img_info().box().lower_lb().x();
				ob.img_info.box.lower_lb.y = obs.img_info().box().lower_lb().y();
				ob.img_info.box.lower_lb.z = obs.img_info().box().lower_lb().z();
				ob.img_info.box.lower_rb.x = obs.img_info().box().lower_rb().x();
				ob.img_info.box.lower_rb.y = obs.img_info().box().lower_rb().y();		
				ob.img_info.box.lower_rb.z = obs.img_info().box().lower_rb().z();	
				ob.img_info.box.lower_rt.x = obs.img_info().box().lower_rt().x();
				ob.img_info.box.lower_rt.y = obs.img_info().box().lower_rt().y();
				ob.img_info.box.lower_rt.z = obs.img_info().box().lower_rt().z();
				ob.img_info.box.upper_lt.x = obs.img_info().box().upper_lt().x();
				ob.img_info.box.upper_lt.y = obs.img_info().box().upper_lt().y();
				ob.img_info.box.upper_lt.z = obs.img_info().box().upper_lt().z();
				ob.img_info.box.upper_lb.x = obs.img_info().box().upper_lb().x();
                                ob.img_info.box.upper_lb.y = obs.img_info().box().upper_lb().y();
                                ob.img_info.box.upper_lb.z = obs.img_info().box().upper_lb().z();
				ob.img_info.box.upper_rb.x = obs.img_info().box().upper_rb().x();
                                ob.img_info.box.upper_rb.y = obs.img_info().box().upper_rb().y();
                                ob.img_info.box.upper_rb.z = obs.img_info().box().upper_rb().z();
				ob.img_info.box.upper_rt.x = obs.img_info().box().upper_rt().x();
                                ob.img_info.box.upper_rt.y = obs.img_info().box().upper_rt().y();
                                ob.img_info.box.upper_rt.z = obs.img_info().box().upper_rt().z();
				ob.img_info.box.conf = obs.img_info().box().conf();
		
				for( int j = 0; j < obs.img_info().poly().pts_size(); j ++ ){
					j2_mono::Point pt;
					pt.x = obs.img_info().poly().pts(j).x();
					pt.y = obs.img_info().poly().pts(j).y();
					pt.z = obs.img_info().poly().pts(j).z();
					ob.img_info.poly.pts.push_back(pt);	
				}

				ob.img_info.sigma_width = obs.img_info().sigma_width();
				ob.img_info.sigma_height = obs.img_info().sigma_height();
				ob.img_info.sigma_x = obs.img_info().sigma_x();
				ob.img_info.sigma_y = obs.img_info().sigma_y();
					
				ob.world_info.yaw = obs.world_info().yaw();
				ob.world_info.vel.vx = obs.world_info().vel().vx();
				ob.world_info.vel.vy = obs.world_info().vel().vy();
				ob.world_info.vel.vz = obs.world_info().vel().vz();
				ob.world_info.length = obs.world_info().length();
				ob.world_info.width = obs.world_info().width();
				ob.world_info.height = obs.world_info().height();
				
				for( int j = 0; j < obs.world_info().poly().pts_size(); j ++ ){
					j2_mono::Point pt;
					pt.x = obs.world_info().poly().pts(j).x();
					pt.y = obs.world_info().poly().pts(j).y();
					pt.z = obs.world_info().poly().pts(j).z();
					ob.world_info.poly.pts.push_back(pt);
				}
				ob.world_info.position.x = obs.world_info().position().x();
				ob.world_info.position.y = obs.world_info().position().y();
				ob.world_info.position.z = obs.world_info().position().z();
				ob.world_info.traversable = obs.world_info().traversable();
				ob.world_info.hmw = obs.world_info().hmw();
				ob.world_info.ttc = obs.world_info().ttc();
				ob.world_info.curr_lane = obs.world_info().curr_lane();
				ob.world_info.sigma_yaw = obs.world_info().sigma_yaw();
				//ob.world_info.sigma_vel = obs.world_info().sigma_vel();
				
				ob.world_info.sigma_height = obs.world_info().sigma_height();
				for( int j = 0; j < obs.world_info().sigma_vel_size(); j ++ ){
					float sv, sp;
					sv = obs.world_info().sigma_vel(j);
					sp = obs.world_info().sigma_position(j);
					ob.world_info.sigma_vel.push_back(sv);
					ob.world_info.sigma_position.push_back(sp);
				}
				for( int j = 0; j < obs.property_size(); j ++ ){
					ob.property.push_back( obs.property(j) );
				}
				for( int j = 0; j < obs.property_name_size(); j ++ ){
					ob.property_name.push_back( obs.property_name(j) );
				}
				for( int j = 0; j < obs.property_type_size(); j ++ ){
					ob.property_type.push_back( obs.property_type(j) );
				}
				for( int j = 0; j < obs.property_conf_size(); j ++ ){
					ob.property_conf.push_back( obs.property_conf(j) );
				}
				//metaPub.data.structure_perception.obstacles.obstacle.push_back(ob);
				obss.obstacle.push_back( ob );
			}
			metaPub.data.structure_perception.obstacles.push_back( obss );;
		}
		
		//-------------------- Free Space Points -------------------------//
		/*if( idx < percepts.scan_pts_size() ){
			const CommonProto::FreeSpacePoints &free_pts = percepts.scan_pts( idx );
			j2_mono::FreeSpacePoints freeSpace;
			for( int i = 0; i < free_pts.pts_img_size(); i ++ ){
				int label = free_pts.property( i );
				if( label == CommonProto::FreeSpacePointType::ParsingLabelType_Invalid ){
					continue;
				}
				freeSpace.property.push_back( label );
				const CommonProto::Point &pt_img = free_pts.pts_img( i );
				const CommonProto::Point &pt_vcs = free_pts.pts_vcs( i ); 
				j2_mono::Point pt1, pt2;
				pt1.x = pt_img.x();
				pt1.y = pt_img.y();
				pt1.z = pt_img.z();
				pt2.x = pt_vcs.x();
				pt2.y = pt_vcs.y();
				pt2.z = pt_vcs.z();
				freeSpace.pts_img.push_back( pt1 );
				freeSpace.pts_vcs.push_back( pt2 );
			} 
			metaPub.data.structure_perception.scan_pts.push_back( freeSpace );
		}*/
		//----------------------------------------------------------------//
		
		if (idx < percepts.lines_size()) {
      			const CommonProto::Lines &lines = percepts.lines(idx);
			j2_mono::Lines lis;
			lis.cam_id = lines.cam_id();
      			for (int i = 0; i < lines.lines_size(); i++) {
        			const CommonProto::Line &line = lines.lines(i);
				j2_mono::Line li;
				li.id = line.id();
				li.life_time = line.life_time();
				for( int j = 0; j < line.coeffs_size(); j ++ ){
					li.coeffs.push_back( line.coeffs( j ) );
				}

				for( int j = 0; j < line.end_points_size(); j ++ ){
					j2_mono::Point pt;
					pt.x = line.end_points(j).x();
					pt.y = line.end_points(j).y();
					pt.z = line.end_points(j).z();
					li.end_points.push_back( pt );
				}
				li.type = line.type();
				li.source = line.source();
				li.dist_to_front_wheel = line.dist_to_front_wheel();
				li.width = line.width();
				li.type_sibling = line.type_sibling();
				li.conf = line.conf();
				for( int j = 0; j < line.sigma_coeffs_size(); j ++ ){
					li.sigma_coeffs.push_back( line.sigma_coeffs(j) );
				}
				lis.lines.push_back( li );
			}
			metaPub.data.structure_perception.lines.push_back( lis );
		
      		}
		if ( idx < percepts.scan_pts_size() ) {
     	 		const CommonProto::FreeSpacePoints &free_pts = percepts.scan_pts(idx);
			j2_mono::FreeSpacePoints fsp;
			fsp.cam_id = free_pts.cam_id();
			for( int j = 0; j < free_pts.property_size(); j ++ ){
				fsp.property.push_back( free_pts.property(j) );
			}
			for( int j = 0; j < free_pts.pts_vcs_size(); j ++ ){
				j2_mono::Point pt;
				pt.x = free_pts.pts_vcs(j).x();	
				pt.y = free_pts.pts_vcs(j).y();
				pt.z = free_pts.pts_vcs(j).z();
				fsp.pts_vcs.push_back( pt );
			}
			for( int j = 0; j < free_pts.pts_img_size(); j ++ ){
                                j2_mono::Point pt;
                                pt.x = free_pts.pts_img(j).x();
                                pt.y = free_pts.pts_img(j).y();
                                pt.z = free_pts.pts_img(j).z();
                                fsp.pts_img.push_back( pt );
                        }
			metaPub.data.structure_perception.scan_pts.push_back( fsp );
		}
	}	
	pub.publish( metaPub );
	return true;
}

/**
* @brief get parsing label property information
* @details this function get the parsing settings and 
*          the property related with the parsing label
* @param meta pointer to meta
*/
void GetParsingInfo(const Meta::Meta *meta) {
  if (g_getparsinginfo) {
    return;
  }

  int settting_count = meta->data().structure_perception().parsing_settings_size();


  if (g_parsinginfo.size() < settting_count) {
    g_parsinginfo.resize(settting_count);
  }
  
  for (int idx = 0; idx < settting_count; idx++) {
    if (idx < meta->data().structure_perception().parsing_settings_size()
        && meta->data().structure_perception().parsing_size()) {
      CommonProto::ParsingSetting parsing_setting =
            meta->data().structure_perception().parsing_settings(idx);

      PrintParsingSettings(parsing_setting);

      g_parsinginfo[idx].InitParsingInfo(
                 &meta->data().structure_perception().parsing_settings(idx),
                 &meta->data().structure_perception().parsing(0),
                 &meta->data().image(0));
    }
  }

  g_getparsinginfo = true;
}

/**
 * @brief get parsing label directly from feature map
 * @details this function takes feature map as input and get the channel with
 *          max conf as corresponding label
 * @param parsing parsing info from meta data
 * @param parsing_data parsing data
 * @return pointer to result parsing label buffer
 */
uint8_t * GetParsingLabelDirectly(const CommonProto::Image &parsing,
                                  const std::vector<int8_t> &parsing_data) {
  // this function support max 32 channel parsing data
  if (parsing.channel() > 32) {
    return NULL;
  }

  int parsing_w = parsing.width();
  int parsing_h = parsing.height();
  int parsing_c = parsing.channel();
  int parsing_depth = 8;
  int parsing_align = 16;
  int channel_step = parsing_depth / 8 * parsing_w * parsing_h * parsing_align;
  int channel_parse_count = (parsing_c + parsing_align - 1) / parsing_align;

  uint8_t *parsing_label = new uint8_t[parsing_w * parsing_h];

  if (channel_parse_count == 1) {
    for (int y = 0; y < parsing_h; y++) {
      const int8_t *ptr = parsing_data.data() + y * 16 * parsing_w;
      uint8_t *plabel = parsing_label + y * parsing_w;
      for (int x = 0; x < parsing_w; x++) {
        int max_id = 0;
        int max_val = -255;
        const int8_t *conf = ptr + parsing_align - 1;
        for (int i = 0; i < parsing_c; i++) {
          if (*conf > max_val) {
            max_id = i;
            max_val = *conf;
          }
          conf--;
        }
        plabel[x] = max_id;
        ptr += parsing_align;
      }
    }
  } else if (channel_parse_count == 2) {
    for (int y = 0; y < parsing_h; y++) {
      const int8_t *ptr = parsing_data.data() + y * 16 * parsing_w;
      uint8_t *plabel = parsing_label + y * parsing_w;;
      for (int x = 0; x < parsing_w; x++) {
        int max_id = 0;
        int max_val = -255;
        // first 16 channel
        for (int i = 0; i < parsing_align; i++) {
          if (ptr[x] > max_val) {
            max_id = i;
            max_val = ptr[x];
          }
        }
        // other channels
        const int8_t *conf = ptr + channel_step + parsing_align - 1;
        for (int i = 0; i < parsing_c; i++) {
          if (*conf > max_val) {
            max_id = parsing_align + i;
            max_val = *conf;
          }
          conf--;
        }

        plabel[x] = max_id;
        ptr += parsing_align;
      }
    }
  }

  return parsing_label;
}

/**
 * @brief get parsing label large
 * @details this function will resize input parsing data to a larger size
 * @param parsing parsing info from meta data
 * @param parsing_data parsing data
 * @return parsing label of larger size
 */
cv::Mat GetParsingLabelLarge(const CommonProto::Image &parsing,
                             const std::vector<int8_t> &parsing_data) {
  int im_w = 1280;
  int im_h = 704;

  int parsing_w = parsing.width();
  int parsing_h = parsing.height();
  int parsing_c = parsing.channel();
  int parsing_depth = parsing.depth();
  int parsing_align = parsing.align();

  int channel_step = parsing_depth / 8 * parsing_w * parsing_h * parsing_align;
  int channel_parse_count = (parsing_c + parsing_align - 1) / parsing_align;

  cv::Mat feature = cv::Mat(parsing_h, parsing_w, CV_8UC(parsing_c));
#define ft_type8 int8_t
  {
    feature = cv::Mat(parsing_h, parsing_w, CV_8UC(parsing_c));

    for (int i = 0; i < channel_parse_count; i++) {
      const ft_type8 *src = (ft_type8 *)parsing_data.data() + i * channel_step;
      int ch_base = i * parsing_align;
      int ch_num = std::min<int>(16, parsing_c - i * parsing_align);

      for (int y = 0; y < parsing_h; y++) {
        ft_type8 *dst = (ft_type8 *)feature.ptr(y);
        for (int x = 0; x < parsing_w; x++) {
          ft_type8 *dst_pt = dst + x * parsing_c + ch_base;
          for (int c = 0; c < ch_num; c++) {
            dst_pt[c] = (int)src[parsing_align - 1 - c] + 128;
          }
          src += parsing_align;
        }
      }
    }
  }

  cv::Mat resized_feature;
  cv::resize(feature, resized_feature, cv::Size(im_w, im_h));

  cv::Mat mat_label = cv::Mat(im_h, im_w, CV_8UC1);

  // get max id
  {
    for (int y = 0; y < im_h; y++) {
      uint8_t *data = (uint8_t *)resized_feature.ptr(y);
      uint8_t *label = (uint8_t *)mat_label.ptr(y);
      for (int x = 0; x < im_w; x++) {
        int max_id = -1;
        int max_conf = -1;
        for (int c = 0; c < parsing_c; c++) {
          if (data[c] > max_conf) {
            max_conf = data[c];
            max_id = c;
          }
        }
        label[x] = max_id;

        data += parsing_c;
      }
    }
  }

  return mat_label;
}

/**
 * @brief RLE decompress
 * @details this function do RLE decompress for the input data
 * @param input_data RLE compressed data
 * @param size length of input compressed data
 * @param output_data pointer to output data
 * @param buf_len length of decompressed data
 * @return success or not
 *  @retval 0 success
 *  @retval < 0 failed
 */
static int RLEDecompress(const uint8_t *input_data,
  int size, uint8_t *output_data, int &buf_len) {
  const uint8_t *ptr = input_data;

  if (ptr[0] != 0xFF || ptr[1] != 'R' || ptr[2] != 'L' || ptr[3] != 'E') {
      std::cout << "RLE header mismatch !!!" << std::endl;
      return -1;
  }

  // Skip the magic number first
  ptr += 4;
  // Then the height and width
  uint16_t height = (*ptr++ << 8) & 0xFF00;
  height |= static_cast<uint16_t>(*ptr++);
  uint16_t width = (*ptr++ << 8) & 0xFF00;
  width |= static_cast<uint16_t>(*ptr++);

  if (height <= 0 || width <= 0) {
    return -1;
  }

  if (buf_len < height * width) {
    return -2;
  }

  buf_len = height * width;

  // Then the data
  int rle_cnt = (size - 8) / 3;
  uint8_t *p_im_data = output_data;
  for (int i = 0; i < rle_cnt; ++i) {
    uint8_t label = *ptr++;
    uint16_t cnt = *reinterpret_cast<const uint16_t *>(ptr);
    ptr += 2;

    for (int j = 0; j < cnt; ++j) {
      *p_im_data++ = label;
    }
  }

  return 0;
}

/**
 * @brief deal with parsing data
 * @param parsing parsing info from meta data
 * @param parsing_data parsing data
 * @param idx index number of parsing data
 * @return None
 */
void DealParsingData(const CommonProto::Image &parsing,
                     const std::vector<int8_t> &parsing_data,
                     int idx) {
  std::cout << "Parsing Size(" << parsing.width() << ", " << parsing.height()
    << ", " << parsing.channel() << ")" << std::endl;

  if (parsing.format() == CommonProto::ParsingFormat_Label) {
    // parsing data is a label image, just use it
    uint8_t *parsing_label = (uint8_t *)parsing_data.data();
    // TODO:
    // deal with parsing label
  } else if (parsing.format() == CommonProto::ParsingFormat_Label_RLE) {
    int buf_len = parsing.width() * parsing.height();
    if (g_rledecompressbuf.size() < buf_len) {
      g_rledecompressbuf.resize(buf_len);
    }

    // Notice:
    // this is just a sample code, which runs in a serial mode
    // Please take care of multi-thread safety if running in a concurrent mode
    int ret = RLEDecompress((uint8_t *)(parsing_data.data()),
        parsing_data.size(), g_rledecompressbuf.data(), buf_len);
    if (ret != 0) {
      std::cout << "RLE decompress failed !!!" << std::endl;
    }
    // TODO:
    // deal with parsing label further
  } else {
    // parsing data is parsing feature map
    // here is just compare each channel and get max conf channel,
    // you should notice how to deal with aligned data
    // this is the fastest way to get parsing label
    {
      long long st = GetTimeStamp();
      uint8_t *parsing_label = NULL;
      parsing_label = GetParsingLabelDirectly(parsing,
                                              parsing_data);
      long long ed = GetTimeStamp();
      std::cout << "GetParsingLabelDirectly consumes " << (ed - st) << "ms" << std::endl;
      // TODO:
      // deal with parsing label

      // Get Undistort label
      int parsing_w = parsing.width();
      int parsing_h = parsing.height();
      cv::Mat label(parsing_h, parsing_w, CV_8UC1,
                    parsing_label, parsing_w);
      cv::Mat undistort_label = g_undistort[idx].UndistortImage(label);

      if (parsing_label) {
        delete[] parsing_label;
        parsing_label = NULL;
      }
    }

    // P.S. if you want better visual effect,
    //      you need resize each channel to image size,
    //      and then get max conf channel
    {
      long long st = GetTimeStamp();
      cv::Mat parsing_label = GetParsingLabelLarge(parsing,
                                                   parsing_data);
      long long ed = GetTimeStamp();
      std::cout << "GetParsingLabelLarge consumes " << (ed - st) << "ms" << std::endl;

      // TODO:
      // deal with parsing label

      // Get Undistort label
      cv::Mat undistort_label = g_undistort[idx].UndistortImage(parsing_label);
    }
  }
}

/**
 * @brief init Undistort
 * @details get undistort map of different scale, avoid re-calculation if input
 *          parameters are quite close to previous ones
 */
void UndistortInfo::InitUndistort(int w, int h, int type,
                                  float focal_u, float focal_v,
                                  float center_u, float center_v,
                                  const float *distort,
                                  int distort_param_num) {
  if (distort_param_num != 4) {
    distort_map1_.clear();
    distort_map2_.clear();
    inited = false;
    return;
  } else if (inited && w == img_w_ && h == img_h_
             && fabs(focal_u - focal_u_) < 0.00001f
             && fabs(focal_v - focal_v_) < 0.00001f
             && fabs(center_u - center_u_) < 0.00001f
             && fabs(center_v - center_v_) < 0.00001f
             && fabs(distort[0] - distort_[0]) < 0.00001f
             && fabs(distort[1] - distort_[1]) < 0.00001f
             && fabs(distort[2] - distort_[2]) < 0.00001f
             && fabs(distort[3] - distort_[3]) < 0.00001f) {
    return;
  }

  img_w_ = w;
  img_h_ = h;
  focal_u_ = focal_u;
  focal_v_ = focal_v;
  center_u_ = center_u;
  center_v_ = center_v;
  distort_.resize(distort_param_num);
  for (int i = 0; i < distort_param_num; i++) {
    distort_[i] = distort[i];
  }

  cv::Mat k_ = (cv::Mat_<float>(3, 3) << focal_u, 0.0f, center_u,
                0.0f, focal_v, center_v,
                0.0f, 0.0f, 1.0f);

  cv::Mat d_(4, 1, CV_32FC1);
  float *dist_data = reinterpret_cast<float *>(d_.ptr(0));
  for (size_t i = 0; i < distort_param_num; i++) {
    dist_data[i] = distort[i];
  }

  if (distort_map1_.size() < 4) {
    distort_map1_.resize(4);
    distort_map2_.resize(4);
  }

  if (type == CommonProto::CameraType::CameraType_FishEye) {
    cv::fisheye::initUndistortRectifyMap(k_, d_,
                                         cv::Matx33d::eye(), k_,
                                         cv::Size(w, h), CV_16SC2,
                                         distort_map1_[0], distort_map2_[0]);
  } else {
    cv::initUndistortRectifyMap(k_, d_,
                                cv::Matx33d::eye(), k_,
                                cv::Size(w, h), CV_16SC2,
                                distort_map1_[0], distort_map2_[0]);
  }

  for (int i = 1; i < 4; i++) {
    int scale = (1 << i);

    cv::resize(distort_map1_[0], distort_map1_[i],
               cv::Size(w / scale, h / scale),
               0.0, 0.0, cv::INTER_NEAREST);
    cv::resize(distort_map2_[0], distort_map2_[i],
               cv::Size(w / scale, h / scale),
               0.0, 0.0, cv::INTER_NEAREST);
    distort_map1_[i] /= scale;
  }

  inited = true;
}

/**
 * @brief Undistort the image
 * @details use pre-generated map to undistort input raw image
 * @param image input raw image
 * @return undistorted image
 */
cv::Mat UndistortInfo::UndistortImage(cv::Mat image) {
  cv::Mat undistort_im;
  if (distort_map1_.empty()) {
    return undistort_im;
  }

  int idx = distort_map1_[0].cols / image.cols - 1;

  cv::Mat map1(image.rows, image.cols,
               distort_map1_[idx].type(),
               distort_map1_[idx].data, distort_map1_[idx].step);
  cv::Mat map2(image.rows, image.cols,
               distort_map2_[idx].type(),
               distort_map2_[idx].data, distort_map2_[idx].step);

  cv::Mat mat_undist;
  {
    cv::remap(image, undistort_im,
              map1, map2,
              cv::INTER_LINEAR, cv::BORDER_CONSTANT);
  }

  return undistort_im;
}

// get ipm matrix
std::vector<cv::Mat> GetIpmMatrix(Meta::Meta *meta, cv::Rect2f roi_,
                                  cv::Size ipm_size_) {
  std::vector<cv::Mat> vec_ipm_matrix;
  MetaData::Data data = meta->data();
  int num = data.camera_matrix_size();
  for (size_t i = 0; i < num; i++) {
    auto cam_matrix = data.camera_matrix(i);
    if (cam_matrix.mat_img2gnd_size() != 9) {
      std::cout << "mat_img2gnd size is not 9" << std::endl;
    }
    cv::Mat local2img(3, 3, CV_32FC1);  // Q
    for (int i = 0; i < 3; ++i) {
      for (int j = 0; j < 3; ++j) {
        local2img.at<float>(i, j) = cam_matrix.mat_local2img(i * 3 + j);
      }
    }

    cv::Mat T_ = cv::Mat::zeros(3, 3, CV_32FC1);
    T_.at<float>(0, 0) = -roi_.width / ipm_size_.width;
    T_.at<float>(0, 2) = roi_.x + roi_.width;
    T_.at<float>(1, 1) = -roi_.height / ipm_size_.height;
    // T_.at<float>(1, 2) = roi_.y - up_pixel_ * roi_.height / ipm_size_.height;
    T_.at<float>(1, 2) = roi_.y;
    T_.at<float>(2, 2) = 1.0f;

    cv::Mat axiss = (cv::Mat_<float>(3, 3) << 0, 1, 0, 1, 0, 0, 0, 0, 1);
    T_ = axiss * T_;
    cv::Mat M_ = local2img * T_;
    // cv::Mat Minv_ = M_.inv();
    vec_ipm_matrix.push_back(M_);
  }
  return vec_ipm_matrix;
}

/**
* @brief initialize the parsing settings
* @param parsing_setting parsing setttings from the meta data
* @param parsing parsing label image information from the meta data
* @image image origin image information from the meta data
* @return pointer to result parsing label buffer
*/
void ParsingInfo::InitParsingInfo(const CommonProto::ParsingSetting *parsing_setting,
                                  const CommonProto::Image *parsing,
                                  const CommonProto::Image *image) {
  if (inited) {
    return;
  }

  parsing_label_width_ = parsing->width();
  parsing_label_height_ = parsing->height();
  parsing_format_ = parsing->format();

  parsing_width_ = image->width();
  parsing_height_ = image->height() / 8 / 8 * 8 * 8;

  parsing_label_channels_ = parsing_setting->parsing_channels();
  parsing_type_ = parsing_setting->parsing_type();

  if (channel_label_.size() < parsing_label_channels_) {
    channel_label_.resize(parsing_label_channels_);
  }

  if (channel_color_.size() < parsing_label_channels_) {
    channel_color_.resize(parsing_label_channels_);
  }

  for (int idx = 0; idx < parsing_label_channels_; idx++) {
    channel_label_[idx] = parsing_setting->channel_labels(idx);

    channel_color_[idx].set_b(parsing_setting->channel_colors(idx).b());
    channel_color_[idx].set_g(parsing_setting->channel_colors(idx).g());
    channel_color_[idx].set_r(parsing_setting->channel_colors(idx).r());
  }

  for (int idx_type = 0; idx_type < parsing_label_count; idx_type++) {
    label_map_.insert(std::pair<std::string, long long>(parsing_label_name[idx_type], 1LL << idx_type));
  }

  inited = true;

  parsing_ids_inited_ = false;
  parsing_id_inited_ = false;
}

/**
* @brief get parsing label mat
* @details this functuion takes parsing label mat from the buffer
* @param parsing_data parsing data
* @return none
*/
cv::Mat ParsingInfo::GetParsingLabelMat(SharedVector(uint8_t) parsing_data) {
  if ((parsing_label_height_ <= 0) || (parsing_label_width_ <= 0)) {
   return cv::Mat();
  }

  if (parsing_format_ != CommonProto::ParsingFormat_Label_RLE) {
    std::cout << "Only RLE is supported only !" << std::endl;
    return cv::Mat();
  }

  int buf_len = parsing_label_width_ * parsing_label_height_;

  static std::vector<uint8_t> buf;
  if (buf.size() < buf_len) {
    buf.resize(buf_len);
  }

  int ret = RLEDecompress(reinterpret_cast<uint8_t *>(parsing_data->data()),
    parsing_data->size(), buf.data(), buf_len);
  if (ret != 0) {
    std::cout << "RLE decompress failed !!!" << std::endl;
  }

  return cv::Mat(parsing_label_height_,
                       parsing_label_width_, CV_8UC1, buf.data(),
                       parsing_label_width_);
}

/**
* @brief get the full parsing image
* @details this functuion takes the color image of the 
*          parsing label from the label mat
* @param none
* @return pointer to result parsing label buffer
*/
cv::Mat ParsingInfo::GetParsingMat(cv::Mat &label) {
  if (label.empty()
      || channel_label_.empty()
      || channel_color_.empty()) {
    return cv::Mat();
  }

  cv::Mat color_label(parsing_label_height_, parsing_label_width_, CV_8UC3);

  for (int y = 0; y < parsing_label_height_; y++) {
    uint8_t *pl = reinterpret_cast<uint8_t *>(label.ptr(y));
    uint8_t *color = reinterpret_cast<uint8_t *>(color_label.ptr(y));
    for (int x = 0; x < parsing_label_width_; x++) {
      int max_id = pl[x];
      if (parsing_type_ == ParsingType_LaneParsing) {
        for (int idx = 0; idx < parsing_label_channels_; idx++) {
          if (pl[x] & channel_label_[idx]) {
            max_id = idx;
            break;
          }
        }
      }
      *color++ = channel_color_[max_id].r();
      *color++ = channel_color_[max_id].g();
      *color++ = channel_color_[max_id].b();
    }
  }

  return color_label;
}

/**
* @brief get one channel parsing image
* @details this functuion takes the color image of the channel @name
* @param name channel name of the label 
*        see @parsing_label_name
* @return pointer to result parsing label buffer
*/
cv::Mat ParsingInfo::GetParsingMatByName(cv::Mat &label, std::string name) {
  if (label.empty()) {
    return cv::Mat();
  }

  cv::Mat color_label(parsing_label_height_, parsing_label_width_, CV_8UC3);

  if (!parsing_id_inited_) {
    uint64 parsing_lable;
    parsing_lable = label_map_[name];

    for (int idx = 0; idx < parsing_label_channels_; idx++) {
      if (parsing_lable & channel_label_[idx]) {
        parsing_id_ = idx;
        break;
      }
    }
    parsing_id_inited_ = true;
  }

  for (int y = 0; y < parsing_label_height_; y++) {
    uint8_t *pl = reinterpret_cast<uint8_t *>(label.ptr(y));
    uint8_t *color = reinterpret_cast<uint8_t *>(color_label.ptr(y));
    for (int x = 0; x < parsing_label_width_; x++) {
      int max_id = pl[x];
      if (max_id == parsing_id_) {
        *color++ = channel_color_[max_id].r();
        *color++ = channel_color_[max_id].g();
        *color++ = channel_color_[max_id].b();
      }
      else {
        *color++ = 0x00;
        *color++ = 0x00;
        *color++ = 0x00;
      }
    }
  }

  return color_label;
}

static bool IsNamesParsing(int id, std::set<int> &ids) {
  std::set<int>::iterator it;
  
  for (it = ids.begin(); it != ids.end(); it++) {
    if ((*it) == id) {
      return true;
    }
  }

  return false;
}

/**
* @brief get the channels of parsing image
* @details this functuion takes the color image of channels @names
* @param namea channel namea of the label
*        see @parsing_label_name
* @return pointer to result parsing label buffer
*/
cv::Mat ParsingInfo::GetParsingMatByNames(cv::Mat &label, std::initializer_list<std::string> names) {
  if (label.empty()) {
    return cv::Mat();
  }

  cv::Mat color_label(parsing_label_height_, parsing_label_width_, CV_8UC3);

  if (!parsing_ids_inited_) {
    std::vector<uint64> parsing_label;
    parsing_label.resize(names.size());
    std::cout << names.size() << " types" << std::endl;

    int parsing_label_type = 0;
    for (auto it = names.begin(); it != names.end(); it++) {
      parsing_label[parsing_label_type] = label_map_[*it];
      std::cout << " parsing label type " << parsing_label_type << " -> "
                << parsing_label[parsing_label_type] << std::endl;
      parsing_label_type++;
    }

    for (int idx_type = 0; idx_type < parsing_label_type; idx_type++) {
      for (int idx_channel = 0; idx_channel < parsing_label_channels_; idx_channel++) {
        if (parsing_label[idx_type] & channel_label_[idx_channel]) {
          parsing_ids_.insert(idx_channel);
          break;
        }
      }
    }
    std::cout << "id types: " << parsing_ids_.size() << std::endl;
    parsing_ids_inited_ = true;
  }

  for (int y = 0; y < parsing_label_height_; y++) {
    uint8_t *pl = reinterpret_cast<uint8_t *>(label.ptr(y));
    uint8_t *color = reinterpret_cast<uint8_t *>(color_label.ptr(y));
    for (int x = 0; x < parsing_label_width_; x++) {
      int max_id = pl[x];
        if(IsNamesParsing(max_id, parsing_ids_)) {
          *color++ = channel_color_[max_id].r();
          *color++ = channel_color_[max_id].g();
          *color++ = channel_color_[max_id].b();
        }
        else {
          *color++ = 0x00;
          *color++ = 0x00;
          *color++ = 0x00;
        }
      }
    }

  return color_label;
}

static std::map<int, std::string> weather_map = {
  { CommonProto::WeatherType::WEATHER_NORMAL, "normal" },
  { CommonProto::WeatherType::WEATHER_NORMAL2, "normal" },
  { CommonProto::WeatherType::WEATHER_RAINY, "rainy" },
  { CommonProto::WeatherType::WEATHER_SNOWY, "snowy" },
  { CommonProto::WeatherType::WEATHER_HEAVYRAIN, "heavy_rain" },
  { CommonProto::WeatherType::WEATHER_OTHER, "other" },
};

void DealWithSerializedData(const FrameInfo *frame) {
  const auto &data_descs = frame->meta.data().data_descriptor();

  int data_idx = 1;   // first data is meta info
  for (int i = 0; i < data_descs.size(); i++) {
    const CommonProto::DataDescriptor &data_desc = data_descs.Get(i);
    SharedVector(uint8_t) data;
    if (data_desc.data().with_data_field()) {
      data = frame->all_data[data_idx++];
    }

    // std::cout << data_desc.type() << std::endl;
    if (data_desc.type() == "image") {
      // TODO: deal with image
      // sample code already dealt with this msg with other function
      // you can still implement your code here
    } else if (data_desc.type() == "parsing") {
      // TODO: deal with parsing
      // sample code already dealt with this msg with other function
      // you can still implement your code here
    } else if (data_desc.type() == "lane_parsing") {
      // TODO: deal with lane_parsing
      // sample code already dealt with this msg with other function
      // you can still implement your code here
    } else if (data_desc.type() == "parsing_conf") {
      CommonProto::Image parsing_conf_proto;
      parsing_conf_proto.ParseFromArray(data_desc.data().proto().data(),
                                        data_desc.data().proto().length());
      int idx = data_desc.data().channel();  // indicate camera channel
      uint8_t *parsing_confs = data->data();  // conf data
    } else if (data_desc.type() == "perception_done_ts") {
      int64_t ts = *(int64_t *)data_desc.data().proto().data();

      int latency = frame->meta.data().image(0).time_stamp() - ts;
    } else if (data_desc.type() == "weather_type") {
      CommonProto::WorkCondition wc;
      wc.ParseFromArray(data_desc.data().proto().data(),
                        data_desc.data().proto().length());
      // std::cout << data_desc.type() << " "
      //  << weather_map[wc.category().property()]
      //  << ", score " << wc.category().property_conf() << std::endl;
    } else if (data_desc.type() == "image_quality") {
      CommonProto::ImageFail ifs;
      ifs.ParseFromArray(data_desc.data().proto().data(),
                         data_desc.data().proto().length());
      int cam_id = ifs.cam_id();
      int frame_id = ifs.frame_id();
      static const std::vector<std::pair<int, std::string> > fail_types = {
        {0, "normal"},
        {1, "blur" },
        {2, "shelter" },
        {4, "freeze" },
        {8, "glare" }
      };
      for (int i = 0; i < ifs.fail_status_size(); i++) {
        const CommonProto::ImageFailStatus &status = ifs.fail_status(i);
        for (auto fail_type : fail_types) {
          if (status.fail_type() & fail_type.first) {
            std::cout << "image " << fail_type.second
              << ", score " << status.score()
              << ", level " << status.level()
              << std::endl;
          }
        }
      }
    } else {
      // TODO: other types
    }
  }
}


