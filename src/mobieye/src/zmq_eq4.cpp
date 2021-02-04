#include <math.h>
#include <algorithm>

#include <ros/ros.h>
#include <visualization_msgs/Marker.h>

#include <linux/can.h>
#include <zmq.h>

#include "eq4_structures.h"

static const std::string DEFAULT_NODE("zmq_eq4_node");
static const std::string DEFAULT_TOPIC("zmq_eq4_topic");
static const std::string DEFAULT_FRAME("sensor_zmq_frame");

static const std::string DEFAULT_MARKER_NS("zmq_eq4");
static const std::string DEFAULT_MARKER_OBS3_NS("zmq_eq4_obs3");
static const std::string DEFAULT_MARKER_VD3D_NS("zmq_eq4_vd3d");

# define CAN_MSG_HDR            "CANx ffffffff:ffffffff "
# define CAN_MSG_HDR_FORMAT     "%4s %08lx:%08lx "
# define CAN_FORMAT             "%02hhx - 0x%03x %02hhx %02hhx %02hhx %02hhx %02hhx %02hhx %02hhx %02hhx"

const unsigned int ZMQ_MSG_SIZE   = 512;
const unsigned int MAX_READ_TIMES = 0xFFFF;

static ME_VD3D             meVD3D;
static ME_OBS3             meOBS3;
static ME_LANES3           meLanes3;
static ME_TSR3             meTSR3;
static ME_FREE_SPACE_RWC3  meFreeSpaceRWC3;

static ME_ACC3             meACC3;
static ME_AHBC3            meAHBC3;
static ME_CMS3             meCMS3;
static ME_FAIL_SAFES3      meFailsafes3;
static ME_HMI3             meHMI3;
static ME_HPP3             meHPP3;
static ME_SYNC3            meSync3;
static ME_SYNC3_SENSOR     meSync3Sensor;

