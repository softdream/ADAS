// Generated by gencpp from file j2_mono/canFrame.msg
// DO NOT EDIT!


#ifndef J2_MONO_MESSAGE_CANFRAME_H
#define J2_MONO_MESSAGE_CANFRAME_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace j2_mono
{
template <class ContainerAllocator>
struct canFrame_
{
  typedef canFrame_<ContainerAllocator> Type;

  canFrame_()
    : vehSpeed(0)
    , vehSpeed_time_stamp(0)
    , wheelAngle(0)
    , wheelAngle_time_stamp(0)
    , gearType(0)
    , gearType_time_stamp(0)
    , turnSignal(0)
    , turnSignal_time_stamp(0)
    , acc(0.0)
    , yaw(0.0)
    , yaw_rate(0.0)
    , imu_time_stamp(0)  {
    }
  canFrame_(const ContainerAllocator& _alloc)
    : vehSpeed(0)
    , vehSpeed_time_stamp(0)
    , wheelAngle(0)
    , wheelAngle_time_stamp(0)
    , gearType(0)
    , gearType_time_stamp(0)
    , turnSignal(0)
    , turnSignal_time_stamp(0)
    , acc(0.0)
    , yaw(0.0)
    , yaw_rate(0.0)
    , imu_time_stamp(0)  {
  (void)_alloc;
    }



   typedef int64_t _vehSpeed_type;
  _vehSpeed_type vehSpeed;

   typedef int64_t _vehSpeed_time_stamp_type;
  _vehSpeed_time_stamp_type vehSpeed_time_stamp;

   typedef int64_t _wheelAngle_type;
  _wheelAngle_type wheelAngle;

   typedef int64_t _wheelAngle_time_stamp_type;
  _wheelAngle_time_stamp_type wheelAngle_time_stamp;

   typedef int64_t _gearType_type;
  _gearType_type gearType;

   typedef int64_t _gearType_time_stamp_type;
  _gearType_time_stamp_type gearType_time_stamp;

   typedef int64_t _turnSignal_type;
  _turnSignal_type turnSignal;

   typedef int64_t _turnSignal_time_stamp_type;
  _turnSignal_time_stamp_type turnSignal_time_stamp;

   typedef float _acc_type;
  _acc_type acc;

   typedef float _yaw_type;
  _yaw_type yaw;

   typedef float _yaw_rate_type;
  _yaw_rate_type yaw_rate;

   typedef int64_t _imu_time_stamp_type;
  _imu_time_stamp_type imu_time_stamp;





  typedef boost::shared_ptr< ::j2_mono::canFrame_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::j2_mono::canFrame_<ContainerAllocator> const> ConstPtr;

}; // struct canFrame_

typedef ::j2_mono::canFrame_<std::allocator<void> > canFrame;

typedef boost::shared_ptr< ::j2_mono::canFrame > canFramePtr;
typedef boost::shared_ptr< ::j2_mono::canFrame const> canFrameConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::j2_mono::canFrame_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::j2_mono::canFrame_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace j2_mono

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'j2_mono': ['/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::j2_mono::canFrame_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::j2_mono::canFrame_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::j2_mono::canFrame_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::j2_mono::canFrame_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::j2_mono::canFrame_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::j2_mono::canFrame_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::j2_mono::canFrame_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2ba765f4fa3356008013509c4cc271e6";
  }

  static const char* value(const ::j2_mono::canFrame_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2ba765f4fa335600ULL;
  static const uint64_t static_value2 = 0x8013509c4cc271e6ULL;
};

template<class ContainerAllocator>
struct DataType< ::j2_mono::canFrame_<ContainerAllocator> >
{
  static const char* value()
  {
    return "j2_mono/canFrame";
  }

  static const char* value(const ::j2_mono::canFrame_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::j2_mono::canFrame_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 vehSpeed # km/h \n\
int64 vehSpeed_time_stamp\n\
int64 wheelAngle # rad\n\
int64 wheelAngle_time_stamp\n\
int64 gearType  # GEAR_TYPE_N = 0, GEAR_TYPE_P = 1, GEAR_TYPE_R = 2, GEAR_TYPE_D = 3\n\
int64 gearType_time_stamp\n\
int64 turnSignal # TURN_SIGNAL_NONE = 0, TURN_SIGNAL_LEFT = 1, TURN_SIGNAL_RIGHT = 2, TURN_SIGNAL_DOUBLE = 3\n\
int64 turnSignal_time_stamp\n\
float32 acc # m/s^2\n\
float32 yaw\n\
float32 yaw_rate # rad/s\n\
int64 imu_time_stamp\n\
";
  }

  static const char* value(const ::j2_mono::canFrame_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::j2_mono::canFrame_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.vehSpeed);
      stream.next(m.vehSpeed_time_stamp);
      stream.next(m.wheelAngle);
      stream.next(m.wheelAngle_time_stamp);
      stream.next(m.gearType);
      stream.next(m.gearType_time_stamp);
      stream.next(m.turnSignal);
      stream.next(m.turnSignal_time_stamp);
      stream.next(m.acc);
      stream.next(m.yaw);
      stream.next(m.yaw_rate);
      stream.next(m.imu_time_stamp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct canFrame_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::j2_mono::canFrame_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::j2_mono::canFrame_<ContainerAllocator>& v)
  {
    s << indent << "vehSpeed: ";
    Printer<int64_t>::stream(s, indent + "  ", v.vehSpeed);
    s << indent << "vehSpeed_time_stamp: ";
    Printer<int64_t>::stream(s, indent + "  ", v.vehSpeed_time_stamp);
    s << indent << "wheelAngle: ";
    Printer<int64_t>::stream(s, indent + "  ", v.wheelAngle);
    s << indent << "wheelAngle_time_stamp: ";
    Printer<int64_t>::stream(s, indent + "  ", v.wheelAngle_time_stamp);
    s << indent << "gearType: ";
    Printer<int64_t>::stream(s, indent + "  ", v.gearType);
    s << indent << "gearType_time_stamp: ";
    Printer<int64_t>::stream(s, indent + "  ", v.gearType_time_stamp);
    s << indent << "turnSignal: ";
    Printer<int64_t>::stream(s, indent + "  ", v.turnSignal);
    s << indent << "turnSignal_time_stamp: ";
    Printer<int64_t>::stream(s, indent + "  ", v.turnSignal_time_stamp);
    s << indent << "acc: ";
    Printer<float>::stream(s, indent + "  ", v.acc);
    s << indent << "yaw: ";
    Printer<float>::stream(s, indent + "  ", v.yaw);
    s << indent << "yaw_rate: ";
    Printer<float>::stream(s, indent + "  ", v.yaw_rate);
    s << indent << "imu_time_stamp: ";
    Printer<int64_t>::stream(s, indent + "  ", v.imu_time_stamp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // J2_MONO_MESSAGE_CANFRAME_H
