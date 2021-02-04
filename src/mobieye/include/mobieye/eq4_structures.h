#ifndef EQ4_STRUCTURES_H
#define EQ4_STRUCTURES_H

#include "freescale/typedefs.h"

enum EQ4_ID_INDEX
{
    VD3D_Header = 0x49C,
    syncMessage = 0x49D,

    vehicleDataA1 = 0x49E,
    vehicleDataA2 = 0x49F,
    vehicleDataA3 = 0x4A0,
    vehicleDataA4 = 0x4A1,
    vehicleDataA5 = 0x4A2,
    vehicleDataA6 = 0x4A3,
    vehicleDataA7 = 0x4A4,
    vehicleDataA8 = 0x4A5,
    vehicleDataA9 = 0x4A6,
    vehicleDataA10 = 0x4A7,

    vehicleDataB1 = 0x4A8,
    vehicleDataB2 = 0x4A9,
    vehicleDataB3 = 0x4AA,
    vehicleDataB4 = 0x4AB,
    vehicleDataB5 = 0x4AC,
    vehicleDataB6 = 0x4AD,
    vehicleDataB7 = 0x4AE,
    vehicleDataB8 = 0x4AF,
    vehicleDataB9 = 0x4B0,
    vehicleDataB10 = 0x4B1,

    vehicleDataC1 = 0x4B2,
    vehicleDataC2 = 0x4B3,
    vehicleDataC3 = 0x4B4,
    vehicleDataC4 = 0x4B5,
    vehicleDataC5 = 0x4B6,
    vehicleDataC6 = 0x4B7,
    vehicleDataC7 = 0x4B8,
    vehicleDataC8 = 0x4B9,
    vehicleDataC9 = 0x4BA,
    vehicleDataC10 = 0x4BB,

    vehicleDataD1 = 0x4BC,
    vehicleDataD2 = 0x4BD,
    vehicleDataD3 = 0x4BE,
    vehicleDataD4 = 0x4BF,
    vehicleDataD5 = 0x4C0,
    vehicleDataD6 = 0x4C1,
    vehicleDataD7 = 0x4C2,
    vehicleDataD8 = 0x4C3,
    vehicleDataD9 = 0x4C4,
    vehicleDataD10 = 0x4C5,

    vehicleDataE1 = 0x4C6,
    vehicleDataE2 = 0x4C7,
    vehicleDataE3 = 0x4C8,
    vehicleDataE4 = 0x4C9,
    vehicleDataE5 = 0x4CA,
    vehicleDataE6 = 0x4CB,
    vehicleDataE7 = 0x4CC,
    vehicleDataE8 = 0x4CD,
    vehicleDataE9 = 0x4CE,
    vehicleDataE10 = 0x4CF,

    Sync_Message_Input_1 = 0x551,

    HighLowBeam = 0x600,
    Gradual_AHBC = 0x601,
    HLB_Object_1 = 0x602,
    HLB_Object_2 = 0x603,
    HLB_Object_3 = 0x604,
    HLB_Object_4 = 0x605,
    HLB_Object_5 = 0x606,
    HLB_Object_6 = 0x607,
    HLB_Object_7 = 0x608,
    HLB_Object_8 = 0x609,
    HLB_Object_9 = 0x60A,
    HLB_Object_10 = 0x60B,
    HLB_Object_11 = 0x60C,
    HLB_Object_12 = 0x60D,

    ID_TFL0 = 0x655,
    ID_TFL1 = 0x656,
    ID_TFL2 = 0x657,
    ID_TFL3 = 0x658,
    ID_TSR0 = 0x659,
    ID_TSR1 = 0x65A,
    ID_TSR2 = 0x65B,
    ID_TSR3 = 0x65C,

    failsafe_signals_1 = 0x690,
    failsafe_signals_2 = 0x691,
    failsafe_signals_3 = 0x692,     // 通过 parse_eq4() 发现

    ME_ID_HMI3 = 0x700,

    FCW_information = 0x702,
    PCW_information = 0x703,
    ACCInfo = 0x704,
    ACCInfo_B = 0x705,
    ACCInfo_C = 0x706,

    left_CCI_measurements_A = 0x708,
    left_CCI_measurements_B = 0x709,
    right_CCI_measurements_A = 0x70A,
    right_CCI_measurements_B = 0x70B,

    Protocol_Header = 0x711,
    TFL_Header = 0x712,
    TFL_Message0 = 0x713,
    TFL_Message1 = 0x714,
    TFL_Message2 = 0x715,
    TFL_Message3 = 0x716,
    TFL_Message4 = 0x717,
    TFL_Message5 = 0x718,
    TFL_Message6 = 0x719,
    TFL_Message7 = 0x71A,
    TSR0 = 0x720,
    TSR1 = 0x721,
    TSR2 = 0x722,
    TSR3 = 0x723,
    TSR4 = 0x724,
    TSR5 = 0x725,
    TSR6 = 0x726,
    Vision_Only_TSR_continuous = 0x727,

    TSR0_2 = 0x72A,
    TSR1_2 = 0x72B,
    TSR2_2 = 0x72C,
    TSR3_2 = 0x72D,
    TSR4_2 = 0x72E,
    TSR5_2 = 0x72F,
    TSR6_2 = 0x730,

    ObstacleStatusB = 0x737,
    ObstacleStatusA = 0x738,
    ObstacleDataA1 = 0x739,
    ObstacleDataB1 = 0x73A,
    ObstacleDataC1 = 0x73B,
    ObstacleDataA2 = 0x73C,
    ObstacleDataB2 = 0x73D,
    ObstacleDataC2 = 0x73E,
    ObstacleDataA3 = 0x73F,
    ObstacleDataB3 = 0x740,
    ObstacleDataC3 = 0x741,
    ObstacleDataA4 = 0x742,
    ObstacleDataB4 = 0x743,
    ObstacleDataC4 = 0x744,
    ObstacleDataA5 = 0x745,
    ObstacleDataB5 = 0x746,
    ObstacleDataC5 = 0x747,
    ObstacleDataA6 = 0x748,
    ObstacleDataB6 = 0x749,
    ObstacleDataC6 = 0x74A,
    ObstacleDataA7 = 0x74B,
    ObstacleDataB7 = 0x74C,
    ObstacleDataC7 = 0x74D,
    ObstacleDataA8 = 0x74E,
    ObstacleDataB8 = 0x74F,
    ObstacleDataC8 = 0x750,
    ObstacleDataA9 = 0x751,
    ObstacleDataB9 = 0x752,
    ObstacleDataC9 = 0x753,
    ObstacleDataA10 = 0x754,
    ObstacleDataB10 = 0x755,
    ObstacleDataC10 = 0x756,
    ObstacleStatusC = 0x757,

