//
// Copyright 2018 Horizon Robotics.
//
#include "udp_receiver.h"
#include <string>

UDPReceiverBase::UDPReceiverBase() {
}

bool UDPReceiverBase::AddTargetServer(const std::string &target_server) {
  std::lock_guard<std::mutex> lck(mutex_target_);
  unsigned long addr = inet_addr(target_server.c_str());
  auto iter = target_server_.find(addr);
  if (iter == target_server_.end()) {
    target_server_[addr] = target_server;
  }
  return false;
}

void UDPReceiverBase::RemoveTargetServer(const std::string &target_server) {
  std::lock_guard<std::mutex> lck(mutex_target_);
  unsigned long addr = inet_addr(target_server.c_str());
  auto iter = target_server_.find(addr);
  if (iter != target_server_.end()) {
    target_server_.erase(iter);
  }
}

void UDPReceiverBase::Init() {
  int ret;
#ifdef _WIN32
  WSADATA wsaData;
  ret = WSAStartup(MAKEWORD(2, 2), &wsaData);
  if (ret != NO_ERROR) {
    printf("WSAStartup failed with error %d\n", ret);
    return;
  }

  // create udp socket
  recv_socket_ = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
  if (recv_socket_ == INVALID_SOCKET) {
    printf("socket failed with error %d\n", WSAGetLastError());
    return;
  }

  // get socket option
  int optval;
  int optlen = sizeof(int);
  getsockopt(recv_socket_, SOL_SOCKET, SO_RCVBUF, (char *)&optval, &optlen);
  getsockopt(recv_socket_, SOL_SOCKET, SO_SNDBUF, (char *)&optval, &optlen);

  // set socket option
  optval = 1024 * 1024;
  ret = setsockopt(recv_socket_,
    SOL_SOCKET, SO_RCVBUF, (char *)&optval, optlen);
  if (ret == SOCKET_ERROR) {
    printf("setsockopt for SO_RCVBUF failed with error: %u\n",
      WSAGetLastError());
  }
  ret = setsockopt(recv_socket_,
    SOL_SOCKET, SO_SNDBUF, (char *)&optval, optlen);
  if (ret == SOCKET_ERROR) {
    printf("setsockopt for SO_SNDBUF failed with error: %u\n",
      WSAGetLastError());
  }
  {
    int to = 100;
    int size_to = sizeof(to);
    ret = setsockopt(recv_socket_,
      SOL_SOCKET, SO_RCVTIMEO, (char *)&to, size_to);
  }

  // check option
  getsockopt(recv_socket_,
    SOL_SOCKET, SO_RCVBUF, (char *)&optval, &optlen);
  getsockopt(recv_socket_,
    SOL_SOCKET, SO_SNDBUF, (char *)&optval, &optlen);

  // bind socket
  sockaddr_in socket_addr;
  socket_addr.sin_family = AF_INET;
  socket_addr.sin_port = htons(bind_port_);
  socket_addr.sin_addr.S_un.S_addr = INADDR_ANY;
  if (bind(recv_socket_, (sockaddr *)&socket_addr,
    sizeof(socket_addr)) != 0) {
    printf("bind port %d failed with error %d\n",
      bind_port_, WSAGetLastError());
    closesocket(recv_socket_);
    return;
  }
#else
  // create udp socket
  if ((recv_socket_ = socket(PF_INET, SOCK_DGRAM, 0)) < 0) {
    printf("create socket failed with error %s\n", strerror(errno));
    return;
  }

  // get socket option
  int optval;
  socklen_t optlen = sizeof(int);
  struct timeval to;
  getsockopt(recv_socket_, SOL_SOCKET, SO_RCVBUF, (char *)&optval, &optlen);
  // printf("SO_RCVBUF: %d\n", optval);
  getsockopt(recv_socket_, SOL_SOCKET, SO_SNDBUF, (char *)&optval, &optlen);
  // printf("SO_SNDBUF: %d\n", optval);

  // set socket option
  optval = 1024 * 1024;
  ret = setsockopt(recv_socket_,
    SOL_SOCKET, SO_RCVBUF, (char *)&optval, optlen);
  if (ret == -1) {
    printf("setsockopt for SO_RCVBUF failed with error: %s\n",
      strerror(errno));
  }
  ret = setsockopt(recv_socket_,
    SOL_SOCKET, SO_SNDBUF, (char *)&optval, optlen);
  if (ret == -1) {
    printf("setsockopt for SO_SNDBUF failed with error: %s\n",
      strerror(errno));
  }

  // check option
  getsockopt(recv_socket_,
    SOL_SOCKET, SO_RCVBUF, (char *)&optval, &optlen);
  // printf("SO_RCVBUF: %d\n", optval);
  getsockopt(recv_socket_,
    SOL_SOCKET, SO_SNDBUF, (char *)&optval, &optlen);
  // printf("SO_SNDBUF: %d\n", optval);

  {
    struct timeval to;
    to.tv_sec = 0;
    to.tv_usec = 100 * 1000;
    int size_to = sizeof(to);
    ret = setsockopt(recv_socket_,
                     SOL_SOCKET, SO_RCVTIMEO, (char *)&to, size_to);
  }
  // bind socket
  sockaddr_in socket_addr;
  socket_addr.sin_family = AF_INET;
  socket_addr.sin_port = htons(bind_port_);
  socket_addr.sin_addr.s_addr = INADDR_ANY;
  if ((ret = bind(recv_socket_,
    (sockaddr *)&socket_addr, sizeof(socket_addr))) != 0) {
    printf("bind failed with error %d\n", ret);
    close(recv_socket_);
    return;
  }
#endif
  int buf_len = sizeof(struct UDP_packet) + UDP_PACKET_LEN;
  recv_buf_ = reinterpret_cast<char *>(malloc(buf_len));
  cur_frame_id = 0;
  stop_udp_receive_ = false;
}

