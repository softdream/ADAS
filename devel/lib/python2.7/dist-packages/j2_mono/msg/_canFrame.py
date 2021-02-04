# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from j2_mono/canFrame.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class canFrame(genpy.Message):
  _md5sum = "2ba765f4fa3356008013509c4cc271e6"
  _type = "j2_mono/canFrame"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int64 vehSpeed # km/h 
int64 vehSpeed_time_stamp
int64 wheelAngle # rad
int64 wheelAngle_time_stamp
int64 gearType  # GEAR_TYPE_N = 0, GEAR_TYPE_P = 1, GEAR_TYPE_R = 2, GEAR_TYPE_D = 3
int64 gearType_time_stamp
int64 turnSignal # TURN_SIGNAL_NONE = 0, TURN_SIGNAL_LEFT = 1, TURN_SIGNAL_RIGHT = 2, TURN_SIGNAL_DOUBLE = 3
int64 turnSignal_time_stamp
float32 acc # m/s^2
float32 yaw
float32 yaw_rate # rad/s
int64 imu_time_stamp
"""
  __slots__ = ['vehSpeed','vehSpeed_time_stamp','wheelAngle','wheelAngle_time_stamp','gearType','gearType_time_stamp','turnSignal','turnSignal_time_stamp','acc','yaw','yaw_rate','imu_time_stamp']
  _slot_types = ['int64','int64','int64','int64','int64','int64','int64','int64','float32','float32','float32','int64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       vehSpeed,vehSpeed_time_stamp,wheelAngle,wheelAngle_time_stamp,gearType,gearType_time_stamp,turnSignal,turnSignal_time_stamp,acc,yaw,yaw_rate,imu_time_stamp

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(canFrame, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.vehSpeed is None:
        self.vehSpeed = 0
      if self.vehSpeed_time_stamp is None:
        self.vehSpeed_time_stamp = 0
      if self.wheelAngle is None:
        self.wheelAngle = 0
      if self.wheelAngle_time_stamp is None:
        self.wheelAngle_time_stamp = 0
      if self.gearType is None:
        self.gearType = 0
      if self.gearType_time_stamp is None:
        self.gearType_time_stamp = 0
      if self.turnSignal is None:
        self.turnSignal = 0
      if self.turnSignal_time_stamp is None:
        self.turnSignal_time_stamp = 0
      if self.acc is None:
        self.acc = 0.
      if self.yaw is None:
        self.yaw = 0.
      if self.yaw_rate is None:
        self.yaw_rate = 0.
      if self.imu_time_stamp is None:
        self.imu_time_stamp = 0
    else:
      self.vehSpeed = 0
      self.vehSpeed_time_stamp = 0
      self.wheelAngle = 0
      self.wheelAngle_time_stamp = 0
      self.gearType = 0
      self.gearType_time_stamp = 0
      self.turnSignal = 0
      self.turnSignal_time_stamp = 0
      self.acc = 0.
      self.yaw = 0.
      self.yaw_rate = 0.
      self.imu_time_stamp = 0

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
      buff.write(_get_struct_8q3fq().pack(_x.vehSpeed, _x.vehSpeed_time_stamp, _x.wheelAngle, _x.wheelAngle_time_stamp, _x.gearType, _x.gearType_time_stamp, _x.turnSignal, _x.turnSignal_time_stamp, _x.acc, _x.yaw, _x.yaw_rate, _x.imu_time_stamp))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 84
      (_x.vehSpeed, _x.vehSpeed_time_stamp, _x.wheelAngle, _x.wheelAngle_time_stamp, _x.gearType, _x.gearType_time_stamp, _x.turnSignal, _x.turnSignal_time_stamp, _x.acc, _x.yaw, _x.yaw_rate, _x.imu_time_stamp,) = _get_struct_8q3fq().unpack(str[start:end])
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
      buff.write(_get_struct_8q3fq().pack(_x.vehSpeed, _x.vehSpeed_time_stamp, _x.wheelAngle, _x.wheelAngle_time_stamp, _x.gearType, _x.gearType_time_stamp, _x.turnSignal, _x.turnSignal_time_stamp, _x.acc, _x.yaw, _x.yaw_rate, _x.imu_time_stamp))
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
      end = 0
      _x = self
      start = end
      end += 84
      (_x.vehSpeed, _x.vehSpeed_time_stamp, _x.wheelAngle, _x.wheelAngle_time_stamp, _x.gearType, _x.gearType_time_stamp, _x.turnSignal, _x.turnSignal_time_stamp, _x.acc, _x.yaw, _x.yaw_rate, _x.imu_time_stamp,) = _get_struct_8q3fq().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_8q3fq = None
def _get_struct_8q3fq():
    global _struct_8q3fq
    if _struct_8q3fq is None:
        _struct_8q3fq = struct.Struct("<8q3fq")
    return _struct_8q3fq