    LKA_Left_Lane_C = 0x762,
    LKA_Right_Lane_C = 0x763,
    Lane_Assignment_0m = 0x764,
    Lane_Assignment_35m = 0x765,
    LKA_Left_Lane_A = 0x766,
    LKA_Left_Lane_B = 0x767,
    LKA_Right_Lane_A = 0x768,
    LKA_Right_Lane_B = 0x769,

    Road_Information = 0x76B,
    Next_Left_Lane_A = 0x76C,
    Next_Left_Lane_B = 0x76D,
    Next_Right_Lane_A = 0x76E,
    Next_Right_Lane_B = 0x76F,

    FS_Points_message1 = 0x770,
    FS_Points_message2 = 0x771,
    FS_Points_message3 = 0x772,
    FS_Points_message4 = 0x773,
    FS_Points_message5 = 0x774,
    FS_Points_message6 = 0x775,
    FS_Points_message7 = 0x776,
    FS_Points_message8 = 0x777,
    FS_Points_message9 = 0x778,
    FS_Points_message10 = 0x779,
    FS_Points_message11 = 0x77A,
    FS_Points_message12 = 0x77B,
    FS_Points_message13 = 0x77C,
    FS_Points_message14 = 0x77D,
    FS_Points_message15 = 0x77E,
    FS_Points_message16 = 0x77F,
    FS_Points_message17 = 0x780,
    FS_Points_message18 = 0x781,
    FS_Points_message19 = 0x782,
    FS_Points_message20 = 0x783,
    FS_Points_message21 = 0x784,
    FS_Points_message22 = 0x785,

    HPP_Header = 0x790,
    PP_Model = 0x791,

    Road_HPP_Fusion_Msg_A = 0x796,
    Road_HPP_Fusion_Msg_B = 0x797,
    PP_Model_B = 0x798,

    FS_Header = 0x7E0,
    FS_Types_message1 = 0x7E1,
    FS_Types_message2 = 0x7E2,
    FS_Types_message3 = 0x7E3,
    FS_Types_message4 = 0x7E4,

    Sync_Message_Output_1 = 0x7E8,
    Sync_Message_Output_2 = 0x7E9,
    Sync_Message_Output_3 = 0x7EA
};

// MobilEye 车辆信息头
struct VD3D_HEADER
{
    uint32_t can_frame_recv_time;
    uint8_t numOfObjects;//0~10
    uint8_t protocol_version;//6
};

struct SYNC_MESSAGE
{
    uint32_t can_frame_recv_time;
    uint32_t frameIndex;
    uint32_t timeStamp;
};

struct VEHICLE_DATA_A
{
    uint32_t can_frame_recv_time;
    uint8_t objectID;//0~255
    uint8_t isValid;
    uint8_t isStable;
    uint8_t isCIPV;
    uint8_t reserved1;
    float longGroundSpeed;//unit:m/sec
    float longGroundSpeedSTD;//unit:m/sec
    float latGroundSpeed;//unit:m/sec
    float latGroundSpeedSTD;//unit:m/sec
    uint8_t reserved2;
};

struct VEHICLE_DATA_B
{
    uint32_t can_frame_recv_time;
    float heading;//unit:radians
    float headingSTD;//unit:radians
    float wheelAngle;//unit:radians
    float wheelAngleSTD;//unit:radians
    float absoluteAcceleration;//unit:m/sqr sec
    float absoluteAccelerationSTD;//unit:m/sqr sec
    uint8_t reserved3;
};

struct VEHICLE_DATA_C
{
    uint32_t can_frame_recv_time;
    float longDist;//unit:meter
    float longDistSTD;//unit:meter
    float latDist;//unit:meter
    float latDistSTD;//unit:meter
    uint32_t reserved4;
};

struct VEHICLE_DATA_D
{
    uint32_t can_frame_recv_time;
    float length;//unit:meter
    float lengthSTD;//unit:meter
    float width;//unit:meter
    float widthSTD;//unit:meter
    float height;//unit:meter
    float heightSTD;//unit:meter
    uint8_t reserved5;
};

struct VEHICLE_DATA_E
{
    uint32_t can_frame_recv_time;
    float latRelSpeed;//unit:m/sec
    float latRelSpeedSTD;//unit:m/sec
    float longRelSpeed;//unit:m/sec
    float longRelSpeedSTD;//unit:m/sec
    float relativeAcceleration;//unit:m/sqr sec
    float relativeAccelerationSTD;//unit:m/sqr sec
    uint8_t reserved6;
};

// MobilEye 车辆信息
struct VEHICLE_DATA
{
    VEHICLE_DATA_A  vehicleDataA;
    VEHICLE_DATA_B  vehicleDataB;
    VEHICLE_DATA_C  vehicleDataC;
    VEHICLE_DATA_D  vehicleDataD;
    VEHICLE_DATA_E  vehicleDataE;
};

// MobilEye 识别出的车辆信息
struct ME_VD3D
{
    VD3D_HEADER VD3D_Header;
    SYNC_MESSAGE syncMessage;
    VEHICLE_DATA vehicleData[10];
};

struct ME_SYNC3_SENSOR
{
    uint32_t can_frame_recv_time;
    uint32_t externalClockTimestamp;
    uint32_t reserved1;
};

struct SYNC_MESSAGE_OUTPUT_1
{
    uint32_t can_frame_recv_time;
    uint32_t protocolTimestamp;
    uint32_t imageTimestamp;
};

