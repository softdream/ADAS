// Generated by gencpp from file j2_mono/odometryFrame.msg
// DO NOT EDIT!


#ifndef J2_MONO_MESSAGE_ODOMETRYFRAME_H
#define J2_MONO_MESSAGE_ODOMETRYFRAME_H


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
struct odometryFrame_
{
  typedef odometryFrame_<ContainerAllocator> Type;

  odometryFrame_()
    : x(0.0)
    , y(0.0)
    , yaw(0.0)
    , speed(0.0)
    , yaw_rate(0.0)
    , time_stamp(0)  {
    }
  odometryFrame_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , yaw(0.0)
    , speed(0.0)
    , yaw_rate(0.0)
    , time_stamp(0)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _yaw_type;
  _yaw_type yaw;

   typedef float _speed_type;
  _speed_type speed;

   typedef float _yaw_rate_type;
  _yaw_rate_type yaw_rate;

   typedef int32_t _time_stamp_type;
  _time_stamp_type time_stamp;





  typedef boost::shared_ptr< ::j2_mono::odometryFrame_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::j2_mono::odometryFrame_<ContainerAllocator> const> ConstPtr;

}; // struct odometryFrame_

typedef ::j2_mono::odometryFrame_<std::allocator<void> > odometryFrame;

typedef boost::shared_ptr< ::j2_mono::odometryFrame > odometryFramePtr;
typedef boost::shared_ptr< ::j2_mono::odometryFrame const> odometryFrameConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::j2_mono::odometryFrame_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::j2_mono::odometryFrame_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::j2_mono::odometryFrame_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::j2_mono::odometryFrame_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::j2_mono::odometryFrame_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::j2_mono::odometryFrame_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::j2_mono::odometryFrame_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::j2_mono::odometryFrame_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::j2_mono::odometryFrame_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5a95cc00626a88f4bbae5ae097e0829f";
  }

  static const char* value(const ::j2_mono::odometryFrame_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5a95cc00626a88f4ULL;
  static const uint64_t static_value2 = 0xbbae5ae097e0829fULL;
};

template<class ContainerAllocator>
struct DataType< ::j2_mono::odometryFrame_<ContainerAllocator> >
{
  static const char* value()
  {
    return "j2_mono/odometryFrame";
  }

  static const char* value(const ::j2_mono::odometryFrame_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::j2_mono::odometryFrame_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 x\n\
float32 y\n\
float32 yaw\n\
float32 speed\n\
float32 yaw_rate\n\
int32 time_stamp\n\
";
  }

  static const char* value(const ::j2_mono::odometryFrame_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::j2_mono::odometryFrame_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.yaw);
      stream.next(m.speed);
      stream.next(m.yaw_rate);
      stream.next(m.time_stamp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct odometryFrame_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::j2_mono::odometryFrame_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::j2_mono::odometryFrame_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "yaw: ";
    Printer<float>::stream(s, indent + "  ", v.yaw);
    s << indent << "speed: ";
    Printer<float>::stream(s, indent + "  ", v.speed);
    s << indent << "yaw_rate: ";
    Printer<float>::stream(s, indent + "  ", v.yaw_rate);
    s << indent << "time_stamp: ";
    Printer<int32_t>::stream(s, indent + "  ", v.time_stamp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // J2_MONO_MESSAGE_ODOMETRYFRAME_H
