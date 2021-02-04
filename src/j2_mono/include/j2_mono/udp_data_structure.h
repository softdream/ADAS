//
// Copyright 2018 Horizon Robotics.
//
#ifndef MATRIX_DEV_SDK_IMPLEMENT_UDP_DATA_STRUCTURE_H_
#define MATRIX_DEV_SDK_IMPLEMENT_UDP_DATA_STRUCTURE_H_

#include <iostream>
#include <string>

// one udp packet data part's length
#define UDP_PACKET_LEN 1024
// cached frames' num for pipeline
#define FRAME_BUF_NUM 20

// packet type for complete frame receiver
#define PACKET_TYPE_META 0
#define PACKET_TYPE_IMG 1
#define PACKET_TYPE_PARSING 2

// packet type for log receiver
#define PACKET_TYPE_LOG 0

// packet type for image-only receiver
#define PACKET_TYPE_IMG_ONLY 0

#define LOG_UDP_DATA_LEN (12 * 1024)
#define IMAGE_DATA_LEN (2 * 1024 * 1024)

extern int errno;

struct UDP_packet {
  // identifier, loop from 1 ~ 0xFF.
  uint8_t frame_id;

  // can be meta(0), original image(1), parsing image(2).
  uint8_t type;

  // can fill in image info, default memset 0.
  uint16_t descriptor;

  // these splitted packets total nums.
  uint16_t packet_total;

  // for recovering packets order.
  uint16_t packet_id;

  // this packet's length.
  uint16_t packet_len;

  // all packets' total length.
  uint32_t buf_len;
  // following packet data.
  // uint8_t *data;
};

struct LogInfo {
  LogInfo() {
    log_data = NULL;
    log_len = 0;
  }

  void Delete() {
    if (log_data) {
      delete log_data;
      log_data = NULL;
    }
  }
  unsigned char *log_data;
  int log_len;
  std::string server_ip;
};

struct ImageData {
  ImageData() {
    image_data_ = NULL;
    image_len_ = 0;
  }
  void Delete() {
    if (image_data_) {
      delete image_data_;
      image_data_ = NULL;
    }
  }
  uint8_t frame_id;
  unsigned char *image_data_;
  int image_len_;
  std::string server_ip_;
};


#endif  // MATRIX_DEV_SDK_IMPLEMENT_UDP_DATA_STRUCTURE_H_