struct SYNC_MESSAGE_OUTPUT_2
{
    uint32_t can_frame_recv_time;
    uint32_t grabIndex;
    uint8_t protocol_version;//2
};

struct SYNC_MESSAGE_OUTPUT_3
{
    uint32_t can_frame_recv_time;
    uint32_t frameIndex;
};

struct ME_SYNC3
{
    SYNC_MESSAGE_OUTPUT_1 Sync_Message_Output_1;
    SYNC_MESSAGE_OUTPUT_2 Sync_Message_Output_2;
    SYNC_MESSAGE_OUTPUT_3 Sync_Message_Output_3;
};

// Advanced High-Beam Control
struct GRADUAL_AHBC
{
    uint32_t can_frame_recv_time;
    float BNDRY_DOM_BOT_NGL_HLB;//unit:deg
    float BNDRY_DOM_LH_NGL_HLB;//unit:deg
    float BNDRY_DOM_RH_NGL_HLB;//unit:deg
    uint8_t ST_BNDRY_DOM_BOT_NGL_HLB;//0 = oncomingm,1 = couple of oncoming,2 = preceding,
                                    //3 = couple of preceding,4 = couple of OC upper truck lights
                                    //5 = stree light,6 = cluster,15 = invalid
    uint8_t ST_BNDRY_DOM_LH_NGL_HLB;//0 = oncomingm,1 = couple of oncoming,2 = preceding,
                                    //3 = couple of preceding,4 = couple of OC upper truck lights
                                    //5 = stree light,6 = cluster,15 = invalid
    uint8_t ST_BNDRY_DOM_RH_NGL_HLB;//0 = oncomingm,1 = couple of oncoming,2 = preceding,
                                    //3 = couple of preceding,4 = couple of OC upper truck lights
                                    //5 = stree light,6 = cluster,15 = invalid
    uint8_t Num_Of_Objects;

};

// 远近光
struct HIGH_LOW_BEAM
{
    uint32_t can_frame_recv_time;
    uint8_t Reason_Preceding;//0-off,1-on
    uint8_t Reason_Preceding_Grace;//0-off,1-on
    uint8_t Reason_Oncoming;//0-off,1-on
    uint8_t Reason_Oncoming_Grace;//0-off,1-on
    uint8_t Reason_Street_Light;//0-off,1-on
    uint8_t Reason_Street_Light_Grace;//0-off,1-on
    uint8_t Reason_Lit_Night;//0-off,1-on
    uint8_t Reason_Lit_Night_US;//0-off,1-on
    uint8_t Reason_Low_speed;//0-off,1-on
    uint8_t Reason_Bright_Scene;//0-off,1-on
    uint8_t Reason_Sharp_Curve;//0-off,1-on
    uint8_t Reason_Load_Balance;//0-off,1-on
    uint8_t reserved_4;
    uint8_t HLB_decision;//0-High Beam off,1-High Beam on
    uint8_t HLB_Running_Mode;//0 = HLB_Day,1 = HLB_Inactive,2 = HLB_Full,3 = invalid
    uint8_t Reason_for_HLB_Inactive;//0 = obviously bright,1 = low detection rate,2 = in grace,3 = deactivated,15 = invalid reason
    uint8_t reserved_1;
};

struct HLB_OBJECT
{
    uint32_t can_frame_recv_time;
    float HLB_OBJ_ANG;//unit:deg
    float HLB_OBJ_DIST;//unit:m
    float HLB_COUPLED_WIDTH;//unit:deg
    uint8_t HLB_OBJ_TYPE;//0 = oncomingm,1 = couple of oncoming,2 = preceding,
                         //3 = couple of preceding,4 = couple of OC upper truck lights
                         //5 = stree light,6 = cluster,15 = invalid
    uint8_t HLB_OBJ_VALID;//0 = invalid,1 = valid
    float HLB_OBJ_ANG_BOTTOM;//unit:deg
};

struct ME_AHBC3
{
    GRADUAL_AHBC Gradual_AHBC;
    HIGH_LOW_BEAM HighLowBeam;
    HLB_OBJECT HLB_Object[12];
};

// 交通信号灯 ID
struct ID_TFL
{
    uint32_t can_frame_recv_time;
    uint32_t Internal_ID0;
    uint32_t Internal_ID1;
};

// 交通标识 ID
struct ID_TSR
{
    uint32_t can_frame_recv_time;
    uint32_t Internal_ID0;
    uint32_t Internal_ID1;
};

struct PROTOCOL_HEADER
{
    uint32_t can_frame_recv_time;
    uint8_t protocol_version;//10
    uint8_t num_Of_TSR_Suspects;//0~7
};

// 交通信号灯信息头
struct TFL_HEADER
{
    uint32_t can_frame_recv_time;
    uint8_t Number_Of_TFL_Objects;//0-no traffic light detected
    uint8_t Main_Object_ID;//The ID that represents the TFL which is the most relevant for the host vehicle
    uint8_t Reserved_1;
    float TFL_TTC;//unit:sec
    float StopSign_TTC;//unit:sec
    float Stop_Line_Dist;//unit:m
    uint8_t Junction_Status;//0 = none,1 = reserved,2 = unknown,3 = red,4 = red+orange,5 = orange,6 = green
    float JNC_Distance;//unit:m
    uint16_t Stop_Line_Valid;
    uint8_t TFL_Warning_Supression_By_Vision;//0 = VIS_NO_SUPPRESS,1 = VIS_TFL_TOO_LEFT,2 = VIS_TFL_TOO_RIGHT,
                                            //3 = VIS_TFL_COLOR_CONFLICT,4 = VIS_SINGLE_TFL,5 = VIS_FAR_JUNCTION
                                            //6 = VIS_CLOSE_CIPV,7 = VIS_NO_GROUP,8 = VIS_BLINKING
                                            //9 = VIS_BLINKING_NOT_DETERMINED,10 = VIS_JPN_SUPP_ARROWS_APPROVED,11 = VIS_JPN_NO_STOPLINE_APPROVED
                                            //12 = VIS_JNC_PASSED,13 = VIS_TOLL_GATE,14 = unused,15 = unused
    uint8_t TFL_Warning_Supression_By_Driver;//0 = RTW_DRIVER_NO_SUPPRESS
                                            //1 = RTW_DRIVER_BRAKE_PRESSED
                                            //2 = RTW_DRIVER_BLINKING
                                            //3 = RTW_DRIVER_HIGH_YAW
                                            //4 = unused
                                            //5 = unused
                                            //6 = unused
                                            //7 = unused
    uint8_t SS_Warning_Supression;  //0 = SSW_NO_SUPPRESS
                                    //1 = SSW_CIPV_STOPPED
                                    //2 = SSW_EU_RTW_SUPPRESS
                                    //3 = SSW_DRIVER_HIGH_YAW
                                    //4 = SSW_SUPPRESS_BY_RELEVANCE
                                    //5 = SSW_LOW_ACC_OR_SPEED_SUPPRESS
                                    //6 = SSW_DISABLE_AFTER_WARNING
                                    //7 = SSW_MIN_WARNING_DIST
    uint8_t StopSign_notification;
    uint8_t StopSign_Warning;
    uint8_t TFL_notification;
    uint8_t TFL_Warning;
};

