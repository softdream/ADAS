/**
 * @file DataReceiver.cpp
 * @brief implentation of DataReceiver class member functions
 * @author Song Wei
 * @email wei.song@horizon.ai
 * @version 1.0
 */

#include "DataReceiver.h"
#include <assert.h>

/**
 * @brief Constructor of class DataReceiver
 */
DataReceiver::DataReceiver() {

};

/**
 * @brief init the connection to the ZMQ data provider
 * @param endpoint IP address and port of data provider to connect with
 * @return None
 */
void DataReceiver::init(const char* endpoint) {
  if (m_endpoint != endpoint)
  {
    strcpy(m_endpoint, endpoint);
  }

  m_context = zmq_ctx_new();
  // Socket to talk to server
  m_requester = zmq_socket(m_context, ZMQ_SUB);//

  int hwm = 5;
  zmq_setsockopt(m_requester, ZMQ_RCVHWM, &hwm, sizeof(int));
  int rcvbuf = 20 * 1048576;
  zmq_setsockopt(m_requester, ZMQ_RCVBUF, &rcvbuf, sizeof(int));
  zmq_setsockopt(m_requester, ZMQ_SUBSCRIBE, "", 0);

  if (zmq_connect(m_requester, m_endpoint) < 0) {
    return;
  }
  zmq_msg_init(&m_recv_msg);
  recv_fail_count = 0;
}

/**
 * @brief Destructor of class DataReceiver
 */
DataReceiver::~DataReceiver() {
  zmq_msg_close(&m_recv_msg);
  zmq_close(m_requester);
  zmq_ctx_destroy(m_context);
}

/**
 * @brief reconnect to data provider in case of unexpected disconnect
 */
void DataReceiver::reconnect() {

  zmq_msg_close(&m_recv_msg);
  zmq_close(m_requester);
  zmq_ctx_destroy(m_context);

  init(m_endpoint);
}

/**
 * @brief receive data frame from data provider
 * @details receive sequence: meta -> raw image -> parsing data
 * @param frame pointer to frame struct
 * @return receive status
 *  @retval 0 failed
 *  @retval 1 success
 */
int DataReceiver::RecvFrame(FrameInfo *frame) {
  int recv_to = 50;   // 500 ms;
  zmq_setsockopt(m_requester, ZMQ_RCVTIMEO, &recv_to, sizeof(int));
  if(recv_fail_count > 5000 / recv_to){
    std::cout<< __LINE__ << "Reconnect to "<< m_endpoint << std::endl;
  }
  //int len = zmq_msg_recv(&m_recv_msg, m_requester, 0);

  int more;
  size_t more_size = sizeof(more);

  // recv frame structure
  {
    zmq_msg_t msg_proto;
    int rc = zmq_msg_init(&msg_proto);
    assert(rc == 0);

    rc = zmq_msg_recv(&msg_proto, m_requester, 0);
    if (rc == -1) {
      recv_fail_count++;
      return 0;
    }
    recv_fail_count = 0;

    int protolen = zmq_msg_size(&msg_proto);

    SharedVector(uint8_t) vec
      = std::make_shared<std::vector<uint8_t> >();
    vec->resize(protolen);
    memcpy(vec->data(), zmq_msg_data(&msg_proto), protolen);
    frame->all_data.push_back(vec);

    frame->meta.ParseFromArray(zmq_msg_data(&msg_proto), protolen);
    frame->send_mode = frame->meta.data().image(0).send_mode();
    frame->image_format = frame->meta.data().image(0).format();

    zmq_msg_close(&msg_proto);
  }

  zmq_getsockopt(m_requester, ZMQ_RCVMORE, &more, &more_size);
  if (!more) {
    return 0;
  }

 if (!((frame->send_mode & 4) && (frame->image_format != CommonProto::ImageFormat::JPEG))) {
    int img_count = frame->meta.data().image_size();
    frame->img_data.resize(img_count);
    // recv frame data
    for (int i = 0; i < img_count; i++) {
      zmq_msg_t msg;
      int rc = zmq_msg_init(&msg);
      assert(rc == 0);
      rc = zmq_msg_recv(&msg, m_requester, 0);
      int dlen = zmq_msg_size(&msg);

      SharedVector(uint8_t) vec
        = std::make_shared<std::vector<uint8_t> >();
      vec->resize(dlen);
      memcpy(vec->data(), zmq_msg_data(&msg), dlen);
      frame->all_data.push_back(vec);

      frame->img_data[i] = vec;

      zmq_msg_close(&msg);
    }
  }

  // recv parsing data
  zmq_getsockopt(m_requester, ZMQ_RCVMORE, &more, &more_size);
  if (more) {
    int parsing_count = frame->meta.data().structure_perception().parsing_size();
    frame->parsing_data.resize(parsing_count);
    for (int i = 0; i < parsing_count; i++) {
      zmq_msg_t msg;
      int rc = zmq_msg_init(&msg);
      rc = zmq_msg_recv(&msg, m_requester, 0);
      int dlen = zmq_msg_size(&msg);

      SharedVector(uint8_t) vec
        = std::make_shared<std::vector<uint8_t> >();
      vec->resize(dlen);
      memcpy(vec->data(), zmq_msg_data(&msg), dlen);
      frame->all_data.push_back(vec);

      frame->parsing_data[i] = vec;
      zmq_msg_close(&msg);
    }
  }

  while (true) {
    zmq_getsockopt(m_requester, ZMQ_RCVMORE, &more, &more_size);
    if (!more) {
      break;
    }

    zmq_msg_t msg;
    int rc = zmq_msg_init(&msg);
    rc = zmq_msg_recv(&msg, m_requester, 0);

    int dlen = zmq_msg_size(&msg);
    SharedVector(uint8_t) vec
      = std::make_shared<std::vector<uint8_t> >();
    vec->resize(dlen);
    memcpy(vec->data(), zmq_msg_data(&msg), dlen);
    frame->all_data.push_back(vec);

    zmq_msg_close(&msg);
  }

  frame->ts = GetTimeStamp();
  return 1;
}