void analysis_can_eq4(const can_frame& vco)
{
    unsigned int vco_TimeStamp = 0;

    switch(vco.can_id)
    {
    case VD3D_Header:
    {
        meVD3D.VD3D_Header.can_frame_recv_time = vco_TimeStamp;
        meVD3D.VD3D_Header.numOfObjects = vco.data[0] & 0x0f;
        meVD3D.VD3D_Header.protocol_version = vco.data[1] & 0xf0;

        //std::cout << std::endl << "VD3D_Header" << ": " << (unsigned int)meVD3D.VD3D_Header.numOfObjects << ", ";
        break;
    }

    case syncMessage:
    {
        meVD3D.syncMessage.can_frame_recv_time = vco_TimeStamp;
        meVD3D.syncMessage.frameIndex = vco.data[3] * 256 * 256 * 256 + vco.data[2] * 256 * 256 + vco.data[1] * 256 + vco.data[0];
        meVD3D.syncMessage.timeStamp = vco.data[7] * 256 * 256 * 256 + vco.data[6] * 256 * 256 + vco.data[5] * 256 + vco.data[4];

        break;
    }

    case vehicleDataA1:
    case vehicleDataA2:
    case vehicleDataA3:
    case vehicleDataA4:
    case vehicleDataA5:
    case vehicleDataA6:
    case vehicleDataA7:
    case vehicleDataA8:
    case vehicleDataA9:
    case vehicleDataA10:
    {
        int vehicleIndex = vco.can_id - vehicleDataA1;

        meVD3D.vehicleData[vehicleIndex].vehicleDataA.can_frame_recv_time = vco_TimeStamp;
        meVD3D.vehicleData[vehicleIndex].vehicleDataA.objectID = vco.data[0];
        meVD3D.vehicleData[vehicleIndex].vehicleDataA.isValid = vco.data[1] & 0x01;
        meVD3D.vehicleData[vehicleIndex].vehicleDataA.isStable = (vco.data[1] >> 1) & 0x01;
        meVD3D.vehicleData[vehicleIndex].vehicleDataA.isCIPV = (vco.data[1] >> 2) & 0x01;

        if(((vco.data[3]>>3)&0x01) == 1)
            meVD3D.vehicleData[vehicleIndex].vehicleDataA.longGroundSpeed = ((vco.data[3]&0x0f)*256+vco.data[2]-0x1000)*0.05;
        else
            meVD3D.vehicleData[vehicleIndex].vehicleDataA.longGroundSpeed = ((vco.data[3]&0x0f)*256+vco.data[2])*0.05;

        meVD3D.vehicleData[vehicleIndex].vehicleDataA.longGroundSpeedSTD = ((vco.data[4]&0x7f)*16+((vco.data[3]>>4)&0x0f))*0.05;

        if((vco.data[6]&0x01) == 1)
            meVD3D.vehicleData[vehicleIndex].vehicleDataA.latGroundSpeed = ((vco.data[6]&0x01)*2*256+vco.data[5]*2+((vco.data[4]>>7)&0x01)-0x400)*0.05;
        else
            meVD3D.vehicleData[vehicleIndex].vehicleDataA.latGroundSpeed = ((vco.data[6]&0x01)*2*256+vco.data[5]*2+((vco.data[4]>>7)&0x01))*0.05;

        meVD3D.vehicleData[vehicleIndex].vehicleDataA.latGroundSpeedSTD = ((vco.data[7]&0x03)*128+((vco.data[6]>>1)&0x7f))*0.05;

        //std::cout << (unsigned int)meVD3D.vehicleData[vehicleIndex].vehicleDataA.objectID << ", ";

        break;
    }
    case vehicleDataB1:
    case vehicleDataB2:
    case vehicleDataB3:
    case vehicleDataB4:
    case vehicleDataB5:
    case vehicleDataB6:
    case vehicleDataB7:
    case vehicleDataB8:
    case vehicleDataB9:
    case vehicleDataB10:
    {
        int vehicleIndex = vco.can_id-vehicleDataB1;

        meVD3D.vehicleData[vehicleIndex].vehicleDataB.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>4)&0x01) == 1)
            meVD3D.vehicleData[vehicleIndex].vehicleDataB.heading = ((vco.data[1]&0x1f)*256+vco.data[0]-0x2000)*0.001;
        else
            meVD3D.vehicleData[vehicleIndex].vehicleDataB.heading = ((vco.data[1]&0x1f)*256+vco.data[0])*0.001;

        meVD3D.vehicleData[vehicleIndex].vehicleDataB.headingSTD = ((vco.data[3]&0x01)*256*8+vco.data[2]*8+((vco.data[1]>>5)&0x07))*0.001;

        if(((vco.data[4]>>1)&0x01) == 1)
            meVD3D.vehicleData[vehicleIndex].vehicleDataB.wheelAngle = ((vco.data[4]&0x03)*128+((vco.data[3]>>1)&0x7f)-0x200)*0.01;
        else
            meVD3D.vehicleData[vehicleIndex].vehicleDataB.wheelAngle = ((vco.data[4]&0x03)*128+((vco.data[3]>>1)&0x7f))*0.01;

        meVD3D.vehicleData[vehicleIndex].vehicleDataB.wheelAngleSTD = ((vco.data[5]&0x07)*64+((vco.data[4]>>2)&0x3f))*0.01;

        if(((vco.data[6]>>3)&0x01) == 1)
            meVD3D.vehicleData[vehicleIndex].vehicleDataB.absoluteAcceleration = ((vco.data[6]&0x0f)*32+((vco.data[5]>>3)&0x1f)-0x200)*0.05;
        else
            meVD3D.vehicleData[vehicleIndex].vehicleDataB.absoluteAcceleration = ((vco.data[6]&0x0f)*32+((vco.data[5]>>3)&0x1f))*0.05;

        meVD3D.vehicleData[vehicleIndex].vehicleDataB.absoluteAccelerationSTD = ((vco.data[7]&0x1f)*16+((vco.data[6]>>4)&0x0f))*0.05;
        break;
    }
    case vehicleDataC1:
    case vehicleDataC2:
    case vehicleDataC3:
    case vehicleDataC4:
    case vehicleDataC5:
    case vehicleDataC6:
    case vehicleDataC7:
    case vehicleDataC8:
    case vehicleDataC9:
    case vehicleDataC10:
    {
        int vehicleIndex = vco.can_id-vehicleDataC1;

        meVD3D.vehicleData[vehicleIndex].vehicleDataC.can_frame_recv_time = vco_TimeStamp;

        meVD3D.vehicleData[vehicleIndex].vehicleDataC.longDist = ((vco.data[1]&0x0f)*256+vco.data[0])*0.05;
        meVD3D.vehicleData[vehicleIndex].vehicleDataC.longDistSTD = (vco.data[2]*16+((vco.data[1]>>4)&0x0f))*0.05;

        if(((vco.data[4]>>3)&0x01) == 1)
            meVD3D.vehicleData[vehicleIndex].vehicleDataC.latDist = ((vco.data[4]&0x0f)*256+vco.data[3]-0x1000)*0.05;
        else
            meVD3D.vehicleData[vehicleIndex].vehicleDataC.latDist = ((vco.data[4]&0x0f)*256+vco.data[3])*0.05;

        meVD3D.vehicleData[vehicleIndex].vehicleDataC.latDistSTD = ((vco.data[5]&0x7f)*16+((vco.data[4]>>4)&0x0f))*0.05;
        break;
    }
    case vehicleDataD1:
    case vehicleDataD2:
    case vehicleDataD3:
    case vehicleDataD4:
    case vehicleDataD5:
    case vehicleDataD6:
    case vehicleDataD7:
    case vehicleDataD8:
    case vehicleDataD9:
    case vehicleDataD10:
    {
        int vehicleIndex = vco.can_id-vehicleDataD1;

        meVD3D.vehicleData[vehicleIndex].vehicleDataD.can_frame_recv_time = vco_TimeStamp;

        meVD3D.vehicleData[vehicleIndex].vehicleDataD.length = ((vco.data[1]&0x07)*256+vco.data[0])*0.01;
        meVD3D.vehicleData[vehicleIndex].vehicleDataD.lengthSTD = ((vco.data[2]&0x3f)*32+((vco.data[1]>>3)&0x1f))*0.01;

        meVD3D.vehicleData[vehicleIndex].vehicleDataD.width = ((vco.data[3]&0x3f)*4+((vco.data[2]>>6)&0x03))*0.01;
        meVD3D.vehicleData[vehicleIndex].vehicleDataD.widthSTD = ((vco.data[4]&0x3f)*4+((vco.data[3]>>6)&0x03))*0.01;

        meVD3D.vehicleData[vehicleIndex].vehicleDataD.height = ((vco.data[5]&0x7f)*4+((vco.data[4]>>6)&0x03))*0.01;
        meVD3D.vehicleData[vehicleIndex].vehicleDataD.heightSTD = (vco.data[6]*2+((vco.data[5]>>7)&0x01))*0.01;
        break;
    }
    case vehicleDataE1:
    case vehicleDataE2:
    case vehicleDataE3:
    case vehicleDataE4:
    case vehicleDataE5:
    case vehicleDataE6:
    case vehicleDataE7:
    case vehicleDataE8:
    case vehicleDataE9:
    case vehicleDataE10:
    {
        int vehicleIndex = vco.can_id-vehicleDataE1;

        meVD3D.vehicleData[vehicleIndex].vehicleDataE.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>1)&0x01) == 1)
            meVD3D.vehicleData[vehicleIndex].vehicleDataE.latRelSpeed = ((vco.data[1]&0x03)*256+vco.data[0]-0x400)*0.1;
        else
            meVD3D.vehicleData[vehicleIndex].vehicleDataE.latRelSpeed = ((vco.data[1]&0x03)*256+vco.data[0])*0.1;

        if(((vco.data[2]>>3)&0x01) == 1)
            meVD3D.vehicleData[vehicleIndex].vehicleDataE.latRelSpeedSTD = ((vco.data[2]&0x0f)*64+((vco.data[1]>>2)&0x3f)-0x400)*0.1;
        else
            meVD3D.vehicleData[vehicleIndex].vehicleDataE.latRelSpeedSTD = ((vco.data[2]&0x0f)*64+((vco.data[1]>>2)&0x3f))*0.1;

        if(((vco.data[3]>>7)&0x01) == 1)
            meVD3D.vehicleData[vehicleIndex].vehicleDataE.longRelSpeed = (vco.data[3]*16+((vco.data[2]>>4)&0x0f)-0x1000)*0.1;
        else
            meVD3D.vehicleData[vehicleIndex].vehicleDataE.longRelSpeed = (vco.data[3]*16+((vco.data[2]>>4)&0x0f))*0.1;

        meVD3D.vehicleData[vehicleIndex].vehicleDataE.longRelSpeedSTD = ((vco.data[5]&0x07)*256+vco.data[4])*0.1;

        if(((vco.data[6]>>3)&0x01) == 1)
            meVD3D.vehicleData[vehicleIndex].vehicleDataE.relativeAcceleration = ((vco.data[6]&0x0f)*32+((vco.data[5]>>3)&0x1f)-0x200)*0.05;
        else
            meVD3D.vehicleData[vehicleIndex].vehicleDataE.relativeAcceleration = ((vco.data[6]&0x0f)*32+((vco.data[5]>>3)&0x1f))*0.05;

        meVD3D.vehicleData[vehicleIndex].vehicleDataE.relativeAccelerationSTD = ((vco.data[7]&0x0f)*16+((vco.data[6]>>4)&0x0f))*0.05;

        break;
    }

    case ObstacleStatusA:
    {
        meOBS3.ObstacleStatusA.can_frame_recv_time = vco_TimeStamp;
        meOBS3.ObstacleStatusA.NumObstacles = vco.data[0];
        meOBS3.ObstacleStatusA.Timestamp = vco.data[1];
        meOBS3.ObstacleStatusA.ProtocolVersion = (vco.data[4]&0x01)*64+((vco.data[3]>>2)&0x3f);
        meOBS3.ObstacleStatusA.Go = (vco.data[4]>>1)&0x0f;
        meOBS3.ObstacleStatusA.Close_Car = (vco.data[4]>>5)&0x01;
        meOBS3.ObstacleStatusA.RightCloseRangeCutIn = (vco.data[4]>>6)&0x01;
        meOBS3.ObstacleStatusA.LeftCloseRangeCutIn = (vco.data[4]>>7)&0x01;
        meOBS3.ObstacleStatusA.Failsafe = (vco.data[6]&0x1f)*256+vco.data[5];
        meOBS3.ObstacleStatusA.ID_MCP = vco.data[7]&0x7f;

        //std::cout << std::endl << "ObstacleStatusA" << ": " << (unsigned int)meObs3.ObstacleStatusA.NumObstacles << ", ";
        break;
    }
    case ObstacleStatusB:
    {
        meOBS3.ObstacleStatusB.can_frame_recv_time = vco_TimeStamp;
        meOBS3.ObstacleStatusB.timeStamp = vco.data[3]*256*256*256+vco.data[2]*256*256+vco.data[1]*256+vco.data[0];
        meOBS3.ObstacleStatusB.frameIndex = vco.data[7]*256*256*256+vco.data[6]*256*256+vco.data[5]*256+vco.data[4];

        break;
    }
    case ObstacleStatusC:
    {
        meOBS3.ObstacleStatusC.can_frame_recv_time = vco_TimeStamp;
        meOBS3.ObstacleStatusC.grabIndex = vco.data[1]*256+vco.data[0];
        meOBS3.ObstacleStatusC.pedalConfGenObjDistFromBumper = vco.data[2]*0.05;
        meOBS3.ObstacleStatusC.pedalConfusionGeneralObjTTC = ((vco.data[4]&0x01)*256+vco.data[3])*0.01;
        break;
    }
    case ObstacleDataA1:
    case ObstacleDataA2:
    case ObstacleDataA3:
    case ObstacleDataA4:
    case ObstacleDataA5:
    case ObstacleDataA6:
    case ObstacleDataA7:
    case ObstacleDataA8:
    case ObstacleDataA9:
    case ObstacleDataA10:
    {
        int OBS_index = (vco.can_id-ObstacleDataA1)/3;

        meOBS3.ObstacleDataA[OBS_index].can_frame_recv_time = vco_TimeStamp;
        meOBS3.ObstacleDataA[OBS_index].ObstacleID = vco.data[0];
        meOBS3.ObstacleDataA[OBS_index].ObstaclePosX = ((vco.data[2]&0x0f)*256+vco.data[1])*0.0625;

        if(((vco.data[4]>>1)&0x01) == 1)
            meOBS3.ObstacleDataA[OBS_index].ObstaclePosY = ((vco.data[4]&0x03)*256+vco.data[3]-0x400)*0.0625;
        else
            meOBS3.ObstacleDataA[OBS_index].ObstaclePosY = ((vco.data[4]&0x03)*256+vco.data[3])*0.0625;

        meOBS3.ObstacleDataA[OBS_index].BlinkerInfo = (vco.data[4]>>2)&0x07;
        meOBS3.ObstacleDataA[OBS_index].Move_in_and_Out = (vco.data[4]>>5)&0x07;

        if(((vco.data[6]>>3)&0x01) == 1)
            meOBS3.ObstacleDataA[OBS_index].ObstacleVelX = ((vco.data[6]&0x0f)*256+vco.data[5]-0x1000)*0.0625;
        else
            meOBS3.ObstacleDataA[OBS_index].ObstacleVelX = ((vco.data[6]&0x0f)*256+vco.data[5])*0.0625;

        meOBS3.ObstacleDataA[OBS_index].ObstacleType = (vco.data[6]>>4)&0x07;
        meOBS3.ObstacleDataA[OBS_index].ObstacleStatus = (vco.data[7]>>0)&0x07;
        meOBS3.ObstacleDataA[OBS_index].ObstacleBrakeLights = (vco.data[7]>>3)&0x01;
        meOBS3.ObstacleDataA[OBS_index].ObstacleValid = (vco.data[7]>>6)&0x03;

        //std::cout << (unsigned int)meObs3.ObstacleDataA[OBS_index].ObstacleID << ", ";
        break;
    }
    case ObstacleDataB1:
    case ObstacleDataB2:
    case ObstacleDataB3:
    case ObstacleDataB4:
    case ObstacleDataB5:
    case ObstacleDataB6:
    case ObstacleDataB7:
    case ObstacleDataB8:
    case ObstacleDataB9:
    case ObstacleDataB10:
    {
        int OBS_index = (vco.can_id-ObstacleDataB1)/3;

        meOBS3.ObstacleDataB[OBS_index].can_frame_recv_time = vco_TimeStamp;
        meOBS3.ObstacleDataB[OBS_index].ObstacleLength = vco.data[0]*0.5;
        meOBS3.ObstacleDataB[OBS_index].ObstacleWidth = vco.data[1]*0.05;
        meOBS3.ObstacleDataB[OBS_index].ObstacleAge = vco.data[2];
        meOBS3.ObstacleDataB[OBS_index].ObstacleLane = (vco.data[3]>>0)&0x03;
        meOBS3.ObstacleDataB[OBS_index].CIPVFlag = (vco.data[3]>>2)&0x01;
        meOBS3.ObstacleDataB[OBS_index].RadarPosX = (vco.data[4]*4+((vco.data[3]>>4)&0x0f))*0.0625;

        if(((vco.data[6]>>3)&0x01) == 1)
            meOBS3.ObstacleDataB[OBS_index].RadarVelX = ((vco.data[6]&0x0f)*16+(vco.data[5]-0x1000))*0625;
        else
            meOBS3.ObstacleDataB[OBS_index].RadarVelX = ((vco.data[6]&0x0f)*16+vco.data[5])*0625;

        meOBS3.ObstacleDataB[OBS_index].RadarMatchConfidence = (vco.data[6]>>4)&0x07;
        meOBS3.ObstacleDataB[OBS_index].MatchedRadarID = (vco.data[7]>>0)&0x7f;

        break;
    }
    case ObstacleDataC1:
    case ObstacleDataC2:
    case ObstacleDataC3:
    case ObstacleDataC4:
    case ObstacleDataC5:
    case ObstacleDataC6:
    case ObstacleDataC7:
    case ObstacleDataC8:
    case ObstacleDataC9:
    case ObstacleDataC10:
    {
        int OBS_index = (vco.can_id-ObstacleDataC1)/3;

        meOBS3.ObstacleDataC[OBS_index].can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>7)&0x01) == 1)
            meOBS3.ObstacleDataC[OBS_index].ObstacleAngleRate = (vco.data[1]*256+vco.data[0]-0x10000)*0.01;
        else
            meOBS3.ObstacleDataC[OBS_index].ObstacleAngleRate = (vco.data[1]*256+vco.data[0])*0.01;

        if(((vco.data[2]>>7)&0x01) == 1)
            meOBS3.ObstacleDataC[OBS_index].ObstacleVelY = (vco.data[2]-0x100)*0.1;
        else
            meOBS3.ObstacleDataC[OBS_index].ObstacleVelY = vco.data[2]*0.1;

        if(((vco.data[5]>>1)&0x01) == 1)
            meOBS3.ObstacleDataC[OBS_index].Object_Accel_X = ((vco.data[5]&0x03)*256+vco.data[4]-0x400)*0.03;
        else
            meOBS3.ObstacleDataC[OBS_index].Object_Accel_X = ((vco.data[5]&0x03)*256+vco.data[4])*0.03;

        meOBS3.ObstacleDataC[OBS_index].ObstacleReplaced = (vco.data[5]>>4)&0x01;

        if(((vco.data[7]>>7)&0x01) == 1)
            meOBS3.ObstacleDataC[OBS_index].ObstacleAngle = (vco.data[7]*256+vco.data[6]-0x10000)*0.01;
        else
            meOBS3.ObstacleDataC[OBS_index].ObstacleAngle = (vco.data[7]*256+vco.data[6])*0.01;

        break;
    }

    case Sync_Message_Input_1:
    {
        meSync3Sensor.can_frame_recv_time = vco_TimeStamp;
        meSync3Sensor.externalClockTimestamp = vco.data[3]*256*256*256+vco.data[2]*256*256+vco.data[1]*256+vco.data[0];

        break;
    }
    case Gradual_AHBC:
    {
        meAHBC3.Gradual_AHBC.can_frame_recv_time = vco_TimeStamp;
        meAHBC3.Gradual_AHBC.BNDRY_DOM_BOT_NGL_HLB = vco.data[0]*0.1-10;
        meAHBC3.Gradual_AHBC.BNDRY_DOM_LH_NGL_HLB = ((vco.data[2]&0x0f)*256+vco.data[1])*0.1-20;
        meAHBC3.Gradual_AHBC.BNDRY_DOM_RH_NGL_HLB = (vco.data[3]*16+((vco.data[2]>>4)&0x0f))*0.1-20;
        meAHBC3.Gradual_AHBC.ST_BNDRY_DOM_BOT_NGL_HLB = vco.data[4]&0x0f;
        meAHBC3.Gradual_AHBC.ST_BNDRY_DOM_LH_NGL_HLB = (vco.data[4]>>4)&0x0f;
        meAHBC3.Gradual_AHBC.ST_BNDRY_DOM_RH_NGL_HLB = vco.data[5]&0x0f;
        meAHBC3.Gradual_AHBC.Num_Of_Objects = (vco.data[5]>>4)&0x0f;
        break;
    }
    case HighLowBeam:
    {
        meAHBC3.HighLowBeam.can_frame_recv_time = vco_TimeStamp;
        meAHBC3.HighLowBeam.Reason_Preceding = (vco.data[0]>>0)&0x01;
        meAHBC3.HighLowBeam.Reason_Preceding_Grace = (vco.data[0]>>1)&0x01;
        meAHBC3.HighLowBeam.Reason_Oncoming = (vco.data[0]>>2)&0x01;
        meAHBC3.HighLowBeam.Reason_Oncoming_Grace = (vco.data[0]>>3)&0x01;
        meAHBC3.HighLowBeam.Reason_Street_Light = (vco.data[0]>>4)&0x01;
        meAHBC3.HighLowBeam.Reason_Street_Light_Grace = (vco.data[0]>>5)&0x01;
        meAHBC3.HighLowBeam.Reason_Lit_Night = (vco.data[0]>>6)&0x01;
        meAHBC3.HighLowBeam.Reason_Lit_Night_US = (vco.data[0]>>7)&0x01;
        meAHBC3.HighLowBeam.Reason_Low_speed = (vco.data[1]>>0)&0x01;
        meAHBC3.HighLowBeam.Reason_Bright_Scene = (vco.data[1]>>1)&0x01;
        meAHBC3.HighLowBeam.Reason_Sharp_Curve = (vco.data[1]>>2)&0x01;
        meAHBC3.HighLowBeam.Reason_Load_Balance = (vco.data[1]>>3)&0x01;

        meAHBC3.HighLowBeam.HLB_decision = (vco.data[2]>>0)&0x01;
        meAHBC3.HighLowBeam.HLB_Running_Mode = (vco.data[2]>>1)&0x03;
        meAHBC3.HighLowBeam.Reason_for_HLB_Inactive = (vco.data[2]>>3)&0x0f;

        break;
    }
    case HLB_Object_1:
    case HLB_Object_2:
    case HLB_Object_3:
    case HLB_Object_4:
    case HLB_Object_5:
    case HLB_Object_6:
    case HLB_Object_7:
    case HLB_Object_8:
    case HLB_Object_9:
    case HLB_Object_10:
    case HLB_Object_11:
    case HLB_Object_12:
    {
        int HLB_Object_Index = vco.can_id-HLB_Object_1;

        meAHBC3.HLB_Object[HLB_Object_Index].can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>2)&0x01) == 1)
            meAHBC3.HLB_Object[HLB_Object_Index].HLB_OBJ_ANG = ((vco.data[1]&0x07)*256+vco.data[0]-0x800)*0.04;
        else
            meAHBC3.HLB_Object[HLB_Object_Index].HLB_OBJ_ANG = ((vco.data[1]&0x07)*256+vco.data[0])*0.04;

        meAHBC3.HLB_Object[HLB_Object_Index].HLB_OBJ_DIST = (vco.data[2]&0x1f)*32+((vco.data[1]>>3)&0x1f);
        meAHBC3.HLB_Object[HLB_Object_Index].HLB_COUPLED_WIDTH = (vco.data[3]*8+((vco.data[2]>>5)&0x07))*0.04;
        meAHBC3.HLB_Object[HLB_Object_Index].HLB_OBJ_TYPE = vco.data[4]&0x0f;
        meAHBC3.HLB_Object[HLB_Object_Index].HLB_OBJ_VALID = (vco.data[4]>>4)&0x01;

        if(((vco.data[5]>>7)&0x01) == 1)
            meAHBC3.HLB_Object[HLB_Object_Index].HLB_OBJ_ANG_BOTTOM = (vco.data[5]*8+((vco.data[4]>>5)&0x07)-0x800)*0.04;
        else
            meAHBC3.HLB_Object[HLB_Object_Index].HLB_OBJ_ANG_BOTTOM = (vco.data[5]*8+((vco.data[4]>>5)&0x07))*0.04;

        break;
    }
    case ID_TFL0:
    case ID_TFL1:
    case ID_TFL2:
    case ID_TFL3:
    {
        int ID_index = vco.can_id-ID_TFL0;

        meTSR3.id_tfl[ID_index].can_frame_recv_time = vco_TimeStamp;

        meTSR3.id_tfl[ID_index].Internal_ID0 = vco.data[3]*256*256*256+vco.data[2]*256*256+vco.data[1]*256+vco.data[0];
        meTSR3.id_tfl[ID_index].Internal_ID1 = vco.data[7]*256*256*256+vco.data[6]*256*256+vco.data[5]*256+vco.data[4];

        break;
    }
    case ID_TSR0:
    case ID_TSR1:
    case ID_TSR2:
    case ID_TSR3:
    {
        int ID_index = vco.can_id-ID_TSR0;

        meTSR3.id_tsr[ID_index].can_frame_recv_time = vco_TimeStamp;

        meTSR3.id_tsr[ID_index].Internal_ID0 = vco.data[3]*256*256*256+vco.data[2]*256*256+vco.data[1]*256+vco.data[0];
        meTSR3.id_tsr[ID_index].Internal_ID1 = vco.data[7]*256*256*256+vco.data[6]*256*256+vco.data[5]*256+vco.data[4];

        break;
    }
    case failsafe_signals_1:
    {
        meFailsafes3.failsafe_signals_1.can_frame_recv_time = vco_TimeStamp;
        meFailsafes3.failsafe_signals_1.FS_LOW_SUN = (vco.data[0]>>3)&0x07;
        meFailsafes3.failsafe_signals_1.FS_BLUR_IMAGE = (vco.data[1]>>1)&0x07;
        meFailsafes3.failsafe_signals_1.FS_FULL_BLOCKAGE_BIT = (vco.data[2]&0x03)*2+((vco.data[1]>>7)&0x01);
        meFailsafes3.failsafe_signals_1.FS_PARTIAL_TRANSPARENT_BLOCKAGE = (vco.data[2]>>2)&0x07;
        meFailsafes3.failsafe_signals_1.FS_OUT_OF_CALIBRATION = (vco.data[3]>>0)&0x07;
        meFailsafes3.failsafe_signals_1.FS_OUT_OF_CALIBRATION_YAW = (vco.data[3]>>3)&0x07;
        meFailsafes3.failsafe_signals_1.FS_OUT_OF_CALIBRATION_HORIZON = (vco.data[4]&0x01)*4+((vco.data[3]>>6)&0x03);
        meFailsafes3.failsafe_signals_1.FS_SPLASHES = (vco.data[5]&0x03)*2+((vco.data[4]>>7)&0x01);
        meFailsafes3.failsafe_signals_1.FS_SMEARED_SPOTS = (vco.data[5]>>2)&0x07;
        meFailsafes3.failsafe_signals_1.FS_SMEARED_HALOS = (vco.data[5]>>5)&0x07;
        meFailsafes3.failsafe_signals_1.FS_FOGGY_LIGHTS = (vco.data[6]>>0)&0x07;
        meFailsafes3.failsafe_signals_1.FS_SUN_RAY = (vco.data[6]>>3)&0x07;
        meFailsafes3.failsafe_signals_1.FS_SELF_GLARE = (vco.data[7]>>4)&0x07;

        break;
    }
    case failsafe_signals_2:
    {
        meFailsafes3.failsafe_signals_2.can_frame_recv_time = vco_TimeStamp;
        meFailsafes3.failsafe_signals_2.protocol_version = vco.data[7];
        break;
    }
    case ME_ID_HMI3:
    {
        meHMI3.can_frame_recv_time = vco_TimeStamp;
        meHMI3.SoundType = vco.data[0]&0x07;
        meHMI3.HLB_Running_Mode = (vco.data[0]>>3)&0x03;
        meHMI3.Continues_sound = (vco.data[0]>>5)&0x03;
        meHMI3.Suppress = (vco.data[0]>>7)&0x01;
        meHMI3.Right_Availibility = (vco.data[1]>>4)&0x01;
        meHMI3.HeadwayValid = (vco.data[2]>>0)&0x01;
        meHMI3.HeadwayMeasurement = ((vco.data[2]>>1)&0x7f)*0.1;
        meHMI3.Pedal_Confusion_Indication = (vco.data[3]>>0)&0x03;
        meHMI3.Left_Availibility = (vco.data[4]>>0)&0x01;
        meHMI3.LeftLDW = (vco.data[4]>>1)&0x01;
        meHMI3.RightLDW = (vco.data[4]>>2)&0x01;
        meHMI3.Continues_sound = (vco.data[4]>>3)&0x01;
        meHMI3.Maintenance = (vco.data[4]>>6)&0x01;
        meHMI3.Slow_Target_Vehicle = (vco.data[4]>>7)&0x01;
        meHMI3.Failsafe = (vco.data[5]>>0)&0x01;
        meHMI3.Ped_WRN_2 = (vco.data[5]>>1)&0x01;
        meHMI3.Ped_WRN_1 = (vco.data[5]>>2)&0x01;
        meHMI3.High_Beam_Recommendation = (vco.data[6]>>6)&0x01;
        meHMI3.FCW_WRN_2 = (vco.data[6]>>7)&0x01;
        meHMI3.Vehicle_Ahead_Alerts = (vco.data[7]>>0)&0x03;
        meHMI3.Ped_WRN_3 = (vco.data[7]>>2)&0x01;

        break;
    }
    case FCW_information:
    {
        meCMS3.FCW_information.can_frame_recv_time = vco_TimeStamp;
        meCMS3.FCW_information.FCW_A = (vco.data[0]>>0)&0x01;
        meCMS3.FCW_information.FCW_B = (vco.data[0]>>1)&0x01;
        meCMS3.FCW_information.FCW_C = (vco.data[0]>>2)&0x01;
        meCMS3.FCW_information.FCW_D = (vco.data[0]>>3)&0x01;
        meCMS3.FCW_information.FCW_E = (vco.data[0]>>4)&0x01;
        meCMS3.FCW_information.CAN_VIS_OBS_TTC_WITH_ACC = ((vco.data[1]&0x7f)*8+((vco.data[0]>>5)&0x07))*0.01;

        break;
    }
    case PCW_information:
    {
        meCMS3.PCW_information.can_frame_recv_time = vco_TimeStamp;
        meCMS3.PCW_information.PCW_A = (vco.data[0]>>0)&0x01;
        meCMS3.PCW_information.PCW_B = (vco.data[0]>>1)&0x01;
        meCMS3.PCW_information.PCW_C = (vco.data[0]>>2)&0x01;
        meCMS3.PCW_information.PCW_D = (vco.data[0]>>3)&0x01;
        meCMS3.PCW_information.PCW_E = (vco.data[0]>>4)&0x01;
        meCMS3.PCW_information.CAN_VIS_OBS_TTC_WITHOUT_ACC = (vco.data[1]*4+((vco.data[0]>>6)&0x03))*0.01;

        break;
    }
    case ACCInfo:
    {
        meACC3.ACCInfo.can_frame_recv_time = vco_TimeStamp;
        meACC3.ACCInfo.FCW_on = vco.data[0]&0x01;
        meACC3.ACCInfo.LeftCloseRangeCutIn = (vco.data[0]>>1)&0x01;
        meACC3.ACCInfo.RightCloseRangeCutIn = (vco.data[0]>>2)&0x01;
        meACC3.ACCInfo.lost_CIPV = (vco.data[0]>>4)&0x03;
        meACC3.ACCInfo.ObjectFusionState = (vco.data[0]>>6)&0x03;
        meACC3.ACCInfo.ObstaclePosX = ((vco.data[2]&0x0f)*256+vco.data[1])*0.0625;
        if(((vco.data[3]>>7)&0x01) == 1)
            meACC3.ACCInfo.ObstacleRelVelX = (vco.data[3]*16+((vco.data[2]>>4)&0x0f)-0x1000)*0.0625;
        else
            meACC3.ACCInfo.ObstacleRelVelX = (vco.data[3]*16+((vco.data[2]>>4)&0x0f))*0.0625;


        if(((vco.data[5]>>1)&0x01) == 1)
            meACC3.ACCInfo.ObstaclePosY = ((vco.data[5]&0x03)*256+vco.data[4]-0x400)*0.0625;
        else
            meACC3.ACCInfo.ObstaclePosY = ((vco.data[5]&0x03)*256+vco.data[4])*0.0625;

        meACC3.ACCInfo.BlinkerInfo = (vco.data[5]>>2)&0x07;
        meACC3.ACCInfo.Move_in_and_Out = (vco.data[5]>>5)&0x07;
        meACC3.ACCInfo.ObstacleType = (vco.data[6]>>0)&0x07;

        if(((vco.data[7]>>4)&0x01) == 1)
            meACC3.ACCInfo.Object_Accel_X = ((vco.data[7]&0x1f)*32+((vco.data[6]>>3)&0x1f)-0x400)*0.03;
        else
            meACC3.ACCInfo.Object_Accel_X = ((vco.data[7]&0x1f)*32+((vco.data[6]>>3)&0x1f))*0.03;

        meACC3.ACCInfo.CIPV_FreeSpace = (vco.data[7]>>5)&0x03;
        meACC3.ACCInfo.CIPVBrakeLights = (vco.data[7]>>7)&0x01;

        break;
    }
    case ACCInfo_B :
    {
        meACC3.ACCInfo_B.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>3)&0x01) == 1)
            meACC3.ACCInfo_B.ObstacleVelX = ((vco.data[1]&0x0f)*256+vco.data[0]-0x1000)*0.0625;
        else
            meACC3.ACCInfo_B.ObstacleVelX = ((vco.data[1]&0x0f)*256+vco.data[0])*0.0625;

        if(((vco.data[2]>>7)&0x01) == 1)
            meACC3.ACCInfo_B.ObstacleRelVelY = (vco.data[2]*16+((vco.data[1]>>4)&0x0f)-0x1000)*0.0625;
        else
            meACC3.ACCInfo_B.ObstacleRelVelY = (vco.data[2]*16+((vco.data[1]>>4)&0x0f))*0.0625;

        meACC3.ACCInfo_B.MotionType = (vco.data[5]>>0)&0x07;
        meACC3.ACCInfo_B.ObstacleWidth = vco.data[6]*0.05;
        meACC3.ACCInfo_B.protocol_version = vco.data[7];

        break;
    }
    case ACCInfo_C:
    {
        meACC3.ACCInfo_C.can_frame_recv_time = vco_TimeStamp;
        if(((vco.data[1]>>7)&0x01) == 1)
            meACC3.ACCInfo_C.Obstacle_Angle = (vco.data[1]*256+vco.data[0]-0x10000)*0.01;
        else
            meACC3.ACCInfo_C.Obstacle_Angle = (vco.data[1]*256+vco.data[0])*0.01;

        if(((vco.data[3]>>7)&0x01) == 1)
            meACC3.ACCInfo_C.Obstacle_Angle_Rate = (vco.data[3]*256+vco.data[2]-0x10000)*0.01;
        else
            meACC3.ACCInfo_C.Obstacle_Angle_Rate = (vco.data[3]*256+vco.data[2])*0.01;

        meACC3.ACCInfo_C.Global_Frame_Index = vco.data[7]*256*256*256+vco.data[6]*256*256+vco.data[5]*256+vco.data[4];

        break;

    }
    case left_CCI_measurements_A:
    {
        meACC3.left_CCI_measurements_A.can_frame_recv_time = vco_TimeStamp;
        meACC3.left_CCI_measurements_A.VCL_cutting_frontZ = ((vco.data[1]&0x0f)*256+vco.data[0])*0.01;

        if(((vco.data[2]>>5)&0x01) == 1)
            meACC3.left_CCI_measurements_A.VCL_cutting_frontX = ((vco.data[2]&0x3f)*16+((vco.data[1]>>4)&0x0f)-0x400)*0.01;
        else
            meACC3.left_CCI_measurements_A.VCL_cutting_frontX = ((vco.data[2]&0x3f)*16+((vco.data[1]>>4)&0x0f))*0.01;

        meACC3.left_CCI_measurements_A.VCL_cutting_backZ = ((vco.data[4]&0x03)*256*4+vco.data[3]*4+((vco.data[2]>>6)&0x03))*0.01;

        if(((vco.data[5]>>3)&0x01) == 1)
            meACC3.left_CCI_measurements_A.VCL_cutting_backX = ((vco.data[5]&0x0f)*64+((vco.data[4]>>2)&0x3f)-0x400)*0.01;
        else
            meACC3.left_CCI_measurements_A.VCL_cutting_backX = ((vco.data[5]&0x0f)*64+((vco.data[4]>>2)&0x3f))*0.01;

        meACC3.left_CCI_measurements_A.VCL_cutting_longitudinal_speed = ((vco.data[6]&0x7f)*16+((vco.data[5]>>4)&0x0f))*0.05;
        meACC3.left_CCI_measurements_A.VCL_cutting_hasCut = (vco.data[6]>>7)&0x01;

        if(((vco.data[7]>>7)&0x01) == 1)
            meACC3.left_CCI_measurements_A.VCL_cutting_lateral_speed = (vco.data[7]-0x100)*0.05;
        else
            meACC3.left_CCI_measurements_A.VCL_cutting_lateral_speed = vco.data[7]*0.05;

        break;
    }
    case left_CCI_measurements_B:
    {
        meACC3.left_CCI_measurements_B.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>0)&0x01) == 1)
            meACC3.left_CCI_measurements_B.VCL_cutting_ttc = ((vco.data[1]&0x01)*256+vco.data[0]-0x200)*0.05;
        else
            meACC3.left_CCI_measurements_B.VCL_cutting_ttc = ((vco.data[1]&0x01)*256+vco.data[0])*0.05;

        meACC3.left_CCI_measurements_B.hasCutLaneMark = (vco.data[1]>>1)&0x01;

        break;
    }
    case right_CCI_measurements_A:
    {
        meACC3.right_CCI_measurements_A.can_frame_recv_time = vco_TimeStamp;
        meACC3.right_CCI_measurements_A.VCL_cutting_frontZ = ((vco.data[1]&0x0f)*256+vco.data[0])*0.01;

        if(((vco.data[2]>>5)&0x01) == 1)
            meACC3.right_CCI_measurements_A.VCL_cutting_frontX = ((vco.data[2]&0x3f)*16+((vco.data[1]>>4)&0x0f)-0x400)*0.01;
        else
            meACC3.right_CCI_measurements_A.VCL_cutting_frontX = ((vco.data[2]&0x3f)*16+((vco.data[1]>>4)&0x0f))*0.01;

        meACC3.right_CCI_measurements_A.VCL_cutting_backZ = ((vco.data[4]&0x03)*256*4+vco.data[3]*4+((vco.data[2]>>6)&0x03))*0.01;

        if(((vco.data[5]>>3)&0x01) == 1)
            meACC3.right_CCI_measurements_A.VCL_cutting_backX = ((vco.data[5]&0x0f)*64+((vco.data[4]>>2)&0x3f)-0x400)*0.01;
        else
            meACC3.right_CCI_measurements_A.VCL_cutting_backX = ((vco.data[5]&0x0f)*64+((vco.data[4]>>2)&0x3f))*0.01;

        meACC3.right_CCI_measurements_A.VCL_cutting_longitudinal_speed = ((vco.data[6]&0x7f)*16+((vco.data[5]>>4)&0x0f))*0.05;
        meACC3.right_CCI_measurements_A.VCL_cutting_hasCut = (vco.data[6]>>7)&0x01;

        if(((vco.data[7]>>7)&0x01) == 1)
            meACC3.right_CCI_measurements_A.VCL_cutting_lateral_speed = (vco.data[7]-0x100)*0.05;
        else
            meACC3.right_CCI_measurements_A.VCL_cutting_lateral_speed = vco.data[7]*0.05;
        break;
    }
    case right_CCI_measurements_B:
    {
        meACC3.right_CCI_measurements_B.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>0)&0x01) == 1)
            meACC3.right_CCI_measurements_B.VCL_cutting_ttc = ((vco.data[1]&0x01)*256+vco.data[0]-0x200)*0.05;
        else
            meACC3.right_CCI_measurements_B.VCL_cutting_ttc = ((vco.data[1]&0x01)*256+vco.data[0])*0.05;

        meACC3.right_CCI_measurements_B.hasCutLaneMark = (vco.data[1]>>1)&0x01;

        break;
    }
    case Protocol_Header:
    {
        meTSR3.Protocol_Header.can_frame_recv_time = vco_TimeStamp;
        meTSR3.Protocol_Header.protocol_version = vco.data[0];
        meTSR3.Protocol_Header.num_Of_TSR_Suspects = vco.data[1]&0x0f;
        break;
    }
    case TFL_Header:
    {
        meTSR3.TFL_Header.can_frame_recv_time = vco_TimeStamp;
        meTSR3.TFL_Header.Number_Of_TFL_Objects = vco.data[0]&0x0f;
        meTSR3.TFL_Header.Main_Object_ID = (vco.data[0]>>4)&0x0f;
        meTSR3.TFL_Header.TFL_TTC = ((vco.data[2]&0x01)*128+((vco.data[1]>>1)&0x7f))*0.02;
        meTSR3.TFL_Header.StopSign_TTC = ((vco.data[3]&0x01)*128+((vco.data[2]>>1)&0x7f))*0.02;
        meTSR3.TFL_Header.Stop_Line_Dist = ((vco.data[4]&0x0f)*128+((vco.data[3]>>1)&0x7f))*0.1-50;
        meTSR3.TFL_Header.Junction_Status = (vco.data[4]>>4)&0x07;
        meTSR3.TFL_Header.JNC_Distance = ((vco.data[6]&0x01)*256*2+vco.data[5]*2+((vco.data[4]>>7)&0x01))*0.25-50;
        meTSR3.TFL_Header.Stop_Line_Valid = (vco.data[6]>>1)&0x01;
        meTSR3.TFL_Header.TFL_Warning_Supression_By_Vision = (vco.data[6]>>2)&0x0f;
        meTSR3.TFL_Header.TFL_Warning_Supression_By_Driver = (vco.data[7]&0x01)*4+((vco.data[6]>>6)&0x03);
        meTSR3.TFL_Header.SS_Warning_Supression = (vco.data[7]>>1)&0x07;
        meTSR3.TFL_Header.StopSign_notification = (vco.data[7]>>4)&0x01;
        meTSR3.TFL_Header.StopSign_Warning = (vco.data[7]>>5)&0x01;
        meTSR3.TFL_Header.TFL_notification = (vco.data[7]>>6)&0x01;
        meTSR3.TFL_Header.TFL_Warning = (vco.data[7]>>7)&0x01;

        break;
    }
    case TFL_Message0 :
    case TFL_Message1 :
    case TFL_Message2 :
    case TFL_Message3 :
    case TFL_Message4 :
    case TFL_Message5 :
    case TFL_Message6 :
    case TFL_Message7 :
    {
        int TFL_index = vco.can_id-TFL_Message0;

        meTSR3.TFL_Message[TFL_index].can_frame_recv_time = vco_TimeStamp;
        meTSR3.TFL_Message[TFL_index].TFL_PosY = vco.data[0]*0.125;
        meTSR3.TFL_Message[TFL_index].TFL_PosX = ((vco.data[2]&0x0f)*256+vco.data[1])*0.125-256;
        meTSR3.TFL_Message[TFL_index].TFL_PosZ = (vco.data[3]*16+((vco.data[2]>>4)&0x0f))*0.0625;
        meTSR3.TFL_Message[TFL_index].TFL_Color = vco.data[4]&0x07;
        meTSR3.TFL_Message[TFL_index].TFL_Width = ((vco.data[4]>>3)&0x1f)*0.03125;
        meTSR3.TFL_Message[TFL_index].TFL_Type = vco.data[5]&0x03;
        meTSR3.TFL_Message[TFL_index].TFL_Supp1_Arrow = ((vco.data[5]>>2)&0x0f);
        meTSR3.TFL_Message[TFL_index].TFL_Supp2_Arrow = ((vco.data[6]&0x03)*4+((vco.data[5]>>6)&0x03));
        meTSR3.TFL_Message[TFL_index].TFL_Supp3_Arrow = ((vco.data[6]>>2)&0x0f);
        meTSR3.TFL_Message[TFL_index].TFL_assignment = ((vco.data[7]&0x01)*4+((vco.data[6]>>6)&0x03));
        meTSR3.TFL_Message[TFL_index].Object_ID = ((vco.data[7]>>1)&0x0f);
        meTSR3.TFL_Message[TFL_index].is_TFL_Blinking = ((vco.data[7]>>5)&0x01);

        break;

    }
    case TSR0:
    case TSR1:
    case TSR2:
    case TSR3:
    case TSR4:
    case TSR5:
    case TSR6:
    {
        int TSR_index = vco.can_id-TSR0;

        meTSR3.tsr[TSR_index].can_frame_recv_time = vco_TimeStamp;
        meTSR3.tsr[TSR_index].Vision_only_Sign_Type = vco.data[0];
        meTSR3.tsr[TSR_index].Vision_only_Supp_Sign_Type = vco.data[1];
        meTSR3.tsr[TSR_index].Sign_Height = (vco.data[2]&0x3f)*0.1;
        meTSR3.tsr[TSR_index].Sign_Height = (vco.data[3]&0x3f)*0.1;
        meTSR3.tsr[TSR_index].Filter_type = (vco.data[5]&0x7f);
        meTSR3.tsr[TSR_index].No_Entry_Vision_Status = (vco.data[6]&0x07);

        break;

    }
    case Vision_Only_TSR_continuous:
    {
        meTSR3.Vision_Only_TSR_continuous.Vision_only_Sign_Type_D1 = vco.data[0];
        meTSR3.Vision_Only_TSR_continuous.Vision_only_supp_Sign_Type_D1 = vco.data[1];
        meTSR3.Vision_Only_TSR_continuous.Vision_only_Sign_Type_D2 = vco.data[2];
        meTSR3.Vision_Only_TSR_continuous.Vision_only_supp_Sign_Type_D2 = vco.data[3];
        meTSR3.Vision_Only_TSR_continuous.Vision_only_Sign_Type_D3 = vco.data[4];
        meTSR3.Vision_Only_TSR_continuous.Vision_only_supp_Sign_Type_D3 = vco.data[5];
        meTSR3.Vision_Only_TSR_continuous.Vision_only_Sign_Type_D4 = vco.data[6];
        meTSR3.Vision_Only_TSR_continuous.Vision_only_supp_Sign_Type_D4 = vco.data[7];

        break;
    }
    case TSR0_2:
    case TSR1_2:
    case TSR2_2:
    case TSR3_2:
    case TSR4_2:
    case TSR5_2:
    case TSR6_2:
    {
        int TSR_index = vco.can_id-TSR0_2;

        meTSR3.tsr_2[TSR_index].can_frame_recv_time = vco_TimeStamp;
        meTSR3.tsr_2[TSR_index].Sign_Position_X = ((vco.data[1]&0x0f)*256+vco.data[0])*0.05;

        if(((vco.data[2]>>6)&0x01) == 1)
            meTSR3.tsr_2[TSR_index].Sign_Position_Y = ((vco.data[2]&0x7f)*16+((vco.data[1]>>4)&0x0f)-0x800)*0.05;
        else
            meTSR3.tsr_2[TSR_index].Sign_Position_Y = ((vco.data[2]&0x7f)*16+((vco.data[1]>>4)&0x0f))*0.05;

        if(((vco.data[3]>>6)&0x01) == 1)
            meTSR3.tsr_2[TSR_index].Sign_Position_Z = ((vco.data[3]&0x7f)*2+((vco.data[2]>>7)&0x01)-0x100)*0.5;
        else
            meTSR3.tsr_2[TSR_index].Sign_Position_Z = ((vco.data[3]&0x7f)*2+((vco.data[2]>>7)&0x01))*0.5;


        break;
    }

    case LKA_Left_Lane_C:
    {
        meLanes3.LKA_Left_Lane_C.can_frame_recv_time = vco_TimeStamp;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_1_isValid = vco.data[0]&0x01;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_1 = ((vco.data[0]>>1)&0x1f)*0.05;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_2_isValid = vco.data[1]&0x01;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_2 = ((vco.data[1]>>1)&0x1f)*0.05;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_3_isValid = vco.data[2]&0x01;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_3 = ((vco.data[2]>>1)&0x1f)*0.05;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_4_isValid = vco.data[3]&0x01;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_4 = ((vco.data[3]>>1)&0x1f)*0.05;

        meLanes3.LKA_Left_Lane_C.SF_Confidence_1_Segment_End = vco.data[4]*0.5;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_2_Segment_End = vco.data[5]*0.5;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_3_Segment_End = vco.data[6]*0.5;
        meLanes3.LKA_Left_Lane_C.SF_Confidence_4_Segment_End = vco.data[7]*0.5;

        break;
    }
    case LKA_Right_Lane_C:
    {
        meLanes3.LKA_Right_Lane_C.can_frame_recv_time = vco_TimeStamp;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_1_isValid = vco.data[0]&0x01;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_1 = ((vco.data[0]>>1)&0x1f)*0.05;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_2_isValid = vco.data[1]&0x01;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_2 = ((vco.data[1]>>1)&0x1f)*0.05;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_3_isValid = vco.data[2]&0x01;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_3 = ((vco.data[2]>>1)&0x1f)*0.05;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_4_isValid = vco.data[3]&0x01;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_4 = ((vco.data[3]>>1)&0x1f)*0.05;

        meLanes3.LKA_Right_Lane_C.SF_Confidence_1_Segment_End = vco.data[4]*0.5;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_2_Segment_End = vco.data[5]*0.5;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_3_Segment_End = vco.data[6]*0.5;
        meLanes3.LKA_Right_Lane_C.SF_Confidence_4_Segment_End = vco.data[7]*0.5;

        break;
    }
    case Lane_Assignment_0m:
    {
        meLanes3.Lane_Assignment_0m.can_frame_recv_time = vco_TimeStamp;
        meLanes3.Lane_Assignment_0m.Lane_Assignment_1_0m_Confidence = (vco.data[0]&0x0f)*0.1;
        meLanes3.Lane_Assignment_0m.Lane_Assignment_1_0m_Type = (vco.data[0]>>4)&0x0f;

        meLanes3.Lane_Assignment_0m.Lane_Assignment_2_0m_Confidence = (vco.data[1]&0x0f)*0.1;
        meLanes3.Lane_Assignment_0m.Lane_Assignment_2_0m_Type = (vco.data[1]>>4)&0x0f;

        meLanes3.Lane_Assignment_0m.Lane_Assignment_3_0m_Confidence = (vco.data[2]&0x0f)*0.1;
        meLanes3.Lane_Assignment_0m.Lane_Assignment_3_0m_Type = (vco.data[2]>>4)&0x0f;

        meLanes3.Lane_Assignment_0m.Lane_Assignment_4_0m_Confidence = (vco.data[3]&0x0f)*0.1;
        meLanes3.Lane_Assignment_0m.Lane_Assignment_4_0m_Type = (vco.data[3]>>4)&0x0f;

        meLanes3.Lane_Assignment_0m.Lane_Assignment_5_0m_Confidence = (vco.data[4]&0x0f)*0.1;
        meLanes3.Lane_Assignment_0m.Lane_Assignment_5_0m_Type = (vco.data[4]>>4)&0x0f;

        meLanes3.Lane_Assignment_0m.Lane_Assignment_6_0m_Confidence = (vco.data[5]&0x0f)*0.1;
        meLanes3.Lane_Assignment_0m.Lane_Assignment_6_0m_Type = (vco.data[5]>>4)&0x0f;

        meLanes3.Lane_Assignment_0m.Lane_Assignment_7_0m_Confidence = (vco.data[6]&0x0f)*0.1;
        meLanes3.Lane_Assignment_0m.Lane_Assignment_7_0m_Type = (vco.data[6]>>4)&0x0f;

        meLanes3.Lane_Assignment_0m.Lane_Assignment_8_0m_Confidence = (vco.data[7]&0x0f)*0.1;
        meLanes3.Lane_Assignment_0m.Lane_Assignment_8_0m_Type = (vco.data[7]>>4)&0x0f;

        break;
    }
    case Lane_Assignment_35m:
    {
        meLanes3.Lane_Assignment_35m.can_frame_recv_time = vco_TimeStamp;
        meLanes3.Lane_Assignment_35m.Lane_Assignment_1_35m_Confidence = (vco.data[0]&0x0f)*0.1;
        meLanes3.Lane_Assignment_35m.Lane_Assignment_1_35m_Type = (vco.data[0]>>4)&0x0f;

        meLanes3.Lane_Assignment_35m.Lane_Assignment_2_35m_Confidence = (vco.data[1]&0x0f)*0.1;
        meLanes3.Lane_Assignment_35m.Lane_Assignment_2_35m_Type = (vco.data[1]>>4)&0x0f;

        meLanes3.Lane_Assignment_35m.Lane_Assignment_3_35m_Confidence = (vco.data[2]&0x0f)*0.1;
        meLanes3.Lane_Assignment_35m.Lane_Assignment_3_35m_Type = (vco.data[2]>>4)&0x0f;

        meLanes3.Lane_Assignment_35m.Lane_Assignment_4_35m_Confidence = (vco.data[3]&0x0f)*0.1;
        meLanes3.Lane_Assignment_35m.Lane_Assignment_4_35m_Type = (vco.data[3]>>4)&0x0f;

        meLanes3.Lane_Assignment_35m.Lane_Assignment_5_35m_Confidence = (vco.data[4]&0x0f)*0.1;
        meLanes3.Lane_Assignment_35m.Lane_Assignment_5_35m_Type = (vco.data[4]>>4)&0x0f;

        meLanes3.Lane_Assignment_35m.Lane_Assignment_6_35m_Confidence = (vco.data[5]&0x0f)*0.1;
        meLanes3.Lane_Assignment_35m.Lane_Assignment_6_35m_Type = (vco.data[5]>>4)&0x0f;

        meLanes3.Lane_Assignment_35m.Lane_Assignment_7_35m_Confidence = (vco.data[6]&0x0f)*0.1;
        meLanes3.Lane_Assignment_35m.Lane_Assignment_7_35m_Type = (vco.data[6]>>4)&0x0f;

        meLanes3.Lane_Assignment_35m.Lane_Assignment_8_35m_Confidence = (vco.data[7]&0x0f)*0.1;
        meLanes3.Lane_Assignment_35m.Lane_Assignment_8_35m_Type = (vco.data[7]>>4)&0x0f;

        break;
    }
    case LKA_Left_Lane_A:
    {
        meLanes3.LKA_Left_Lane_A.can_frame_recv_time = vco_TimeStamp;
        meLanes3.LKA_Left_Lane_A.Lane_Type = vco.data[0]&0x0f;
        meLanes3.LKA_Left_Lane_A.Quality = (vco.data[0]>>4)&0x03;

        if(((vco.data[2]>>0)&0x01) == 1)
            meLanes3.LKA_Left_Lane_A.Lane_Model_C0 = ((vco.data[2]&0x01)*256*4+vco.data[1]*4+((vco.data[0]>>6)&0x03)-0x800)*0.01;
        else
            meLanes3.LKA_Left_Lane_A.Lane_Model_C0 = ((vco.data[2]&0x01)*256*4+vco.data[1]*4+((vco.data[0]>>6)&0x03))*0.01;

        if(((vco.data[4]>>0)&0x01) == 1)
            meLanes3.LKA_Left_Lane_A.Lane_Model_C2 = ((vco.data[4]&0x01)*256*128+vco.data[3]*128+((vco.data[2]>>1)&0x7f)-0x10000)*0.000000977;
        else
            meLanes3.LKA_Left_Lane_A.Lane_Model_C2 = ((vco.data[4]&0x01)*256*128+vco.data[3]*128+((vco.data[2]>>1)&0x7f))*0.000000977;

        if(((vco.data[6]>>0)&0x01) == 1)
            meLanes3.LKA_Left_Lane_A.Lane_Model_C3 = ((vco.data[6]&0x01)*256*128+vco.data[5]*128+((vco.data[4]>>1)&0x7f)-0x10000)*0.00000000373;
        else
            meLanes3.LKA_Left_Lane_A.Lane_Model_C3 = ((vco.data[6]&0x01)*256*128+vco.data[5]*128+((vco.data[4]>>1)&0x7f))*0.00000000373;

        meLanes3.LKA_Left_Lane_A.Width_marking = ((vco.data[7]&0x01)*128+((vco.data[6]>>1)&0x7f))*0.01;
        meLanes3.LKA_Left_Lane_A.SF_confidence = ((vco.data[7]>>1)&0x0f)*0.1;

        break;
    }
    case LKA_Left_Lane_B:
    {
        meLanes3.LKA_Left_Lane_B.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>1)&0x01) == 1)
            meLanes3.LKA_Left_Lane_B.Lane_Model_C1 = ((vco.data[1]&0x03)*256+vco.data[0]-0x400)*0.0009765625;
        else
            meLanes3.LKA_Left_Lane_B.Lane_Model_C1 = ((vco.data[1]&0x03)*256+vco.data[0])*0.0009765625;

        meLanes3.LKA_Left_Lane_B.View_Range_Start = ((vco.data[2]&0x07)*64+((vco.data[1]>>2)&0x3f))*0.5;
        meLanes3.LKA_Left_Lane_B.View_Range_End = ((vco.data[3]&0x0f)*32+((vco.data[2]>>3)&0x1f))*0.5;
        meLanes3.LKA_Left_Lane_B.Lane_Crossing = vco.data[4]&0x01;
        meLanes3.LKA_Left_Lane_B.Lane_mark_color = (vco.data[4]>>1)&0x07;
        meLanes3.LKA_Left_Lane_B.PRED_DIST_BASED_EXTRAPOLATION = (vco.data[4]>>4)&0x01;
        meLanes3.LKA_Left_Lane_B.PRED_OTHER_SIDE = (vco.data[4]>>5)&0x01;
        meLanes3.LKA_Left_Lane_B.PRED_OVERRIDE = (vco.data[4]>>6)&0x01;
        meLanes3.LKA_Left_Lane_B.PRED_OCCLUDED_LM_EXTRAPOLATION = (vco.data[4]>>7)&0x01;
        meLanes3.LKA_Left_Lane_B.PRED_HEADWAY_ORIENTED = (vco.data[5]>>0)&0x01;
        meLanes3.LKA_Left_Lane_B.PRED_SOURCE_DIVERGING_LANES = (vco.data[5]>>3)&0x01;
        meLanes3.LKA_Left_Lane_B.PRED_SOURCE_GUARDRAIL_SHADOW = (vco.data[5]>>4)&0x01;
        meLanes3.LKA_Left_Lane_B.PRED_SOURCE_HWE_SPAIN = (vco.data[5]>>5)&0x01;
        meLanes3.LKA_Left_Lane_B.PRED_SOURCE_STD = (vco.data[5]>>6)&0x01;
        meLanes3.LKA_Left_Lane_B.PRED_SOURCE_VRTL_MERGE = (vco.data[5]>>7)&0x01;
        meLanes3.LKA_Left_Lane_B.TLC = vco.data[6]*0.01;

        break;
    }
    case LKA_Right_Lane_A:
    {
        meLanes3.LKA_Right_Lane_A.can_frame_recv_time = vco_TimeStamp;
        meLanes3.LKA_Right_Lane_A.Lane_Type = vco.data[0]&0x0f;
        meLanes3.LKA_Right_Lane_A.Quality = (vco.data[0]>>4)&0x03;

        if(((vco.data[2]>>0)&0x01) == 1)
            meLanes3.LKA_Right_Lane_A.Lane_Model_C0 = ((vco.data[2]&0x01)*256*4+vco.data[1]*4+((vco.data[0]>>6)&0x03)-0x800)*0.01;
        else
            meLanes3.LKA_Right_Lane_A.Lane_Model_C0 = ((vco.data[2]&0x01)*256*4+vco.data[1]*4+((vco.data[0]>>6)&0x03))*0.01;

        if(((vco.data[4]>>0)&0x01) == 1)
            meLanes3.LKA_Right_Lane_A.Lane_Model_C2 = ((vco.data[4]&0x01)*256*128+vco.data[3]*128+((vco.data[2]>>1)&0x7f)-0x10000)*0.000000977;
        else
            meLanes3.LKA_Right_Lane_A.Lane_Model_C2 = ((vco.data[4]&0x01)*256*128+vco.data[3]*128+((vco.data[2]>>1)&0x7f))*0.000000977;

        if((((vco.data[6]>>0))&0x01) == 1)
            meLanes3.LKA_Right_Lane_A.Lane_Model_C3 = ((vco.data[6]&0x01)*256*128+vco.data[5]*128+((vco.data[4]>>1)&0x7f)-0x10000)*0.00000000373;
        else
            meLanes3.LKA_Right_Lane_A.Lane_Model_C3 = ((vco.data[6]&0x01)*256*128+vco.data[5]*128+((vco.data[4]>>1)&0x7f))*0.00000000373;

        meLanes3.LKA_Right_Lane_A.Width_marking = ((vco.data[7]&0x01)*128+((vco.data[6]>>1)&0x7f))*0.01;
        meLanes3.LKA_Right_Lane_A.SF_confidence = ((vco.data[7]>>1)&0x0f)*0.1;

        break;
    }
    case LKA_Right_Lane_B:
    {
        meLanes3.LKA_Right_Lane_B.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>1)&0x01) == 1)
            meLanes3.LKA_Right_Lane_B.Lane_Model_C1 = ((vco.data[1]&0x03)*256+vco.data[0]-0x400)*0.0009765625;
        else
            meLanes3.LKA_Right_Lane_B.Lane_Model_C1 = ((vco.data[1]&0x03)*256+vco.data[0])*0.0009765625;

        meLanes3.LKA_Right_Lane_B.View_Range_Start = ((vco.data[2]&0x07)*64+((vco.data[1]>>2)&0x3f))*0.5;
        meLanes3.LKA_Right_Lane_B.View_Range_End = ((vco.data[3]&0x0f)*32+((vco.data[2]>>3)&0x1f))*0.5;
        meLanes3.LKA_Right_Lane_B.Lane_Crossing = vco.data[4]&0x01;
        meLanes3.LKA_Right_Lane_B.Lane_mark_color = (vco.data[4]>>1)&0x07;
        meLanes3.LKA_Right_Lane_B.PRED_DIST_BASED_EXTRAPOLATION = (vco.data[4]>>4)&0x01;
        meLanes3.LKA_Right_Lane_B.PRED_OTHER_SIDE = (vco.data[4]>>5)&0x01;
        meLanes3.LKA_Right_Lane_B.PRED_OVERRIDE = (vco.data[4]>>6)&0x01;
        meLanes3.LKA_Right_Lane_B.PRED_OCCLUDED_LM_EXTRAPOLATION = (vco.data[4]>>7)&0x01;
        meLanes3.LKA_Right_Lane_B.PRED_HEADWAY_ORIENTED = (vco.data[5]>>0)&0x01;
        meLanes3.LKA_Right_Lane_B.PRED_SOURCE_DIVERGING_LANES = (vco.data[5]>>3)&0x01;
        meLanes3.LKA_Right_Lane_B.PRED_SOURCE_GUARDRAIL_SHADOW = (vco.data[5]>>4)&0x01;
        meLanes3.LKA_Right_Lane_B.PRED_SOURCE_HWE_SPAIN = (vco.data[5]>>5)&0x01;
        meLanes3.LKA_Right_Lane_B.PRED_SOURCE_STD = (vco.data[5]>>6)&0x01;
        meLanes3.LKA_Right_Lane_B.PRED_SOURCE_VRTL_MERGE = (vco.data[5]>>7)&0x01;
        meLanes3.LKA_Right_Lane_B.TLC = vco.data[6]*0.01;

        break;
    }
    case Road_Information:
    {
        meLanes3.Road_Information.can_frame_recv_time = vco_TimeStamp;
        meLanes3.Road_Information.Construction_Area = vco.data[0]&0x03;
        meLanes3.Road_Information.Road_Type = (vco.data[0]>>2)&0x03;
        meLanes3.Road_Information.Highway_Exit_Right = (vco.data[0]>>4)&0x01;
        meLanes3.Road_Information.Highway_Exit_Left = (vco.data[0]>>5)&0x01;
        meLanes3.Road_Information.Lane_Assignment_Host_Index_0m = (vco.data[1]&0x03)*4+((vco.data[0]>>6)&0x03);
        meLanes3.Road_Information.Lane_Assignment_Host_Index_35m = (vco.data[1]>>2)&0x0f;
        meLanes3.Road_Information.NumOfLanes_0m = (vco.data[2]&0x03)*4+((vco.data[1]>>6)&0x03);
        meLanes3.Road_Information.NumOfLanes_35m = (vco.data[2]>>2)&0x0f;
        meLanes3.Road_Information.SnowDecision = (vco.data[2]>>6)&0x01;

        if(((vco.data[3]>>5)&0x01) == 1)
            meLanes3.Road_Information.SnowPrediction = ((vco.data[3]&0x3f)-0x40)*0.5;
        else
            meLanes3.Road_Information.SnowPrediction = (vco.data[3]&0x3f)*0.5;

        meLanes3.Road_Information.Right_is_JPN_HWE = (vco.data[3]>>6)&0x01;
        meLanes3.Road_Information.Left_is_JPN_HWE = (vco.data[3]>>7)&0x01;
        meLanes3.Road_Information.Left_decelLaneBoundaryWidth = (vco.data[4]&0x7f)*0.01;
        meLanes3.Road_Information.TLM_decelerationArea = (vco.data[4]>>7)&0x01;
        meLanes3.Road_Information.Right_decelLaneBoundaryWidth = ((vco.data[5]>>1)&0x7f)*0.01;
        meLanes3.Road_Information.protocol_version = vco.data[7];

        break;
    }
    case Next_Left_Lane_A:
    {
        meLanes3.Next_Left_Lane_A.can_frame_recv_time = vco_TimeStamp;
        meLanes3.Next_Left_Lane_A.Lane_Type = vco.data[0]&0x0f;
        meLanes3.Next_Left_Lane_A.Quality = (vco.data[0]>>4)&0x03;

        if(((vco.data[2]>>0)&0x01) == 1)
            meLanes3.Next_Left_Lane_A.Lane_Model_C0 = ((vco.data[2]&0x01)*256*4+vco.data[1]*4+((vco.data[0]>>6)&0x03)-0x800)*0.01;
        else
            meLanes3.Next_Left_Lane_A.Lane_Model_C0 = ((vco.data[2]&0x01)*256*4+vco.data[1]*4+((vco.data[0]>>6)&0x03))*0.01;

        if(((vco.data[4]>>0)&0x01) == 1)
            meLanes3.Next_Left_Lane_A.Lane_Model_C2 = ((vco.data[4]&0x01)*256*128+vco.data[3]*128+((vco.data[2]>>1)&0x7f)-0x10000)*0.000000977;
        else
            meLanes3.Next_Left_Lane_A.Lane_Model_C2 = ((vco.data[4]&0x01)*256*128+vco.data[3]*128+((vco.data[2]>>1)&0x7f))*0.000000977;

        if(((vco.data[6]>>0)&0x01) == 1)
            meLanes3.Next_Left_Lane_A.Lane_Model_C3 = ((vco.data[6]&0x01)*256*128+vco.data[5]*128+((vco.data[4]>>1)&0x7f)-0x10000)*0.00000000373;
        else
            meLanes3.Next_Left_Lane_A.Lane_Model_C3 = ((vco.data[6]&0x01)*256*128+vco.data[5]*128+((vco.data[4]>>1)&0x7f))*0.00000000373;

        meLanes3.Next_Left_Lane_A.Width_marking = ((vco.data[7]&0x01)*128+((vco.data[6]>>1)&0x7f))*0.01;
        meLanes3.Next_Left_Lane_A.SF_confidence = ((vco.data[7]>>1)&0x0f)*0.1;

        break;
    }
    case Next_Left_Lane_B:
    {
        meLanes3.Next_Left_Lane_B.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>1)&0x01) == 1)
            meLanes3.Next_Left_Lane_B.Lane_Model_C1 = ((vco.data[1]&0x03)*256+vco.data[0]-0x400)*0.0009765625;
        else
            meLanes3.Next_Left_Lane_B.Lane_Model_C1 = ((vco.data[1]&0x03)*256+vco.data[0])*0.0009765625;

        meLanes3.Next_Left_Lane_B.View_Range_Start = ((vco.data[2]&0x07)*64+((vco.data[1]>>2)&0x3f))*0.5;
        meLanes3.Next_Left_Lane_B.View_Range_End = ((vco.data[3]&0x0f)*32+((vco.data[2]>>3)&0x1f))*0.5;
        meLanes3.Next_Left_Lane_B.Lane_mark_color = (vco.data[3]>>4)&0x07;

        break;
    }
    case Next_Right_Lane_A:
    {
        meLanes3.Next_Right_Lane_A.can_frame_recv_time = vco_TimeStamp;
        meLanes3.Next_Right_Lane_A.Lane_Type = vco.data[0]&0x0f;
        meLanes3.Next_Right_Lane_A.Quality = (vco.data[0]>>4)&0x03;

        if(((vco.data[2]>>0)&0x01) == 1)
            meLanes3.Next_Right_Lane_A.Lane_Model_C0 = ((vco.data[2]&0x01)*256*4+vco.data[1]*4+((vco.data[0]>>6)&0x03)-0x800)*0.01;
        else
            meLanes3.Next_Right_Lane_A.Lane_Model_C0 = ((vco.data[2]&0x01)*256*4+vco.data[1]*4+((vco.data[0]>>6)&0x03))*0.01;

        if(((vco.data[4]>>0)&0x01) == 1)
            meLanes3.Next_Right_Lane_A.Lane_Model_C2 = ((vco.data[4]&0x01)*256*128+vco.data[3]*128+((vco.data[2]>>1)&0x7f)-0x10000)*0.000000977;
        else
            meLanes3.Next_Right_Lane_A.Lane_Model_C2 = ((vco.data[4]&0x01)*256*128+vco.data[3]*128+((vco.data[2]>>1)&0x7f))*0.000000977;

        if(((vco.data[6]>>0)&0x01) == 1)
            meLanes3.Next_Right_Lane_A.Lane_Model_C3 = ((vco.data[6]&0x01)*256*128+vco.data[5]*128+((vco.data[4]>>1)&0x7f)-0x10000)*0.00000000373;
        else
            meLanes3.Next_Right_Lane_A.Lane_Model_C3 = ((vco.data[6]&0x01)*256*128+vco.data[5]*128+((vco.data[4]>>1)&0x7f))*0.00000000373;

        meLanes3.Next_Right_Lane_A.Width_marking = ((vco.data[7]&0x01)*128+((vco.data[6]>>1)&0x7f))*0.01;
        meLanes3.Next_Right_Lane_A.SF_confidence = ((vco.data[7]>>1)&0x0f)*0.1;

        break;
    }
    case Next_Right_Lane_B:
    {
        meLanes3.Next_Right_Lane_B.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>1)&0x01) == 1)
            meLanes3.Next_Right_Lane_B.Lane_Model_C1 = ((vco.data[1]&0x03)*256+vco.data[0]-0x400)*0.0009765625;
        else
            meLanes3.Next_Right_Lane_B.Lane_Model_C1 = ((vco.data[1]&0x03)*256+vco.data[0])*0.0009765625;

        meLanes3.Next_Right_Lane_B.View_Range_Start = ((vco.data[2]&0x07)*64+((vco.data[1]>>2)&0x3f))*0.5;
        meLanes3.Next_Right_Lane_B.View_Range_End = ((vco.data[3]&0x0f)*32+((vco.data[2]>>3)&0x1f))*0.5;
        meLanes3.Next_Right_Lane_B.Lane_mark_color = (vco.data[3]>>4)&0x07;

        break;
    }
    case FS_Points_message1:
    case FS_Points_message2:
    case FS_Points_message3:
    case FS_Points_message4:
    case FS_Points_message5:
    case FS_Points_message6:
    case FS_Points_message7:
    case FS_Points_message8:
    case FS_Points_message9:
    case FS_Points_message10:
    case FS_Points_message11:
    case FS_Points_message12:
    case FS_Points_message13:
    case FS_Points_message14:
    case FS_Points_message15:
    case FS_Points_message16:
    case FS_Points_message17:
    case FS_Points_message18:
    case FS_Points_message19:
    case FS_Points_message20:
    case FS_Points_message21:
    {
        int index = vco.can_id-FS_Points_message1;
        meFreeSpaceRWC3.FS_Points_message[index].can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>2)&0x01) == 1)
            meFreeSpaceRWC3.FS_Points_message[index].FS_Point[0].FS_lateral = ((vco.data[1]&0x07)*256+vco.data[0]-0x800)*0.05;
        else
            meFreeSpaceRWC3.FS_Points_message[index].FS_Point[0].FS_lateral = ((vco.data[1]&0x07)*256+vco.data[0])*0.05;

        meFreeSpaceRWC3.FS_Points_message[index].FS_Point[0].FS_longitudinal = ((vco.data[2]&0x1f)*32+((vco.data[1]>>3)&0x1f))*0.1;

        if(((vco.data[3]>>7)&0x01) == 1)
            meFreeSpaceRWC3.FS_Points_message[index].FS_Point[1].FS_lateral = (vco.data[3]*8+((vco.data[2]>>5)&0x07)-0x800)*0.05;
        else
            meFreeSpaceRWC3.FS_Points_message[index].FS_Point[1].FS_lateral = (vco.data[3]*8+((vco.data[2]>>5)&0x07))*0.05;

        meFreeSpaceRWC3.FS_Points_message[index].FS_Point[1].FS_longitudinal = ((vco.data[5]&0x03)*256+vco.data[4])*0.1;

        if(((vco.data[6]>>4)&0x01) == 1)
            meFreeSpaceRWC3.FS_Points_message[index].FS_Point[2].FS_lateral = ((vco.data[6]&0x1f)*64+((vco.data[5]>>2)&0x3f)-0x800)*0.05;
        else
            meFreeSpaceRWC3.FS_Points_message[index].FS_Point[2].FS_lateral = ((vco.data[6]&0x1f)*64+((vco.data[5]>>2)&0x3f))*0.05;

        meFreeSpaceRWC3.FS_Points_message[index].FS_Point[2].FS_longitudinal = ((vco.data[7]&0x7f)*8+((vco.data[6]>>5)&0x07))*0.1;

        break;
    }
    case FS_Points_message22:
    {
        int index = vco.can_id-FS_Points_message1;
        meFreeSpaceRWC3.FS_Points_message[index].can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>2)&0x01) == 1)
            meFreeSpaceRWC3.FS_Points_message[index].FS_Point[0].FS_lateral = ((vco.data[1]&0x07)*256+vco.data[0]-0x800)*0.05;
        else
            meFreeSpaceRWC3.FS_Points_message[index].FS_Point[0].FS_lateral = ((vco.data[1]&0x07)*256+vco.data[0])*0.05;

        meFreeSpaceRWC3.FS_Points_message[index].FS_Point[0].FS_longitudinal = ((vco.data[2]&0x1f)*32+((vco.data[1]>>3)&0x1f))*0.1;
        break;
    }
    case FS_Header:
    {
        meFreeSpaceRWC3.FS_Header.can_frame_recv_time = vco_TimeStamp;
        meFreeSpaceRWC3.FS_Header.protocol_version = vco.data[0]&0x1f;
        break;
    }
    case FS_Types_message1:
    case FS_Types_message2:
    case FS_Types_message3:
    {
        int index = vco.can_id-FS_Types_message1;

        meFreeSpaceRWC3.FS_Types_message[index].can_frame_recv_time = vco_TimeStamp;

        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[0] = vco.data[0]&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[1] = (vco.data[0]>>3)&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[2] = (vco.data[1]&0x01)*4+((vco.data[0]>>6)&0x03);
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[3] = (vco.data[1]>>1)&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[4] = (vco.data[1]>>4)&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[5] = (vco.data[2]&0x03)*2+((vco.data[1]>>7)&0x01);
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[6] = (vco.data[2]>>2)&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[7] = (vco.data[2]>>5)&0x07;

        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[8] = vco.data[3]&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[9] = (vco.data[3]>>3)&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[10] = (vco.data[4]&0x01)*4+((vco.data[3]>>6)&0x03);
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[11] = (vco.data[4]>>1)&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[12] = (vco.data[4]>>4)&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[13] = (vco.data[5]&0x03)*2+((vco.data[4]>>7)&0x01);
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[14] = (vco.data[5]>>2)&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[15] = (vco.data[5]>>5)&0x07;

        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[16] = vco.data[6]&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[17] = (vco.data[6]>>3)&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[18] = (vco.data[7]&0x01)*4+((vco.data[6]>>6)&0x03);
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[19] = (vco.data[7]>>1)&0x07;
        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[20] = (vco.data[7]>>4)&0x07;


        break;
    }
    case FS_Types_message4:
    {
        int index = vco.can_id-FS_Types_message1;

        meFreeSpaceRWC3.FS_Types_message[index].can_frame_recv_time = vco_TimeStamp;

        meFreeSpaceRWC3.FS_Types_message[index].FS_Type_Point[0] = vco.data[0]&0x07;

        break;
    }
    case HPP_Header:
    {
        meHPP3.HPP_Header.can_frame_recv_time = vco_TimeStamp;
        meHPP3.HPP_Header.protocol_version = vco.data[3];
        meHPP3.HPP_Header.Image_grabIndex = vco.data[5]*256+vco.data[4];
        meHPP3.HPP_Header.Image_timeStamp = vco.data[7]*256+vco.data[6];

        break;
    }
    case PP_Model:
    {
        meHPP3.PP_Model.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>2)&0x01) == 1)
            meHPP3.PP_Model.HPP_Model_C0 = ((vco.data[1]&0x07)*256+vco.data[0]-0x800)*0.01;
        else
            meHPP3.PP_Model.HPP_Model_C0 = ((vco.data[1]&0x07)*256+vco.data[0])*0.01;

        if(((vco.data[2]>>4)&0x01) == 1)
            meHPP3.PP_Model.HPP_Model_C1 = ((vco.data[2]&0x1f)*32+((vco.data[1]>>3)&0x1f)-0x400)*0.0009765625;
        else
            meHPP3.PP_Model.HPP_Model_C1 = ((vco.data[2]&0x1f)*32+((vco.data[1]>>3)&0x1f))*0.0009765625;

        if(((vco.data[4]>>4)&0x01) == 1)
            meHPP3.PP_Model.HPP_Model_C2 = ((vco.data[4]&0x1f)*256*8+vco.data[3]*8+((vco.data[2]>>5)&0x07)-0x10000)*0.000000977;
        else
            meHPP3.PP_Model.HPP_Model_C2 = ((vco.data[4]&0x1f)*256*8+vco.data[3]*8+((vco.data[2]>>5)&0x07))*0.000000977;

        if(((vco.data[6]>>4)&0x01) == 1)
            meHPP3.PP_Model.HPP_Model_C3 = ((vco.data[6]&0x1f)*256*8+vco.data[5]*8+((vco.data[4]>>5)&0x07)-0x10000)*0.00000000373;
        else
            meHPP3.PP_Model.HPP_Model_C3 = ((vco.data[6]&0x1f)*256*8+vco.data[5]*8+((vco.data[4]>>5)&0x07))*0.00000000373;

        meHPP3.PP_Model.PP_error = ((vco.data[7]&0x1f)*8+((vco.data[6]>>5)&0x07))*0.05;

        break;
    }
    case Road_HPP_Fusion_Msg_A:
    {
        meHPP3.Road_HPP_Fusion_Msg_A.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>2)&0x01) == 1)
            meHPP3.Road_HPP_Fusion_Msg_A.Fusion_Model_C0 = ((vco.data[1]&0x07)*256+vco.data[0]-0x800)*0.01;
        else
            meHPP3.Road_HPP_Fusion_Msg_A.Fusion_Model_C0 = ((vco.data[1]&0x07)*256+vco.data[0])*0.01;

        if(((vco.data[2]>>4)&0x01) == 1)
            meHPP3.Road_HPP_Fusion_Msg_A.Fusion_Model_C1 = ((vco.data[2]&0x1f)*32+((vco.data[1]>>3)&0x1f)-0x400)*0.0009765625;
        else
            meHPP3.Road_HPP_Fusion_Msg_A.Fusion_Model_C1 = ((vco.data[2]&0x1f)*32+((vco.data[1]>>3)&0x1f))*0.0009765625;

        if(((vco.data[4]>>4)&0x01) == 1)
            meHPP3.Road_HPP_Fusion_Msg_A.Fusion_Model_C2 = ((vco.data[4]&0x1f)*256*8+vco.data[3]*8+((vco.data[2]>>5)&0x07)-0x10000)*0.000000977;
        else
            meHPP3.Road_HPP_Fusion_Msg_A.Fusion_Model_C2 = ((vco.data[4]&0x1f)*256*8+vco.data[3]*8+((vco.data[2]>>5)&0x07))*0.000000977;

        if(((vco.data[6]>>4)&0x01) == 1)
            meHPP3.Road_HPP_Fusion_Msg_A.Fusion_Model_C3 = ((vco.data[6]&0x1f)*256*8+vco.data[5]*8+((vco.data[4]>>5)&0x07)-0x10000)*0.000000003725;
        else
            meHPP3.Road_HPP_Fusion_Msg_A.Fusion_Model_C3 = ((vco.data[6]&0x1f)*256*8+vco.data[5]*8+((vco.data[4]>>5)&0x07))*0.000000003725;


        break;

    }
    case Road_HPP_Fusion_Msg_B:
    {
        meHPP3.Road_HPP_Fusion_Msg_B.can_frame_recv_time = vco_TimeStamp;

        if(((vco.data[1]>>3)&0x01) == 1)
            meHPP3.Road_HPP_Fusion_Msg_B.Fusion_Lateral_Control_Point = ((vco.data[1]&0x0f)*256+vco.data[0]-0x1000)*0.01;
        else
            meHPP3.Road_HPP_Fusion_Msg_B.Fusion_Lateral_Control_Point = ((vco.data[1]&0x0f)*256+vco.data[0])*0.01;

        meHPP3.Road_HPP_Fusion_Msg_B.Fusion_Long_Control_Point = ((vco.data[2]&0x7f)*16+((vco.data[1]>>4)&0x0f))*0.1;
        meHPP3.Road_HPP_Fusion_Msg_B.Fusion_Confidence = (vco.data[3]&0x7f)*0.01;
        meHPP3.Road_HPP_Fusion_Msg_B.Fusion_isPrediction = (vco.data[3]>>7)&0x01;
        meHPP3.Road_HPP_Fusion_Msg_B.Fusion_Lane_Width_Estimation = vco.data[4]*0.05;

        break;
    }
    case PP_Model_B:
    {
        meHPP3.PP_Model_B.can_frame_recv_time = vco_TimeStamp;
        meHPP3.PP_Model_B.HPP_Z_close = ((vco.data[1]&0x07)*256+vco.data[0])*0.1;
        meHPP3.PP_Model_B.HPP_Z_far = ((vco.data[2]&0x3f)*32+((vco.data[1]>>3)&0x1f))*0.1;

        break;
    }
    case Sync_Message_Output_1:
    {
        meSync3.Sync_Message_Output_1.can_frame_recv_time = vco_TimeStamp;
        meSync3.Sync_Message_Output_1.protocolTimestamp = vco.data[3]*256*256*256+vco.data[2]*256*256+vco.data[1]*256+vco.data[0];
        meSync3.Sync_Message_Output_1.imageTimestamp = vco.data[7]*256*256*256+vco.data[6]*256*256+vco.data[5]*256+vco.data[4];

        break;
    }
    case Sync_Message_Output_2:
    {
        meSync3.Sync_Message_Output_2.can_frame_recv_time = vco_TimeStamp;
        meSync3.Sync_Message_Output_2.grabIndex = vco.data[3]*256*256*256+vco.data[2]*256*256+vco.data[1]*256+vco.data[0];
        meSync3.Sync_Message_Output_2.protocol_version = vco.data[4];

        break;
    }
    case Sync_Message_Output_3:
    {
        meSync3.Sync_Message_Output_3.can_frame_recv_time = vco_TimeStamp;
        meSync3.Sync_Message_Output_3.frameIndex = vco.data[3]*256*256*256+vco.data[2]*256*256+vco.data[1]*256+vco.data[0];

        break;
    }
    }
}