// 交通信号灯信息
struct TFL_MESSAGE
{
    uint32_t can_frame_recv_time;
    float TFL_PosY;//unit:m,Height of TFL with respect to ground
    float TFL_PosX;//unit:m,Lateral distance with respect to camera. Positive values for detections right of the camera.
    float TFL_PosZ;//unit:m,Longitudinal distance with respect to the camera.
    uint8_t TFL_Color;//0 = Unknown '0x0'
                      //    1 = Red '0x1'
                      //    2 = Yellow '0x2'
                      //    3 = Green '0x3'
                      //    4 = Red + Yellow '0x4'
    float TFL_Width;//unit:m
    uint8_t TFL_Type;//0 = Unknown/Unsupported
                     //    1 = Vertical 3-light
                     //    2 = Horizontal 3-light
    uint8_t TFL_Supp1_Arrow;//Relevant only for Japan TFL
                            //0 = Unknown/Unsupported
                            //    1 = Forward
                            //    2 = Left
                            //    3 = Right
                            //    4 = Bent Left (not yet supported)
                            //    5 = Bent Right (not yet supported)
                            //    6 = Forward&Left (not yet supported)
                            //    7 = Forward&Right (not yet supported
                            //    8 = Diagonal Left(not yet supported)
                            //    9 = Diagonal Right(not yet supported
    uint8_t TFL_Supp2_Arrow;//Relevant only for Japan TFL
                            //0 = Unknown/Unsupported
                            //    1 = Forward
                            //    2 = Left
                            //    3 = Right
                            //    4 = Bent Left (not yet supported)
                            //    5 = Bent Right (not yet supported)
                            //    6 = Forward&Left (not yet supported)
                            //    7 = Forward&Right (not yet supported
                            //    8 = Diagonal Left(not yet supported)
                            //    9 = Diagonal Right(not yet supported
    uint8_t TFL_Supp3_Arrow;//Relevant only for Japan TFL
                            //0 = Unknown/Unsupported
                            //    1 = Forward
                            //    2 = Left
                            //    3 = Right
                            //    4 = Bent Left (not yet supported)
                            //    5 = Bent Right (not yet supported)
                            //    6 = Forward&Left (not yet supported)
                            //    7 = Forward&Right (not yet supported
                            //    8 = Diagonal Left(not yet supported)
                            //    9 = Diagonal Right(not yet supported
    uint8_t TFL_assignment; //arrow direction inside the TFL
                            //    0 = unknown
                            //    1 = right
                            //    2 = left
                            //    3 = reserved
                            //    4 = reserved
                            //    5 = reserved
                            //    6 = reserved
                            //    7 = reserved
    uint8_t Object_ID;
    uint8_t is_TFL_Blinking;
    uint8_t reserved_8;

};

// 交通标识
struct TSR
{
    uint32_t can_frame_recv_time;
    uint8_t Vision_only_Sign_Type;
    uint8_t Vision_only_Supp_Sign_Type;
    float Sign_Height;//unit:m
    float Sign_Width;//unit:m
    uint8_t Filter_type;
                        //0 = Not filtered
                        //1 = Irrelevant to the host driver
                        //2 = On vehicle/Truck
                        //3 = Embedded
    uint8_t Approved_Flag;
    uint8_t No_Entry_Vision_Status;

};

struct VISION_ONLY_TSR_CONTINUOUS
{
    uint8_t Vision_only_Sign_Type_D1;
    uint8_t Vision_only_supp_Sign_Type_D1;
    uint8_t Vision_only_Sign_Type_D2;
    uint8_t Vision_only_supp_Sign_Type_D2;
    uint8_t Vision_only_Sign_Type_D3;
    uint8_t Vision_only_supp_Sign_Type_D3;
    uint8_t Vision_only_Sign_Type_D4;
    uint8_t Vision_only_supp_Sign_Type_D4;
};

// 交通标识信息
struct TSR_2
{
    uint32_t can_frame_recv_time;
    float Sign_Position_X;//unit:m
    float Sign_Position_Y;//unit:m
    float Sign_Position_Z;//unit:m
};

// MobilEye 识别的交通标识
struct ME_TSR3
{
    ID_TFL id_tfl[4];
    ID_TSR id_tsr[4];
    PROTOCOL_HEADER Protocol_Header;
    TFL_HEADER TFL_Header;
    TFL_MESSAGE TFL_Message[8];
    TSR tsr[7];
    VISION_ONLY_TSR_CONTINUOUS Vision_Only_TSR_continuous;
    TSR_2 tsr_2[7];
};

struct FAIL_SAFE_SIGNALS_1
{
    uint32_t can_frame_recv_time;
    uint8_t FS_LOW_SUN;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_BLUR_IMAGE;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_FULL_BLOCKAGE_BIT;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_PARTIAL_TRANSPARENT_BLOCKAGE;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_OUT_OF_CALIBRATION;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_OUT_OF_CALIBRATION_YAW;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_OUT_OF_CALIBRATION_HORIZON;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_SPLASHES;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_SMEARED_SPOTS;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_SMEARED_HALOS;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_FOGGY_LIGHTS;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_SUN_RAY;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown
    uint8_t FS_SELF_GLARE;
                        //    0 = none
                        //    1 = low
                        //    2 = medium
                        //    3 = high
                        //    7 = unknown


};