UDPReceiverBase::~UDPReceiverBase() {
  // stop receive thread
  StopReceive();
  free(recv_buf_);
#ifdef _WIN32
  closesocket(recv_socket_);
  WSACleanup();
#else
  close(recv_socket_);
#endif
}

void UDPReceiverBase::Reconnect() {
  // udp need no reconnect.
}

void UDPReceiverBase::StopReceive() {
  stop_udp_receive_ = true;
  if (udp_do_receive_.joinable()) {
    udp_do_receive_.join();
  }
}

void UDPReceiverBase::UDPDoReceive() {
}

LogUDPReceiver::LogUDPReceiver() {
  bind_port_ = 33333;
  cur_frame_log_len = 0;
  write_idx_ = 0;
  receiving_frame_list_.resize(FRAME_BUF_NUM);
  for (int i = 0; i < receiving_frame_list_.size(); i++) {
    receiving_frame_list_[i].log_len = -1;
    receiving_frame_list_[i].log_data = new unsigned char[LOG_UDP_DATA_LEN];
    memset(receiving_frame_list_[i].log_data, 0, LOG_UDP_DATA_LEN);
  }
  // initialize udp network
  Init();
  // create udp receive thread
  udp_do_receive_ = std::thread([this]{this->UDPDoReceive();});
}

LogUDPReceiver::~LogUDPReceiver() {
  StopReceive();
  // release resources.
  for (auto iter = receiving_frame_list_.begin();
    iter != receiving_frame_list_.end(); iter++) {
    iter->Delete();
  }
}

