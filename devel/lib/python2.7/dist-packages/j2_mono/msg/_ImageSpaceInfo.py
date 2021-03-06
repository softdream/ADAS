# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from j2_mono/ImageSpaceInfo.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import j2_mono.msg

class ImageSpaceInfo(genpy.Message):
  _md5sum = "1fb215e492dbe974ebabb86f0056d4f6"
  _type = "j2_mono/ImageSpaceInfo"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """Rect rect
Box3D box
Polygon poly
float32 sigma_width
float32 sigma_height
float32 sigma_x
float32 sigma_y

================================================================================
MSG: j2_mono/Rect
float32 left
float32 top
float32 right
float32 bottom

================================================================================
MSG: j2_mono/Box3D
Point lower_lt
Point lower_lb
Point lower_rb
Point lower_rt
Point upper_lt
Point upper_lb
Point upper_rb
Point upper_rt
float32 conf

================================================================================
MSG: j2_mono/Point
float32 x
float32 y
float32 z

================================================================================
MSG: j2_mono/Polygon
Point[] pts
"""
  __slots__ = ['rect','box','poly','sigma_width','sigma_height','sigma_x','sigma_y']
  _slot_types = ['j2_mono/Rect','j2_mono/Box3D','j2_mono/Polygon','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       rect,box,poly,sigma_width,sigma_height,sigma_x,sigma_y

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ImageSpaceInfo, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.rect is None:
        self.rect = j2_mono.msg.Rect()
      if self.box is None:
        self.box = j2_mono.msg.Box3D()
      if self.poly is None:
        self.poly = j2_mono.msg.Polygon()
      if self.sigma_width is None:
        self.sigma_width = 0.
      if self.sigma_height is None:
        self.sigma_height = 0.
      if self.sigma_x is None:
        self.sigma_x = 0.
      if self.sigma_y is None:
        self.sigma_y = 0.
    else:
      self.rect = j2_mono.msg.Rect()
      self.box = j2_mono.msg.Box3D()
      self.poly = j2_mono.msg.Polygon()
      self.sigma_width = 0.
      self.sigma_height = 0.
      self.sigma_x = 0.
      self.sigma_y = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_29f().pack(_x.rect.left, _x.rect.top, _x.rect.right, _x.rect.bottom, _x.box.lower_lt.x, _x.box.lower_lt.y, _x.box.lower_lt.z, _x.box.lower_lb.x, _x.box.lower_lb.y, _x.box.lower_lb.z, _x.box.lower_rb.x, _x.box.lower_rb.y, _x.box.lower_rb.z, _x.box.lower_rt.x, _x.box.lower_rt.y, _x.box.lower_rt.z, _x.box.upper_lt.x, _x.box.upper_lt.y, _x.box.upper_lt.z, _x.box.upper_lb.x, _x.box.upper_lb.y, _x.box.upper_lb.z, _x.box.upper_rb.x, _x.box.upper_rb.y, _x.box.upper_rb.z, _x.box.upper_rt.x, _x.box.upper_rt.y, _x.box.upper_rt.z, _x.box.conf))
      length = len(self.poly.pts)
      buff.write(_struct_I.pack(length))
      for val1 in self.poly.pts:
        _x = val1
        buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
      _x = self
      buff.write(_get_struct_4f().pack(_x.sigma_width, _x.sigma_height, _x.sigma_x, _x.sigma_y))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.rect is None:
        self.rect = j2_mono.msg.Rect()
      if self.box is None:
        self.box = j2_mono.msg.Box3D()
      if self.poly is None:
        self.poly = j2_mono.msg.Polygon()
      end = 0
      _x = self
      start = end
      end += 116
      (_x.rect.left, _x.rect.top, _x.rect.right, _x.rect.bottom, _x.box.lower_lt.x, _x.box.lower_lt.y, _x.box.lower_lt.z, _x.box.lower_lb.x, _x.box.lower_lb.y, _x.box.lower_lb.z, _x.box.lower_rb.x, _x.box.lower_rb.y, _x.box.lower_rb.z, _x.box.lower_rt.x, _x.box.lower_rt.y, _x.box.lower_rt.z, _x.box.upper_lt.x, _x.box.upper_lt.y, _x.box.upper_lt.z, _x.box.upper_lb.x, _x.box.upper_lb.y, _x.box.upper_lb.z, _x.box.upper_rb.x, _x.box.upper_rb.y, _x.box.upper_rb.z, _x.box.upper_rt.x, _x.box.upper_rt.y, _x.box.upper_rt.z, _x.box.conf,) = _get_struct_29f().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.poly.pts = []
      for i in range(0, length):
        val1 = j2_mono.msg.Point()
        _x = val1
        start = end
        end += 12
        (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
        self.poly.pts.append(val1)
      _x = self
      start = end
      end += 16
      (_x.sigma_width, _x.sigma_height, _x.sigma_x, _x.sigma_y,) = _get_struct_4f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_29f().pack(_x.rect.left, _x.rect.top, _x.rect.right, _x.rect.bottom, _x.box.lower_lt.x, _x.box.lower_lt.y, _x.box.lower_lt.z, _x.box.lower_lb.x, _x.box.lower_lb.y, _x.box.lower_lb.z, _x.box.lower_rb.x, _x.box.lower_rb.y, _x.box.lower_rb.z, _x.box.lower_rt.x, _x.box.lower_rt.y, _x.box.lower_rt.z, _x.box.upper_lt.x, _x.box.upper_lt.y, _x.box.upper_lt.z, _x.box.upper_lb.x, _x.box.upper_lb.y, _x.box.upper_lb.z, _x.box.upper_rb.x, _x.box.upper_rb.y, _x.box.upper_rb.z, _x.box.upper_rt.x, _x.box.upper_rt.y, _x.box.upper_rt.z, _x.box.conf))
      length = len(self.poly.pts)
      buff.write(_struct_I.pack(length))
      for val1 in self.poly.pts:
        _x = val1
        buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
      _x = self
      buff.write(_get_struct_4f().pack(_x.sigma_width, _x.sigma_height, _x.sigma_x, _x.sigma_y))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.rect is None:
        self.rect = j2_mono.msg.Rect()
      if self.box is None:
        self.box = j2_mono.msg.Box3D()
      if self.poly is None:
        self.poly = j2_mono.msg.Polygon()
      end = 0
      _x = self
      start = end
      end += 116
      (_x.rect.left, _x.rect.top, _x.rect.right, _x.rect.bottom, _x.box.lower_lt.x, _x.box.lower_lt.y, _x.box.lower_lt.z, _x.box.lower_lb.x, _x.box.lower_lb.y, _x.box.lower_lb.z, _x.box.lower_rb.x, _x.box.lower_rb.y, _x.box.lower_rb.z, _x.box.lower_rt.x, _x.box.lower_rt.y, _x.box.lower_rt.z, _x.box.upper_lt.x, _x.box.upper_lt.y, _x.box.upper_lt.z, _x.box.upper_lb.x, _x.box.upper_lb.y, _x.box.upper_lb.z, _x.box.upper_rb.x, _x.box.upper_rb.y, _x.box.upper_rb.z, _x.box.upper_rt.x, _x.box.upper_rt.y, _x.box.upper_rt.z, _x.box.conf,) = _get_struct_29f().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.poly.pts = []
      for i in range(0, length):
        val1 = j2_mono.msg.Point()
        _x = val1
        start = end
        end += 12
        (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
        self.poly.pts.append(val1)
      _x = self
      start = end
      end += 16
      (_x.sigma_width, _x.sigma_height, _x.sigma_x, _x.sigma_y,) = _get_struct_4f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_29f = None
def _get_struct_29f():
    global _struct_29f
    if _struct_29f is None:
        _struct_29f = struct.Struct("<29f")
    return _struct_29f
_struct_3f = None
def _get_struct_3f():
    global _struct_3f
    if _struct_3f is None:
        _struct_3f = struct.Struct("<3f")
    return _struct_3f
_struct_4f = None
def _get_struct_4f():
    global _struct_4f
    if _struct_4f is None:
        _struct_4f = struct.Struct("<4f")
    return _struct_4f