struct FAIL_SAFE_SIGNALS_2
{
    uint32_t can_frame_recv_time;
    uint8_t protocol_version;//2
};

struct ME_FAIL_SAFES3
{
    FAIL_SAFE_SIGNALS_1 failsafe_signals_1;
    FAIL_SAFE_SIGNALS_2 failsafe_signals_2;
};

struct ME_HMI3
{
    uint32_t can_frame_recv_time;
    uint8_t SoundType;
                        //    0 = silent
                        //    1 = LDWL
                        //    2 = LDWR
                        //    3 = Far_HW ( = HW1/HW2/HW3)
                        //    4 = Near_HW
                        //    5 = Soft FCW
                        //    6 = Hard FCW + Peds FCW
                        //    7 = Reserved
    uint8_t HLB_Running_Mode;
                        //    0 = HLB_Day
                        //    1 = HLB_Inactive
                        //    2 = HLB_Full
                        //    3 = Invalid
    uint8_t Continues_sound;
    uint8_t Suppress;
                        //    0 = old sound
                        //    1 = new sound or suppressed sound

    uint8_t Right_Availibility;
                        //    0 = not available
                        //    1 = available
    uint8_t HeadwayValid;
                        //    0 = not available
                        //    1 = available
    float HeadwayMeasurement;//unit:s
    uint8_t Pedal_Confusion_Indication;
                        //    0 = none (default)
                        //    1 = Vehicle
                        //    2 = Reserved
                        //    3 = Reserved
    uint8_t Left_Availibility;
                        //    0 = not available
                        //    1 = available
    uint8_t LeftLDW;
                        //    0 = No left LDW
                        //    1 = Left LDW
    uint8_t RightLDW;
                        //    0 = No Right LDW
                        //    1 = Right LDW
    uint8_t FCW_WRN_1;
                        //    0 = No warning
                        //    1 = FCW warning
    uint8_t Maintenance;
                        //    0 = no internal error
                        //    1 = internal error
    uint8_t Slow_Target_Vehicle;
                        //    0 = target vehicle isn't slow
                        //    1 = target vehicle is slow
    uint8_t Failsafe;
                        //    0 = no internal FailSafe mode
                        //    1 = internal FailSafe mode
    uint8_t Ped_WRN_2;
                        //    0 = No warning
                        //    1 = PCW warning
    uint8_t Ped_WRN_1;
                        //    0 = No warning
                        //    1 = PCW warning
    uint8_t High_Beam_Recommendation;
                        //    0 = low beam
                        //    1 = high beam
    uint8_t FCW_WRN_2;
                        //    0 = No warning
                        //    1 = FCW warning
    uint8_t Vehicle_Ahead_Alerts;
                        //    0 = no CIPV is present
                        //    1 = CIPV detected (Green)
                        //    2 = Headway Alert (Orange)
                        //    3 = Imminent Alert (Red)
    uint8_t Ped_WRN_3;
                        //    0 = No warning
                        //    1 = PCW warning
};

struct FCW_INFORMATION
{
    uint32_t can_frame_recv_time;
    uint8_t FCW_A;
                //    0 = FCW off
                //    1 = FCW on
    uint8_t FCW_B;
                //    0 = FCW off
                //    1 = FCW on
    uint8_t FCW_C;
                //    0 = FCW off
                //    1 = FCW on
    uint8_t FCW_D;
                //    0 = FCW off
                //    1 = FCW on
    uint8_t FCW_E;
                //    0 = FCW off
                //    1 = FCW on
    float CAN_VIS_OBS_TTC_WITH_ACC;//unit:s
};

struct PCW_INFORMATION
{
    uint32_t can_frame_recv_time;
    uint8_t PCW_A;
    uint8_t PCW_B;
    uint8_t PCW_C;
    uint8_t PCW_D;
    uint8_t PCW_E;
    float CAN_VIS_OBS_TTC_WITHOUT_ACC;
};

// Autonomous Emergency Braking
struct ME_CMS3
{
    FCW_INFORMATION FCW_information;
    PCW_INFORMATION PCW_information;
};

// Adaptive Cruise Control
struct ACC_INFO
{
    uint32_t can_frame_recv_time;
    uint8_t FCW_on;
                //    0 = No FCW warning
                //    1 = There is an FCW warning
    uint8_t LeftCloseRangeCutIn;
                //    0 = no left cut in
                //    1 = left cut in
    uint8_t RightCloseRangeCutIn;
                //    0 = no right cut in
                //    1 = right cut in
    uint8_t lost_CIPV;
                //    0 = no loss
                //    1 = lost out of  FOV
                //    2 = lost in FOV
    uint8_t ObjectFusionState;
                //    0 = not initialized
                //    1 =  vision
                //    2 =  fused
                //    3 =  radar
    float ObstaclePosX;//unit:m
    float ObstacleRelVelX;//unit:m/sec
    float ObstaclePosY;//unit:m
    uint8_t BlinkerInfo;
                //    0 = unavailable
                //    1 = off
                //    2 = left
                //    3 = right
                //    4 = both
    uint8_t Move_in_and_Out;
                //    0 = undefined
                //    1 = in host lane
                //    2 = out host lane
                //    3 = cut in
                //    4 = cut out
    uint8_t ObstacleType;
                //    0 = vehicle
                //    1 = truck
                //    2 = bike
                //    3 = pedestrian
                //    4 = Bicycle
    float Object_Accel_X;//unit:m/s^2
    uint8_t CIPV_FreeSpace;
                //    0 = Penetration detected
                //    1 = No penetration detected
                //    2 = No statement possible
    uint8_t CIPVBrakeLights;
                //    0 = brake lights are off
                //    1 = brake lights are on

};

