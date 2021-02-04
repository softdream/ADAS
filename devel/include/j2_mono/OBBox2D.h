// Generated by gencpp from file j2_mono/OBBox2D.msg
// DO NOT EDIT!


#ifndef J2_MONO_MESSAGE_OBBOX2D_H
#define J2_MONO_MESSAGE_OBBOX2D_H


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
struct OBBox2D_
{
  typedef OBBox2D_<ContainerAllocator> Type;

  OBBox2D_()
    : corner()
    , axes_pts()
    , size(0.0)  {
    }
  OBBox2D_(const ContainerAllocator& _alloc)
    : corner(_alloc)
    , axes_pts(_alloc)
    , size(0.0)  {
  (void)_alloc;
    }



   typedef  ::j2_mono::Point_<ContainerAllocator>  _corner_type;
  _corner_type corner;

   typedef  ::j2_mono::Point_<ContainerAllocator>  _axes_pts_type;
  _axes_pts_type axes_pts;

   typedef float _size_type;
  _size_type size;





  typedef boost::shared_ptr< ::j2_mono::OBBox2D_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::j2_mono::OBBox2D_<ContainerAllocator> const> ConstPtr;

}; // struct OBBox2D_

typedef ::j2_mono::OBBox2D_<std::allocator<void> > OBBox2D;

typedef boost::shared_ptr< ::j2_mono::OBBox2D > OBBox2DPtr;
typedef boost::shared_ptr< ::j2_mono::OBBox2D const> OBBox2DConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::j2_mono::OBBox2D_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::j2_mono::OBBox2D_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::j2_mono::OBBox2D_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::j2_mono::OBBox2D_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::j2_mono::OBBox2D_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::j2_mono::OBBox2D_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::j2_mono::OBBox2D_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::j2_mono::OBBox2D_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::j2_mono::OBBox2D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "20845fd799692f5fd377b5118d47def7";
  }

  static const char* value(const ::j2_mono::OBBox2D_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x20845fd799692f5fULL;
  static const uint64_t static_value2 = 0xd377b5118d47def7ULL;
};

template<class ContainerAllocator>
struct DataType< ::j2_mono::OBBox2D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "j2_mono/OBBox2D";
  }

  static const char* value(const ::j2_mono::OBBox2D_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::j2_mono::OBBox2D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Point corner\n\
Point axes_pts\n\
float32 size\n\
\n\
================================================================================\n\
MSG: j2_mono/Point\n\
float32 x\n\
float32 y\n\
float32 z\n\
";
  }

  static const char* value(const ::j2_mono::OBBox2D_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::j2_mono::OBBox2D_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.corner);
      stream.next(m.axes_pts);
      stream.next(m.size);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct OBBox2D_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::j2_mono::OBBox2D_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::j2_mono::OBBox2D_<ContainerAllocator>& v)
  {
    s << indent << "corner: ";
    s << std::endl;
    Printer< ::j2_mono::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.corner);
    s << indent << "axes_pts: ";
    s << std::endl;
    Printer< ::j2_mono::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.axes_pts);
    s << indent << "size: ";
    Printer<float>::stream(s, indent + "  ", v.size);
  }
};

} // namespace message_operations
} // namespace ros

#endif // J2_MONO_MESSAGE_OBBOX2D_H