void LogUDPReceiver::UDPDoReceive() {
  sockaddr_in remote_addr;
#ifdef _WIN32
  int addr_len = sizeof(remote_addr);
#else
  socklen_t addr_len = sizeof(remote_addr);
#endif
  int buf_len = sizeof(struct UDP_packet) + UDP_PACKET_LEN;
  struct UDP_packet udp_packet;

 /*
  * in UDP mode, one frame is divided into many packets,
  * need to collect all the packets of one frame and assemble.
  */

  while (!stop_udp_receive_) {
    int ret = recvfrom(recv_socket_, recv_buf_, buf_len, 0,
                       (sockaddr *)&remote_addr, &addr_len);
    // receive fail.
#ifdef _WIN32
    if (ret == SOCKET_ERROR) {
      // printf("recvfrom failed with error %d\n", WSAGetLastError());
      continue;
    }
#else
    if (ret == -1) {
      // printf("recvfrom failed with error %s\n", strerror(errno));
      continue;
    }
#endif
    std::string server_ip;
    {
      std::lock_guard<std::mutex> lck(mutex_target_);
      auto iter = target_server_.find(remote_addr.sin_addr.s_addr);
      if (iter == target_server_.end()) {
        continue;
      }
      server_ip = iter->second;
    }
    // cache more than max len, abandon the early one,
    // save the latest ones.
    {
      std::unique_lock<std::mutex> frame_list_lock(mtx_);
      if (cached_frame_list_.size() == FRAME_BUF_NUM) {
        cached_frame_list_.pop_front();
        // printf("frame buffer full, abandon the old packet.\n");
      }
    }
    // begin assemble.
    {
      memcpy(&udp_packet, recv_buf_, sizeof(udp_packet));
      if (udp_packet.frame_id != cur_frame_id && cur_frame_log_len != 0) {
        // end last frame's recv.
        // receive frame successfully.
        cur_frame_log_len = 0;
        std::unique_lock<std::mutex> frame_list_lock(mtx_);
        cached_frame_list_.push_back(receiving_frame_list_[write_idx_]);
        cv_.notify_one();
        if (write_idx_ < receiving_frame_list_.size() - 1)
          write_idx_++;
        else
          write_idx_ = 0;
        memset(receiving_frame_list_[write_idx_].log_data, 0, LOG_UDP_DATA_LEN);
        // memset(&cur_receive_frame, 0, sizeof(LogInfo));
        cur_frame_id = udp_packet.frame_id;
      }

      int offset = udp_packet.packet_id * UDP_PACKET_LEN;
      if (udp_packet.type == PACKET_TYPE_LOG) {
        receiving_frame_list_[write_idx_].server_ip = server_ip;;
        receiving_frame_list_[write_idx_].log_len = udp_packet.buf_len;
        memcpy(receiving_frame_list_[write_idx_].log_data + offset,
          recv_buf_ + sizeof(udp_packet), udp_packet.packet_len);
        cur_frame_log_len += udp_packet.packet_len;
      }
    }
  }
}

int LogUDPReceiver::RecvFrame(LogInfo * frame) {
  std::unique_lock<std::mutex> frame_list_lock(mtx_);
  std::cv_status status = std::cv_status::no_timeout;
  if (cached_frame_list_.empty()) {
    status = cv_.wait_for(frame_list_lock, std::chrono::milliseconds(100));
  }
  if (status == std::cv_status::timeout
      || cached_frame_list_.empty()) {
    return -1;
  }

  *frame = cached_frame_list_.front();
  cached_frame_list_.pop_front();
  return 0;
}

ImageUDPReceiver::ImageUDPReceiver() {
  bind_port_ = 33366;
  write_idx_ = 0;
  cur_image_data_len_ = 0;
  receiving_frame_list_.resize(FRAME_BUF_NUM);
  for (int i = 0; i < receiving_frame_list_.size(); i++) {
    receiving_frame_list_[i].image_len_ = -1;
    receiving_frame_list_[i].image_data_ = new unsigned char[IMAGE_DATA_LEN];
    memset(receiving_frame_list_[i].image_data_, 0, IMAGE_DATA_LEN);
  }
  // initialize udp network
  Init();
  // create udp receive thread
  udp_do_receive_ = std::thread([this]{this->UDPDoReceive();});
}

ImageUDPReceiver::~ImageUDPReceiver() {
  StopReceive();
  // release resources.
  for (auto iter = receiving_frame_list_.begin();
    iter != receiving_frame_list_.end(); iter++) {
    iter->Delete();
  }
}