struct ACC_INFO_B
{
    uint32_t can_frame_recv_time;
    float ObstacleVelX;//unit:m/sec
    float ObstacleRelVelY;//unit:m/sec
    uint8_t MotionType;
                    //    0 = Undefined
                    //    1 = Standing
                    //    2 = Stopped (movable)
                    //    3 = Moving
                    //    4 = Oncoming
                    //    5 = Parked (never moved)
    float ObstacleWidth;//unit:m
    uint8_t protocol_version;//5
};

struct ACC_INFO_C
{
    uint32_t can_frame_recv_time;
    float Obstacle_Angle;//unit:deg
    float Obstacle_Angle_Rate;//unit:deg/sec
    uint32_t Global_Frame_Index;

};

struct CCI_MEASUREMENTS_A
{
    uint32_t can_frame_recv_time;
    float VCL_cutting_frontZ;//unit:m
    float VCL_cutting_frontX;//unit:m
    float VCL_cutting_backZ;//unit:m
    float VCL_cutting_backX;//unit:m
    float VCL_cutting_longitudinal_speed;//unit:m/s
    uint8_t VCL_cutting_hasCut;
    float VCL_cutting_lateral_speed;
};

struct CCI_MEASUREMENTS_B
{
    uint32_t can_frame_recv_time;
    float VCL_cutting_ttc;//unit:s
    uint8_t hasCutLaneMark;
};

// MobilEye 识别的 Adaptive Cruise Control 信息
struct ME_ACC3
{
    ACC_INFO ACCInfo;
    ACC_INFO_B ACCInfo_B;
    ACC_INFO_C ACCInfo_C;
    CCI_MEASUREMENTS_A left_CCI_measurements_A;
    CCI_MEASUREMENTS_B left_CCI_measurements_B;
    CCI_MEASUREMENTS_A right_CCI_measurements_A;
    CCI_MEASUREMENTS_B right_CCI_measurements_B;
};

// 障碍物状态信息
struct OBSTACLE_STATUS_A
{
    uint32_t can_frame_recv_time;
    uint8_t NumObstacles;
    uint8_t Timestamp;
    uint8_t ProtocolVersion;//7
    uint8_t Go;
            //    0 = Stop
            //    1 = Go!
            //    2 = Undecided
            //    3 = Driver decision is required
            //    4 = currently unused
            //    5 = currently unused
            //    6 = currently unused
            //    7 = currently unused
            //    8 = currently unused
            //    9 = currently unused
            //    10 = currently unused
            //    11 = currently unused
            //    12 = currently unused
            //    13 = currently unused
            //    14 = currently unused
            //    15 = Not Calculated
   uint8_t Close_Car;
            //   0 = No close car
            //   1 = Close car exists
   uint8_t RightCloseRangeCutIn;
            //   0 = no right cut in
            //   1 = right cut in
   uint8_t LeftCloseRangeCutIn;
            //   0 = no left cut in
            //   1 = left cut in
   uint16_t Failsafe;
            //   0 = No Failsafe
            //   1 = Impaired VD
            //   2 = Low Sun
            //   4 = Blur Image
            //   8 = Smear Image
            //   32 = Full Blockage
            //   64 = Splashes
            //   16 = Partial Transparent Blockage
            //   128 = Out of Calibration (Autofix)
            //   256 = Calibration Misalignment
            //   512 = Smeared spots
            //   1024 = Spot Halos/ Frozen windshield
            //   2048 = Foggy Spots
            //   4096 = Sun Ray
   uint8_t ID_MCP;

};

// 障碍物状态信息
struct OBSTACLE_STATUS_B
{
    uint32_t can_frame_recv_time;
    uint32_t timeStamp;
    uint32_t frameIndex;
};

// 障碍物状态信息
struct OBSTACLE_STATUS_C
{
    uint32_t can_frame_recv_time;
    uint16_t grabIndex;
    float pedalConfGenObjDistFromBumper;//unit:m
    float pedalConfusionGeneralObjTTC;//unit:sec

};

// 障碍物信息
struct OBSTACLE_DATA_A
{
    uint32_t can_frame_recv_time;
    uint8_t ObstacleID;
    float ObstaclePosX;//unit:m
    float ObstaclePosY;//unit:m
    uint8_t BlinkerInfo;
                    //    0 = unavailable
                    //    1 = off
                    //    2 = left
                    //    3 = right
                    //    4 = both
    uint8_t Move_in_and_Out;
                    //    0 = undefined
                    //    1 = in_host_lane
                    //    2 = out_host_lane
                    //    3 = cut_in
                    //    4 = cut_out
    float ObstacleVelX;//unit:m/s
    uint8_t ObstacleType;
                    //    0 = vehicle
                    //    1 = truck
                    //    2 = bike
                    //    3 = pedestrian
                    //    4 = Bicycle
                    //    5 = General Object
                    //    7 = carOrTruck
    uint8_t ObstacleStatus;
                    //    0 = not defined
                    //    1 = standing neverMoved bckLightsOn
                    //    2 = stopped (movable)
                    //    3 = moving
                    //    4 = Oncoming
                    //    5 = Parked never moved, BckLightsOff
                    //    6 = Unused
    uint8_t ObstacleBrakeLights;
                    //    0 = object's brake lights are off
                    //    1 = object's brake lights are on
    uint8_t ObstacleValid;
                    //    1 = new valid (detected this frame)
                    //    2 = older valid
};

// 障碍物信息
struct OBSTACLE_DATA_B
{
    uint32_t can_frame_recv_time;
    float ObstacleLength;//unit:m
    float ObstacleWidth;//unit:m
    uint8_t ObstacleAge;
    uint8_t ObstacleLane;
                        //    0 = not assigned
                        //    1 = ego lane
                        //    2 = next lane (left or right)
                        //    3 = next next lane (left or right)
    uint8_t CIPVFlag;
                        //    0 = not CIPV
                        //    1 = CIPV
    float RadarPosX;//unit:m
    float RadarVelX;//unit:m/s
    uint8_t RadarMatchConfidence;
                        //    0 = no match
                        //    1 = multi match.
                        //    2 = radar match with bounded error
                        //    3 = radar match with bounded error
                        //    4 = radar match with bounded error
                        //    5 = high confidence match
    uint8_t MatchedRadarID;

};

