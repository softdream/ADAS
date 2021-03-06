// Generated by gencpp from file j2_mono/FreeSpacePoints.msg
// DO NOT EDIT!


#ifndef J2_MONO_MESSAGE_FREESPACEPOINTS_H
#define J2_MONO_MESSAGE_FREESPACEPOINTS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <j2_mono/Point.h>
#include <j2_mono/Point.h>

namespace j2_mono
{
template <class ContainerAllocator>
struct FreeSpacePoints_
{
  typedef FreeSpacePoints_<ContainerAllocator> Type;

  FreeSpacePoints_()
    : property()
    , cam_id(0)
    , pts_vcs()
    , pts_img()  {
    }
  FreeSpacePoints_(const ContainerAllocator& _alloc)
    : property(_alloc)
    , cam_id(0)
    , pts_vcs(_alloc)
    , pts_img(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _property_type;
  _property_type property;

   typedef int32_t _cam_id_type;
  _cam_id_type cam_id;

   typedef std::vector< ::j2_mono::Point_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::j2_mono::Point_<ContainerAllocator> >::other >  _pts_vcs_type;
  _pts_vcs_type pts_vcs;

   typedef std::vector< ::j2_mono::Point_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::j2_mono::Point_<ContainerAllocator> >::other >  _pts_img_type;
  _pts_img_type pts_img;





  typedef boost::shared_ptr< ::j2_mono::FreeSpacePoints_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::j2_mono::FreeSpacePoints_<ContainerAllocator> const> ConstPtr;

}; // struct FreeSpacePoints_

typedef ::j2_mono::FreeSpacePoints_<std::allocator<void> > FreeSpacePoints;

typedef boost::shared_ptr< ::j2_mono::FreeSpacePoints > FreeSpacePointsPtr;
typedef boost::shared_ptr< ::j2_mono::FreeSpacePoints const> FreeSpacePointsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::j2_mono::FreeSpacePoints_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::j2_mono::FreeSpacePoints_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace j2_mono

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'j2_mono': ['/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::j2_mono::FreeSpacePoints_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::j2_mono::FreeSpacePoints_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::j2_mono::FreeSpacePoints_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::j2_mono::FreeSpacePoints_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::j2_mono::FreeSpacePoints_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::j2_mono::FreeSpacePoints_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::j2_mono::FreeSpacePoints_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6fb2b5ce0fd42050cf9b73089f67f90e";
  }

  static const char* value(const ::j2_mono::FreeSpacePoints_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6fb2b5ce0fd42050ULL;
  static const uint64_t static_value2 = 0xcf9b73089f67f90eULL;
};

template<class ContainerAllocator>
struct DataType< ::j2_mono::FreeSpacePoints_<ContainerAllocator> >
{
  static const char* value()
  {
    return "j2_mono/FreeSpacePoints";
  }

  static const char* value(const ::j2_mono::FreeSpacePoints_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::j2_mono::FreeSpacePoints_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32[] property\n\
int32 cam_id\n\
Point[] pts_vcs\n\
Point[] pts_img\n\
\n\
================================================================================\n\
MSG: j2_mono/Point\n\
float32 x\n\
float32 y\n\
float32 z\n\
";
  }

  static const char* value(const ::j2_mono::FreeSpacePoints_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::j2_mono::FreeSpacePoints_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.property);
      stream.next(m.cam_id);
      stream.next(m.pts_vcs);
      stream.next(m.pts_img);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FreeSpacePoints_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::j2_mono::FreeSpacePoints_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::j2_mono::FreeSpacePoints_<ContainerAllocator>& v)
  {
    s << indent << "property[]" << std::endl;
    for (size_t i = 0; i < v.property.size(); ++i)
    {
      s << indent << "  property[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.property[i]);
    }
    s << indent << "cam_id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.cam_id);
    s << indent << "pts_vcs[]" << std::endl;
    for (size_t i = 0; i < v.pts_vcs.size(); ++i)
    {
      s << indent << "  pts_vcs[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::j2_mono::Point_<ContainerAllocator> >::stream(s, indent + "    ", v.pts_vcs[i]);
    }
    s << indent << "pts_img[]" << std::endl;
    for (size_t i = 0; i < v.pts_img.size(); ++i)
    {
      s << indent << "  pts_img[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::j2_mono::Point_<ContainerAllocator> >::stream(s, indent + "    ", v.pts_img[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // J2_MONO_MESSAGE_FREESPACEPOINTS_H
