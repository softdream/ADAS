# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from j2_mono/FreeSpacePoints.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import j2_mono.msg

class FreeSpacePoints(genpy.Message):
  _md5sum = "6fb2b5ce0fd42050cf9b73089f67f90e"
  _type = "j2_mono/FreeSpacePoints"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int32[] property
int32 cam_id
Point[] pts_vcs
Point[] pts_img

================================================================================
MSG: j2_mono/Point
float32 x
float32 y
float32 z
"""
  __slots__ = ['property','cam_id','pts_vcs','pts_img']
  _slot_types = ['int32[]','int32','j2_mono/Point[]','j2_mono/Point[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       property,cam_id,pts_vcs,pts_img

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(FreeSpacePoints, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.property is None:
        self.property = []
      if self.cam_id is None:
        self.cam_id = 0
      if self.pts_vcs is None:
        self.pts_vcs = []
      if self.pts_img is None:
        self.pts_img = []
    else:
      self.property = []
      self.cam_id = 0
      self.pts_vcs = []
      self.pts_img = []

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
      length = len(self.property)
      buff.write(_struct_I.pack(length))
      pattern = '<%si'%length
      buff.write(struct.Struct(pattern).pack(*self.property))
      _x = self.cam_id
      buff.write(_get_struct_i().pack(_x))
      length = len(self.pts_vcs)
      buff.write(_struct_I.pack(length))
      for val1 in self.pts_vcs:
        _x = val1
        buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
      length = len(self.pts_img)
      buff.write(_struct_I.pack(length))
      for val1 in self.pts_img:
        _x = val1
        buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.pts_vcs is None:
        self.pts_vcs = None
      if self.pts_img is None:
        self.pts_img = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%si'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.property = s.unpack(str[start:end])
      start = end
      end += 4
      (self.cam_id,) = _get_struct_i().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.pts_vcs = []
      for i in range(0, length):
        val1 = j2_mono.msg.Point()
        _x = val1
        start = end
        end += 12
        (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
        self.pts_vcs.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.pts_img = []
      for i in range(0, length):
        val1 = j2_mono.msg.Point()
        _x = val1
        start = end
        end += 12
        (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
        self.pts_img.append(val1)
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
      length = len(self.property)
      buff.write(_struct_I.pack(length))
      pattern = '<%si'%length
      buff.write(self.property.tostring())
      _x = self.cam_id
      buff.write(_get_struct_i().pack(_x))
      length = len(self.pts_vcs)
      buff.write(_struct_I.pack(length))
      for val1 in self.pts_vcs:
        _x = val1
        buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
      length = len(self.pts_img)
      buff.write(_struct_I.pack(length))
      for val1 in self.pts_img:
        _x = val1
        buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
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
      if self.pts_vcs is None:
        self.pts_vcs = None
      if self.pts_img is None:
        self.pts_img = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%si'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.property = numpy.frombuffer(str[start:end], dtype=numpy.int32, count=length)
      start = end
      end += 4
      (self.cam_id,) = _get_struct_i().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.pts_vcs = []
      for i in range(0, length):
        val1 = j2_mono.msg.Point()
        _x = val1
        start = end
        end += 12
        (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
        self.pts_vcs.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.pts_img = []
      for i in range(0, length):
        val1 = j2_mono.msg.Point()
        _x = val1
        start = end
        end += 12
        (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
        self.pts_img.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3f = None
def _get_struct_3f():
    global _struct_3f
    if _struct_3f is None:
        _struct_3f = struct.Struct("<3f")
    return _struct_3f
_struct_i = None
def _get_struct_i():
    global _struct_i
    if _struct_i is None:
        _struct_i = struct.Struct("<i")
    return _struct_i