/**
 * @file DataReceiver.h
 * @brief class definition for FrameInfo and DataReceiver
 * @author Song Wei
 * @email wei.song@horizon.ai
 * @version 1.0
 */

#ifndef __DATA_RECEIVER_H__
#define __DATA_RECEIVER_H__

#include "zeromq/zmq.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdint.h>
#include "meta.pb.h"
#include <memory>
#include <iostream>

#include <time.h>
#ifndef WIN32
#include <pthread.h>
#include <unistd.h>
#include <sys/time.h>
#endif

#define SharedVector(TYPE) std::shared_ptr<std::vector<TYPE> >

/**
 * @brief get current system time
 */
static inline long long GetTimeStamp() {
#ifdef WIN32
  time_t tt = time(NULL);
  SYSTEMTIME systime;
  GetLocalTime(&systime);

  struct tm *tm_time;
  tm_time = localtime(&tt);

  return tt * 1000LL + systime.wMilliseconds;
#else
  struct timeval curr_time;
  gettimeofday(&curr_time, NULL);
  return ((long long)curr_time.tv_sec * 1000LL + curr_time.tv_usec / 1000LL);
#endif
}


/**
 * @brief class FrameInfo
 * Container for received frame data, like meta, img data and parsing data
 */
class FrameInfo {
 public:
  Meta::Meta meta;
  std::vector<SharedVector(uint8_t) > img_data;
  std::vector<SharedVector(uint8_t) > parsing_data;
  std::vector<SharedVector(uint8_t) > all_data;
  int64_t ts;   // timestamp for all messages received for current frame
  int send_mode;
  int image_format;
};

/**
 * @brief class DataReceiver
 * Used to handle connect/reconnect/data receive from data provider
 */
class DataReceiver  
{  
private:  
  void * m_context;   
  void * m_requester;
  char   m_endpoint[100]; 
  zmq_msg_t m_recv_msg;
  long recv_fail_count;
  
public:  
  DataReceiver();
  ~DataReceiver();

  void init(const char* endpoint);  

  void reconnect();

  int RecvFrame(FrameInfo *frame);
};  
#endif