void ImageUDPReceiver::UDPDoReceive() {
  sockaddr_in remote_addr;
#ifdef _WIN32
  int addr_len = sizeof(remote_addr);
#else
  socklen_t addr_len = sizeof(remote_addr);
#endif
  int buf_len = sizeof(struct UDP_packet) + UDP_PACKET_LEN;
  struct UDP_packet udp_packet;

 /*
  * in UDP mode, one frame is divided into many packets,
  * need to collect all the packets of one frame and assemble.
  */

  while (!stop_udp_receive_) {
    int ret = recvfrom(recv_socket_, recv_buf_, buf_len, 0,
                       reinterpret_cast<sockaddr *>(&remote_addr), &addr_len);
    // receive fail.
#ifdef _WIN32
    if (ret == SOCKET_ERROR) {
      // printf("recvfrom failed with error %d\n", WSAGetLastError());
      continue;
    }
#else
    if (ret == -1) {
      // printf("recvfrom failed with error %s\n", strerror(errno));
      continue;
    }
#endif
    std::string server_ip;
    {
      std::lock_guard<std::mutex> lck(mutex_target_);
      auto iter = target_server_.find(remote_addr.sin_addr.s_addr);
      if (iter == target_server_.end()) {
        continue;
      }
      server_ip = iter->second;
    }
    // cache more than max len, abandon the early one,
    // save the latest ones.
    {
      std::unique_lock<std::mutex> frame_list_lock(mtx_);
      if (cached_frame_list_.size() == FRAME_BUF_NUM) {
        cached_frame_list_.pop_front();
        printf("frame buffer full, abandon the old packet.\n");
      }
    }
    // begin assemble.
    {
      memcpy(&udp_packet, recv_buf_, sizeof(udp_packet));
      // printf("udp packet frame id: %u\n", udp_packet.frame_id);
      if (udp_packet.frame_id != cur_frame_id && cur_image_data_len_ != 0) {
        // end last frame's receive.
        if (cur_image_data_len_ ==
          receiving_frame_list_[write_idx_].image_len_) {
          // receive frame successfully.
          std::unique_lock<std::mutex> frame_list_lock(mtx_);
          cached_frame_list_.push_back(receiving_frame_list_[write_idx_]);
          cv_.notify_one();
        }
        if (write_idx_ < receiving_frame_list_.size() - 1) {
          write_idx_++;
        } else {
          write_idx_ = 0;
        }
        memset(receiving_frame_list_[write_idx_].image_data_,
          0, IMAGE_DATA_LEN);
        // memset(&cur_receive_frame, 0, sizeof(LogInfo));
        cur_frame_id = udp_packet.frame_id;
        cur_image_data_len_ = 0;
      }

      int offset = udp_packet.packet_id * UDP_PACKET_LEN;
      if (udp_packet.type == PACKET_TYPE_IMG_ONLY) {
        receiving_frame_list_[write_idx_].server_ip_ = server_ip;;
        receiving_frame_list_[write_idx_].image_len_ = udp_packet.buf_len;
        receiving_frame_list_[write_idx_].frame_id = udp_packet.frame_id;
        memcpy(receiving_frame_list_[write_idx_].image_data_ + offset,
          recv_buf_ + sizeof(udp_packet), udp_packet.packet_len);
        cur_image_data_len_ += udp_packet.packet_len;
        cur_frame_id = udp_packet.frame_id;
      }
    }
  }
}

int ImageUDPReceiver::RecvFrame(ImageData *frame) {
  std::unique_lock<std::mutex> frame_list_lock(mtx_);
  std::cv_status status = std::cv_status::no_timeout;
  // printf("cached frame list size: %d\n", cached_frame_list_.size());
  if (cached_frame_list_.empty()) {
    // status = cv_.wait_for(frame_list_lock, std::chrono::milliseconds(3000));
    status = cv_.wait_for(frame_list_lock, std::chrono::milliseconds(3000));
  }
  if (status == std::cv_status::timeout
      || cached_frame_list_.empty()) {
    printf("udp receive timeout, get no image.\n");
    return -1;
  }

  *frame = cached_frame_list_.front();
  cached_frame_list_.pop_front();
  return 0;
}

int ImageUDPReceiver::GetFrontFrameID(uint8_t &frame_id) {
  std::unique_lock<std::mutex> frame_list_lock(mtx_);
  std::cv_status status = std::cv_status::no_timeout;
  if (cached_frame_list_.empty()) {
    // status = cv_.wait_for(frame_list_lock, std::chrono::milliseconds(3000));
    status = cv_.wait_for(frame_list_lock, std::chrono::milliseconds(3000));
  }
  if (status == std::cv_status::timeout
      || cached_frame_list_.empty()) {
    printf("udp receive timeout, get no image.\n");
    return -1;
  }

  ImageData frame = cached_frame_list_.front();
  frame_id = frame.frame_id;
  return 0;
}
