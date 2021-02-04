# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from j2_mono/Lines.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import j2_mono.msg

class Lines(genpy.Message):
  _md5sum = "81f65aa561ab98e1b11e8498fb81cb8c"
  _type = "j2_mono/Lines"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """uint32 cam_id
Line[] lines

================================================================================
MSG: j2_mono/Line
int32 id
int32 life_time
float32[] coeffs
Point[] end_points
int32 type #LINE_DOUBLE=512, LINE_DASH=1024, LINE_SOLID=2048
int32 source #LINE_PERCEPTION=2097152, LINE_TRACKING=4194304
float32 dist_to_front_wheel
float32 width
int32 type_sibling
float32 conf
float32[] sigma_coeffs


================================================================================
MSG: j2_mono/Point
float32 x
float32 y
float32 z
"""
  __slots__ = ['cam_id','lines']
  _slot_types = ['uint32','j2_mono/Line[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       cam_id,lines

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Lines, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.cam_id is None:
        self.cam_id = 0
      if self.lines is None:
        self.lines = []
    else:
      self.cam_id = 0
      self.lines = []

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
      _x = self.cam_id
      buff.write(_get_struct_I().pack(_x))
      length = len(self.lines)
      buff.write(_struct_I.pack(length))
      for val1 in self.lines:
        _x = val1
        buff.write(_get_struct_2i().pack(_x.id, _x.life_time))
        length = len(val1.coeffs)
        buff.write(_struct_I.pack(length))
        pattern = '<%sf'%length
        buff.write(struct.Struct(pattern).pack(*val1.coeffs))
        length = len(val1.end_points)
        buff.write(_struct_I.pack(length))
        for val2 in val1.end_points:
          _x = val2
          buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
        _x = val1
        buff.write(_get_struct_2i2fif().pack(_x.type, _x.source, _x.dist_to_front_wheel, _x.width, _x.type_sibling, _x.conf))
        length = len(val1.sigma_coeffs)
        buff.write(_struct_I.pack(length))
        pattern = '<%sf'%length
        buff.write(struct.Struct(pattern).pack(*val1.sigma_coeffs))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.lines is None:
        self.lines = None
      end = 0
      start = end
      end += 4
      (self.cam_id,) = _get_struct_I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.lines = []
      for i in range(0, length):
        val1 = j2_mono.msg.Line()
        _x = val1
        start = end
        end += 8
        (_x.id, _x.life_time,) = _get_struct_2i().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sf'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.coeffs = s.unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.end_points = []
        for i in range(0, length):
          val2 = j2_mono.msg.Point()
          _x = val2
          start = end
          end += 12
          (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
          val1.end_points.append(val2)
        _x = val1
        start = end
        end += 24
        (_x.type, _x.source, _x.dist_to_front_wheel, _x.width, _x.type_sibling, _x.conf,) = _get_struct_2i2fif().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sf'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.sigma_coeffs = s.unpack(str[start:end])
        self.lines.append(val1)
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
      _x = self.cam_id
      buff.write(_get_struct_I().pack(_x))
      length = len(self.lines)
      buff.write(_struct_I.pack(length))
      for val1 in self.lines:
        _x = val1
        buff.write(_get_struct_2i().pack(_x.id, _x.life_time))
        length = len(val1.coeffs)
        buff.write(_struct_I.pack(length))
        pattern = '<%sf'%length
        buff.write(val1.coeffs.tostring())
        length = len(val1.end_points)
        buff.write(_struct_I.pack(length))
        for val2 in val1.end_points:
          _x = val2
          buff.write(_get_struct_3f().pack(_x.x, _x.y, _x.z))
        _x = val1
        buff.write(_get_struct_2i2fif().pack(_x.type, _x.source, _x.dist_to_front_wheel, _x.width, _x.type_sibling, _x.conf))
        length = len(val1.sigma_coeffs)
        buff.write(_struct_I.pack(length))
        pattern = '<%sf'%length
        buff.write(val1.sigma_coeffs.tostring())
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
      if self.lines is None:
        self.lines = None
      end = 0
      start = end
      end += 4
      (self.cam_id,) = _get_struct_I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.lines = []
      for i in range(0, length):
        val1 = j2_mono.msg.Line()
        _x = val1
        start = end
        end += 8
        (_x.id, _x.life_time,) = _get_struct_2i().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sf'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.coeffs = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.end_points = []
        for i in range(0, length):
          val2 = j2_mono.msg.Point()
          _x = val2
          start = end
          end += 12
          (_x.x, _x.y, _x.z,) = _get_struct_3f().unpack(str[start:end])
          val1.end_points.append(val2)
        _x = val1
        start = end
        end += 24
        (_x.type, _x.source, _x.dist_to_front_wheel, _x.width, _x.type_sibling, _x.conf,) = _get_struct_2i2fif().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sf'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.sigma_coeffs = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
        self.lines.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2i = None
def _get_struct_2i():
    global _struct_2i
    if _struct_2i is None:
        _struct_2i = struct.Struct("<2i")
    return _struct_2i
_struct_2i2fif = None
def _get_struct_2i2fif():
    global _struct_2i2fif
    if _struct_2i2fif is None:
        _struct_2i2fif = struct.Struct("<2i2fif")
    return _struct_2i2fif
_struct_3f = None
def _get_struct_3f():
    global _struct_3f
    if _struct_3f is None:
        _struct_3f = struct.Struct("<3f")
    return _struct_3f