// 障碍物信息
struct OBSTACLE_DATA_C
{
    uint32_t can_frame_recv_time;
    float ObstacleAngleRate;//unit:degree
    float ObstacleVelY;//unit:m/s
    float Object_Accel_X;//unit:m/s square
    uint8_t ObstacleReplaced;
                        //    0 = not replaced in this frame
                        //    1 = replaced in this frame
    float ObstacleAngle;//unit:degree
};

// MobilEye 识别的障碍物信息
struct ME_OBS3
{
    OBSTACLE_STATUS_A ObstacleStatusA;
    OBSTACLE_STATUS_B ObstacleStatusB;
    OBSTACLE_STATUS_C ObstacleStatusC;

    OBSTACLE_DATA_A ObstacleDataA[10];
    OBSTACLE_DATA_B ObstacleDataB[10];
    OBSTACLE_DATA_C ObstacleDataC[10];
};

// 车道线信息
struct LKA_LANE_C
{
    uint32_t can_frame_recv_time;
    uint8_t SF_Confidence_1_isValid;
    float SF_Confidence_1;
    uint8_t SF_Confidence_2_isValid;
    float SF_Confidence_2;
    uint8_t SF_Confidence_3_isValid;
    float SF_Confidence_3;
    uint8_t SF_Confidence_4_isValid;
    float SF_Confidence_4;
    float SF_Confidence_1_Segment_End;
    float SF_Confidence_2_Segment_End;
    float SF_Confidence_3_Segment_End;
    float SF_Confidence_4_Segment_End;

};

struct LANE_ASSIGNMENT_0M
{
    uint32_t can_frame_recv_time;
    float Lane_Assignment_1_0m_Confidence;
    uint8_t Lane_Assignment_1_0m_Type;
    float Lane_Assignment_2_0m_Confidence;
    uint8_t Lane_Assignment_2_0m_Type;
    float Lane_Assignment_3_0m_Confidence;
    uint8_t Lane_Assignment_3_0m_Type;
    float Lane_Assignment_4_0m_Confidence;
    uint8_t Lane_Assignment_4_0m_Type;
    float Lane_Assignment_5_0m_Confidence;
    uint8_t Lane_Assignment_5_0m_Type;
    float Lane_Assignment_6_0m_Confidence;
    uint8_t Lane_Assignment_6_0m_Type;
    float Lane_Assignment_7_0m_Confidence;
    uint8_t Lane_Assignment_7_0m_Type;
    float Lane_Assignment_8_0m_Confidence;
    uint8_t Lane_Assignment_8_0m_Type;

};

struct LANE_ASSIGNMENT_35M
{
    uint32_t can_frame_recv_time;
    float Lane_Assignment_1_35m_Confidence;
    uint8_t Lane_Assignment_1_35m_Type;
    float Lane_Assignment_2_35m_Confidence;
    uint8_t Lane_Assignment_2_35m_Type;
    float Lane_Assignment_3_35m_Confidence;
    uint8_t Lane_Assignment_3_35m_Type;
    float Lane_Assignment_4_35m_Confidence;
    uint8_t Lane_Assignment_4_35m_Type;
    float Lane_Assignment_5_35m_Confidence;
    uint8_t Lane_Assignment_5_35m_Type;
    float Lane_Assignment_6_35m_Confidence;
    uint8_t Lane_Assignment_6_35m_Type;
    float Lane_Assignment_7_35m_Confidence;
    uint8_t Lane_Assignment_7_35m_Type;
    float Lane_Assignment_8_35m_Confidence;
    uint8_t Lane_Assignment_8_35m_Type;
};

// 车道线信息
struct LKA_LANE_A
{
    uint32_t can_frame_recv_time;
    uint8_t Lane_Type;
                    //    0 = Undecided
                    //    1 = Solid
                    //    2 = Road Edge
                    //    3 = Dashed
                    //    4 = Double Lane
                    //    5 = Bott's Dots
                    //    6 = Barrier
                    //    15 = Invalid
    uint8_t Quality;
                    //    0 = Low quality
                    //    1 = Low quality
                    //    2 = High quality
                    //    3 = High quality
    float Lane_Model_C0;
    float Lane_Model_C2;
    float Lane_Model_C3;
    float Width_marking;
    float SF_confidence;
};

// 车道线信息
struct LKA_LANE_B
{
    uint32_t can_frame_recv_time;
    float Lane_Model_C1;
    float View_Range_Start;
    float View_Range_End;
    uint8_t Lane_Crossing;
    uint8_t Lane_mark_color;
                        //    0 = white
                        //    1 = yellow
                        //    2 = blue
                        //    3 = invalid
    uint8_t PRED_DIST_BASED_EXTRAPOLATION;
    uint8_t PRED_OTHER_SIDE;
    uint8_t PRED_OVERRIDE;
    uint8_t PRED_OCCLUDED_LM_EXTRAPOLATION;
    uint8_t PRED_HEADWAY_ORIENTED;
    uint8_t PRED_SOURCE_DIVERGING_LANES;
    uint8_t PRED_SOURCE_GUARDRAIL_SHADOW;
    uint8_t PRED_SOURCE_HWE_SPAIN;
    uint8_t PRED_SOURCE_STD;
    uint8_t PRED_SOURCE_VRTL_MERGE;
    float TLC;
};

struct ROAD_INFORMATION
{
    uint32_t can_frame_recv_time;
    uint8_t Construction_Area;
                        //    0 = CA not detected
                        //    1 = Detected Right
                        //    2 = Detected Left
                        //    3 = Detected Both
    uint8_t Road_Type;
                        //    0 = Unknown
                        //    1 = Highway
                        //    2 = Urban
    uint8_t Highway_Exit_Right;
    uint8_t Highway_Exit_Left;
    uint8_t Lane_Assignment_Host_Index_0m;
    uint8_t Lane_Assignment_Host_Index_35m;
    uint8_t NumOfLanes_0m;
    uint8_t NumOfLanes_35m;
    uint8_t SnowDecision;
    float SnowPrediction;
    uint8_t Right_is_JPN_HWE;
    uint8_t Left_is_JPN_HWE;
    float Left_decelLaneBoundaryWidth;
    uint8_t TLM_decelerationArea;
    float Right_decelLaneBoundaryWidth;
    uint8_t protocol_version;//10
};