int main( int argc, char** argv )
{
    ros::init(argc, argv, DEFAULT_NODE);
    ros::NodeHandle nh;
    ros::Rate rt(5);
    ros::Publisher zmq_eq4_pub = nh.advertise<visualization_msgs::Marker>(DEFAULT_TOPIC, 1);

    const char *ZMQ_ADDR = (argc > 2)? argv [2] : "tcp://T7810:5566";
    const char *FILTER = (argc > 1)? argv [1] : "CAN0 ";

    void *context = zmq_ctx_new();
    void *subscriber = zmq_socket(context, ZMQ_SUB);

    if (zmq_connect(subscriber, ZMQ_ADDR) == 0)
    {
        if (zmq_setsockopt(subscriber, ZMQ_SUBSCRIBE, FILTER, strlen(FILTER)) == 0)
        {
            char zmq_msg[ZMQ_MSG_SIZE];
            struct can_frame rx_frm;

            while (ros::ok())
            {
                unsigned int cnt = 0;
                int size = 0;

                while ( ros::ok() && (cnt < MAX_READ_TIMES) && (size = zmq_recv(subscriber, zmq_msg, ZMQ_MSG_SIZE - 1, ZMQ_DONTWAIT)) != -1 )
                {
                    if ((size >= 0) && (size < ZMQ_MSG_SIZE))
                    {
                        zmq_msg[size] = '\0';

                        if (sscanf(&zmq_msg[strlen(CAN_MSG_HDR)], CAN_FORMAT,
                            &rx_frm.can_dlc,
                            &rx_frm.can_id,
                            &rx_frm.data[0], &rx_frm.data[1], &rx_frm.data[2], &rx_frm.data[3], &rx_frm.data[4], &rx_frm.data[5], &rx_frm.data[6], &rx_frm.data[7]) == 10)
                        {
                            //ROS_INFO_STREAM(zmq_msg);
                            analysis_can_eq4(rx_frm);
                        }
                    }

                    cnt++;
                }

                if (zmq_eq4_pub.getNumSubscribers() < 1)
                {
                    //ROS_WARN_ONCE("Waiting for subscriber ...");
                    //sleep(1);
                }
                else
                {
                    visualization_msgs::Marker marker;

                    marker.header.frame_id = DEFAULT_FRAME;
                    marker.header.stamp = ros::Time::now();

                    // Set the namespace and id for this marker.  This serves to create a unique ID
                    // Any marker sent with the same namespace and id will overwrite the old one
                    marker.ns = DEFAULT_MARKER_NS;
                    marker.id = -1;

                    // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
                    marker.type = visualization_msgs::Marker::SPHERE;

                    // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
                    marker.action = visualization_msgs::Marker::ADD;

                    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
                    marker.pose.position.x = 0;
                    marker.pose.position.y = 0;
                    marker.pose.position.z = 0;

                    marker.pose.orientation.x = 0.0;
                    marker.pose.orientation.y = 0.0;
                    marker.pose.orientation.z = 0.0;
                    marker.pose.orientation.w = 1.0;

                    // Set the scale of the marker -- 1x1x1 here means 1m on a side
                    marker.scale.x = 0.5;
                    marker.scale.y = 0.5;
                    marker.scale.z = 0.5;

                    // Set the color -- be sure to set alpha to something non-zero!
                    marker.color.r = 1.0f;
                    marker.color.g = 0.0f;
                    marker.color.b = 0.0f;
                    marker.color.a = 1.0;

                    marker.lifetime = ros::Duration();

                    zmq_eq4_pub.publish(marker);

                    if (true)
                    {
                        ME_OBS3 me_display = meOBS3;

                        if(me_display.ObstacleStatusA.NumObstacles > 0)
                        {
                            for(int i = 0; i < 10; i++)
                            {
                                if(me_display.ObstacleDataA[i].ObstacleValid > 0)    // 1 new valid, 2 old valid
                                {
                                    double x = me_display.ObstacleDataA[i].ObstaclePosY;
                                    double y = me_display.ObstacleDataA[i].ObstaclePosX;
                                    double l = std::max(me_display.ObstacleDataB[i].ObstacleLength, 0.5f);
                                    double w = std::max(me_display.ObstacleDataB[i].ObstacleWidth, 0.5f);

                                    visualization_msgs::Marker marker;

                                    marker.header.frame_id = DEFAULT_FRAME;
                                    marker.header.stamp = ros::Time::now();

                                    // Set the namespace and id for this marker.  This serves to create a unique ID
                                    // Any marker sent with the same namespace and id will overwrite the old one
                                    marker.ns = DEFAULT_MARKER_OBS3_NS;
                                    marker.id = i;

                                    // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
                                    marker.type = visualization_msgs::Marker::CUBE;

                                    // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
                                    marker.action = visualization_msgs::Marker::ADD;

                                    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
                                    marker.pose.position.x = x;
                                    marker.pose.position.y = y;
                                    marker.pose.position.z = 0;

                                    marker.pose.orientation.x = 0.0;
                                    marker.pose.orientation.y = 0.0;
                                    marker.pose.orientation.z = 0.0;
                                    marker.pose.orientation.w = 1.0;

                                    // Set the scale of the marker -- 1x1x1 here means 1m on a side
                                    marker.scale.x = w;
                                    marker.scale.y = l;
                                    marker.scale.z = 0.01;

                                    // Set the color -- be sure to set alpha to something non-zero!
                                    marker.color.r = 0.0f;
                                    marker.color.g = 1.0f;
                                    marker.color.b = 0.0f;
                                    marker.color.a = 1.0;

                                    marker.lifetime = ros::Duration(2);

                                    //ROS_INFO_STREAM("x: " << std::to_string(marker.pose.position.x) << ", y: " << std::to_string(marker.pose.position.y));
                                    ROS_INFO_STREAM("w: " << std::to_string(marker.scale.x) << ", l: " << std::to_string(marker.scale.y));

                                    zmq_eq4_pub.publish(marker);
                                }
                            }
                        }
                    }

                    if (true)
                    {
                        ME_VD3D me_display = meVD3D;

                        if(me_display.VD3D_Header.numOfObjects > 0)
                        {
                            for(int i = 0; i < 10; i++)
                            {
                                if(me_display.vehicleData[i].vehicleDataA.isValid > 0)   //1 valid
                                {
                                    //cout << "draw_eq4_vd3d(): " << i << endl;

                                    double h = me_display.vehicleData[i].vehicleDataB.heading;//radians ?
                                    double x = me_display.vehicleData[i].vehicleDataC.latDist;
                                    double y = me_display.vehicleData[i].vehicleDataC.longDist;
                                    double l = std::max(me_display.vehicleData[i].vehicleDataD.length, 0.5f);
                                    double w = std::max(me_display.vehicleData[i].vehicleDataD.width, 0.5f);

                                    visualization_msgs::Marker marker;

                                    marker.header.frame_id = DEFAULT_FRAME;
                                    marker.header.stamp = ros::Time::now();

                                    // Set the namespace and id for this marker.  This serves to create a unique ID
                                    // Any marker sent with the same namespace and id will overwrite the old one
                                    marker.ns = DEFAULT_MARKER_VD3D_NS;
                                    marker.id = i;

                                    // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
                                    marker.type = visualization_msgs::Marker::CUBE;

                                    // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
                                    marker.action = visualization_msgs::Marker::ADD;

                                    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
                                    marker.pose.position.x = x;
                                    marker.pose.position.y = y;
                                    marker.pose.position.z = 0;

                                    marker.pose.orientation.x = 0.0;
                                    marker.pose.orientation.y = 0.0;
                                    marker.pose.orientation.z = sin(-0.5 * h);
                                    marker.pose.orientation.w = cos(-0.5 * h);

                                    // Set the scale of the marker -- 1x1x1 here means 1m on a side
                                    marker.scale.x = w;
                                    marker.scale.y = l;
                                    marker.scale.z = 0.01;

                                    // Set the color -- be sure to set alpha to something non-zero!
                                    marker.color.r = 0.0f;
                                    marker.color.g = 0.0f;
                                    marker.color.b = 1.0f;
                                    marker.color.a = 1.0;

                                    marker.lifetime = ros::Duration(2);

                                    //ROS_INFO_STREAM("x: " << std::to_string(marker.pose.position.x) << ", y: " << std::to_string(marker.pose.position.y));
                                    ROS_INFO_STREAM("w: " << std::to_string(marker.scale.x) << ", l: " << std::to_string(marker.scale.y));

                                    zmq_eq4_pub.publish(marker);
                                }
                            }
                        }
                    }
                }

                rt.sleep();
            }
        }
        else
        {
            ROS_WARN_ONCE("zmq_setsockopt() failed.");
        }
    }
    else
    {
        ROS_WARN_ONCE("zmq_connect() failed.");
    }

    zmq_close(subscriber);
    zmq_ctx_destroy(context);

    return 0;
}
