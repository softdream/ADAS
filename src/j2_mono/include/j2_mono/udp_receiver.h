//
// Copyright 2018 Horizon Robotics.
//
#ifndef  MATRIX_DEV_SDK_IMPLEMENT_UDP_RECEIVER_H_
#define  MATRIX_DEV_SDK_IMPLEMENT_UDP_RECEIVER_H_

#define _CRT_SECURE_NO_DEPRECATE

#ifdef _WIN32
#pragma comment(lib, "ws2_32.lib")
#endif

#include <stdio.h>
#include <string.h>
#include <assert.h>

#include <iostream>
#include <thread>
#include <mutex>
#include <utility>
#include <string>
#include <vector>
#include <map>
#include <list>
#include <condition_variable>

#ifndef _WIN32
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#else
#include <winsock2.h>
#include <Windows.h>
#endif

#include "udp_data_structure.h"

/******************************************************************************/
/*  declaration for udp receiver base                                         */
/******************************************************************************/

class UDPReceiverBase {
 public:
  UDPReceiverBase();
  ~UDPReceiverBase();

  void Init();
  void Reconnect();

  bool AddTargetServer(const std::string &target_server);
  void RemoveTargetServer(const std::string &target_server);

  // inherit class assemble the specific frame.
  virtual void UDPDoReceive() = 0;
  void StopReceive();

  // inherit class implement int RecvFrame(T *frame) to get one frame

 protected:
  int bind_port_;
  std::mutex mutex_target_;
  std::map<unsigned long, std::string> target_server_;
#ifndef _WIN32
  int recv_socket_;
#else
  SOCKET recv_socket_;
#endif
  // buffer for one packet
  char *recv_buf_;

  // current receiving frame id
  uint8_t cur_frame_id;

  // udp recv thread
  std::thread udp_do_receive_;

  // inherit class use two list as buffer
  // std::vector<T> receiving_frame_list_;
  // std::list<T> cached_frame_list_;

  bool stop_udp_receive_;
  std::mutex mtx_;
  std::condition_variable cv_;
};

/******************************************************************************/
/*  declaration for log udp receiver                                          */
/******************************************************************************/

class LogUDPReceiver : public UDPReceiverBase {
 public:
  LogUDPReceiver();
  ~LogUDPReceiver();

  // assemble the log frame.
  void UDPDoReceive();
  // fetch one frame from the cached frame list.
  int RecvFrame(LogInfo *frame);

 private:
  int cur_frame_log_len;
  int write_idx_;
  std::vector<LogInfo> receiving_frame_list_;
  std::list<LogInfo> cached_frame_list_;
};

/******************************************************************************/
/*  declaration for image-only udp receiver                                   */
/******************************************************************************/

class ImageUDPReceiver : public UDPReceiverBase {
 public:
  ImageUDPReceiver();
  ~ImageUDPReceiver();

  // assemble the log frame.
  void UDPDoReceive();
  // fetch one frame from the cached frame list.
  int RecvFrame(ImageData *frame);
  // get the front frame's frame id.
  int GetFrontFrameID(uint8_t &frame_id);

 private:
  int cur_image_data_len_;
  int write_idx_;
  std::vector<ImageData> receiving_frame_list_;
  std::list<ImageData> cached_frame_list_;
};

#endif  // MATRIX_DEV_SDK_IMPLEMENT_UDP_RECEIVER_H_