// MobilEye 识别的车道线信息
struct ME_LANES3
{
    LKA_LANE_C LKA_Left_Lane_C;
    LKA_LANE_C LKA_Right_Lane_C;

    LANE_ASSIGNMENT_0M Lane_Assignment_0m;
    LANE_ASSIGNMENT_35M Lane_Assignment_35m;

    LKA_LANE_A LKA_Left_Lane_A;
    LKA_LANE_A LKA_Right_Lane_A;

    LKA_LANE_B LKA_Left_Lane_B;
    LKA_LANE_B LKA_Right_Lane_B;

    ROAD_INFORMATION Road_Information;

    LKA_LANE_A Next_Left_Lane_A;
    LKA_LANE_A Next_Right_Lane_A;

    LKA_LANE_B Next_Left_Lane_B;
    LKA_LANE_B Next_Right_Lane_B;
};

struct FS_HEADER
{
    uint32_t can_frame_recv_time;
    uint8_t protocol_version;//2
};

struct FS_POINT
{
    float FS_lateral;
    float FS_longitudinal;
};

struct FS_POINTS_MESSAGE
{
    uint32_t can_frame_recv_time;
    FS_POINT FS_Point[3];
};

struct FS_TYPES_MESSAGE
{
    uint32_t can_frame_recv_time;
    uint8_t FS_Type_Point[21];
};

struct ME_FREE_SPACE_RWC3
{
    FS_POINTS_MESSAGE FS_Points_message[22];
    FS_TYPES_MESSAGE FS_Types_message[4];
    FS_HEADER FS_Header;
};

struct HPP_HEADER
{
    uint32_t can_frame_recv_time;
    uint8_t protocol_version;//5
    uint16_t Image_grabIndex;
    uint16_t Image_timeStamp;
};

struct PP_MODEL
{
    uint32_t can_frame_recv_time;
    float HPP_Model_C0;
    float HPP_Model_C1;
    float HPP_Model_C2;
    float HPP_Model_C3;
    float PP_error;
};

struct ROAD_HPP_FUSION_MSG_A
{
    uint32_t can_frame_recv_time;
    float Fusion_Model_C0;
    float Fusion_Model_C1;
    float Fusion_Model_C2;
    float Fusion_Model_C3;
};

struct ROAD_HPP_FUSION_MSG_B
{
    uint32_t can_frame_recv_time;
    float Fusion_Lateral_Control_Point;
    float Fusion_Long_Control_Point;
    float Fusion_Confidence;
    uint8_t Fusion_isPrediction;
    float Fusion_Lane_Width_Estimation;
};

struct PP_MODEL_B
{
    uint32_t can_frame_recv_time;
    float HPP_Z_close;
    float HPP_Z_far;
};

// Holistic Path Prediction
struct ME_HPP3
{
    HPP_HEADER HPP_Header;
    PP_MODEL PP_Model;
    ROAD_HPP_FUSION_MSG_A Road_HPP_Fusion_Msg_A;
    ROAD_HPP_FUSION_MSG_B Road_HPP_Fusion_Msg_B;
    PP_MODEL_B PP_Model_B;
};

// Adaptive Cruise Control 信息
struct ACC_INFO_STRUCT
{
    uint32_t can_frame_recv_time;

    uint8_t ObstacleType;
                //    0 = vehicle
                //    1 = truck
                //    2 = bike
                //    3 = pedestrian
                //    4 = Bicycle
    uint8_t MotionType;
                    //    0 = Undefined
                    //    1 = Standing
                    //    2 = Stopped (movable)
                    //    3 = Moving
                    //    4 = Oncoming
                    //    5 = Parked (never moved)

    uint8_t FCW_on;
                //    0 = No FCW warning
                //    1 = There is an FCW warning
    uint8_t LeftCloseRangeCutIn;
                //    0 = no left cut in
                //    1 = left cut in
    uint8_t RightCloseRangeCutIn;
                //    0 = no right cut in
                //    1 = right cut in
    uint8_t lost_CIPV;
                //    0 = no loss
                //    1 = lost out of  FOV
                //    2 = lost in FOV
    uint8_t ObjectFusionState;
                //    0 = not initialized
                //    1 =  vision
                //    2 =  fused
                //    3 =  radar

    uint8_t BlinkerInfo;
                //    0 = unavailable
                //    1 = off
                //    2 = left
                //    3 = right
                //    4 = both
    uint8_t Move_in_and_Out;
                //    0 = undefined
                //    1 = in host lane
                //    2 = out host lane
                //    3 = cut in
                //    4 = cut out

    uint8_t CIPV_FreeSpace;
                //    0 = Penetration detected
                //    1 = No penetration detected
                //    2 = No statement possible
    uint8_t CIPVBrakeLights;
                //    0 = brake lights are off
                //    1 = brake lights are on

    float ObstaclePosX;//unit:m
    float ObstaclePosY;//unit:m
    float ObstacleVelX;//unit:m/sec
    float ObstacleRelVelX;//unit:m/sec
    float ObstacleRelVelY;//unit:m/sec
    float Object_Accel_X;//unit:m/s^2
    float Obstacle_Angle;//unit:deg
    float Obstacle_Angle_Rate;//unit:deg/sec
    float ObstacleWidth;//unit:m

    uint8_t protocol_version;//5
    uint32_t Global_Frame_Index;
};

struct CCI_INFO_STRUCT
{
    uint32_t can_frame_recv_time;

    uint8_t hasCutLaneMark;
    uint8_t VCL_cutting_hasCut;
    float VCL_cutting_frontZ;//unit:m
    float VCL_cutting_frontX;//unit:m
    float VCL_cutting_backZ;//unit:m
    float VCL_cutting_backX;//unit:m
    float VCL_cutting_longitudinal_speed;//unit:m/s
    float VCL_cutting_lateral_speed;//unit:m/s
    float VCL_cutting_ttc;//unit:s
};

#endif // EQ4_STRUCTURES_H
