// Auto-generated. Do not edit!

// (in-package j2_mono.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class canFrame {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vehSpeed = null;
      this.vehSpeed_time_stamp = null;
      this.wheelAngle = null;
      this.wheelAngle_time_stamp = null;
      this.gearType = null;
      this.gearType_time_stamp = null;
      this.turnSignal = null;
      this.turnSignal_time_stamp = null;
      this.acc = null;
      this.yaw = null;
      this.yaw_rate = null;
      this.imu_time_stamp = null;
    }
    else {
      if (initObj.hasOwnProperty('vehSpeed')) {
        this.vehSpeed = initObj.vehSpeed
      }
      else {
        this.vehSpeed = 0;
      }
      if (initObj.hasOwnProperty('vehSpeed_time_stamp')) {
        this.vehSpeed_time_stamp = initObj.vehSpeed_time_stamp
      }
      else {
        this.vehSpeed_time_stamp = 0;
      }
      if (initObj.hasOwnProperty('wheelAngle')) {
        this.wheelAngle = initObj.wheelAngle
      }
      else {
        this.wheelAngle = 0;
      }
      if (initObj.hasOwnProperty('wheelAngle_time_stamp')) {
        this.wheelAngle_time_stamp = initObj.wheelAngle_time_stamp
      }
      else {
        this.wheelAngle_time_stamp = 0;
      }
      if (initObj.hasOwnProperty('gearType')) {
        this.gearType = initObj.gearType
      }
      else {
        this.gearType = 0;
      }
      if (initObj.hasOwnProperty('gearType_time_stamp')) {
        this.gearType_time_stamp = initObj.gearType_time_stamp
      }
      else {
        this.gearType_time_stamp = 0;
      }
      if (initObj.hasOwnProperty('turnSignal')) {
        this.turnSignal = initObj.turnSignal
      }
      else {
        this.turnSignal = 0;
      }
      if (initObj.hasOwnProperty('turnSignal_time_stamp')) {
        this.turnSignal_time_stamp = initObj.turnSignal_time_stamp
      }
      else {
        this.turnSignal_time_stamp = 0;
      }
      if (initObj.hasOwnProperty('acc')) {
        this.acc = initObj.acc
      }
      else {
        this.acc = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_rate')) {
        this.yaw_rate = initObj.yaw_rate
      }
      else {
        this.yaw_rate = 0.0;
      }
      if (initObj.hasOwnProperty('imu_time_stamp')) {
        this.imu_time_stamp = initObj.imu_time_stamp
      }
      else {
        this.imu_time_stamp = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type canFrame
    // Serialize message field [vehSpeed]
    bufferOffset = _serializer.int64(obj.vehSpeed, buffer, bufferOffset);
    // Serialize message field [vehSpeed_time_stamp]
    bufferOffset = _serializer.int64(obj.vehSpeed_time_stamp, buffer, bufferOffset);
    // Serialize message field [wheelAngle]
    bufferOffset = _serializer.int64(obj.wheelAngle, buffer, bufferOffset);
    // Serialize message field [wheelAngle_time_stamp]
    bufferOffset = _serializer.int64(obj.wheelAngle_time_stamp, buffer, bufferOffset);
    // Serialize message field [gearType]
    bufferOffset = _serializer.int64(obj.gearType, buffer, bufferOffset);
    // Serialize message field [gearType_time_stamp]
    bufferOffset = _serializer.int64(obj.gearType_time_stamp, buffer, bufferOffset);
    // Serialize message field [turnSignal]
    bufferOffset = _serializer.int64(obj.turnSignal, buffer, bufferOffset);
    // Serialize message field [turnSignal_time_stamp]
    bufferOffset = _serializer.int64(obj.turnSignal_time_stamp, buffer, bufferOffset);
    // Serialize message field [acc]
    bufferOffset = _serializer.float32(obj.acc, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [yaw_rate]
    bufferOffset = _serializer.float32(obj.yaw_rate, buffer, bufferOffset);
    // Serialize message field [imu_time_stamp]
    bufferOffset = _serializer.int64(obj.imu_time_stamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type canFrame
    let len;
    let data = new canFrame(null);
    // Deserialize message field [vehSpeed]
    data.vehSpeed = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [vehSpeed_time_stamp]
    data.vehSpeed_time_stamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [wheelAngle]
    data.wheelAngle = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [wheelAngle_time_stamp]
    data.wheelAngle_time_stamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [gearType]
    data.gearType = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [gearType_time_stamp]
    data.gearType_time_stamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [turnSignal]
    data.turnSignal = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [turnSignal_time_stamp]
    data.turnSignal_time_stamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [acc]
    data.acc = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw_rate]
    data.yaw_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imu_time_stamp]
    data.imu_time_stamp = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 84;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/canFrame';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ba765f4fa3356008013509c4cc271e6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 vehSpeed # km/h 
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new canFrame(null);
    if (msg.vehSpeed !== undefined) {
      resolved.vehSpeed = msg.vehSpeed;
    }
    else {
      resolved.vehSpeed = 0
    }

    if (msg.vehSpeed_time_stamp !== undefined) {
      resolved.vehSpeed_time_stamp = msg.vehSpeed_time_stamp;
    }
    else {
      resolved.vehSpeed_time_stamp = 0
    }

    if (msg.wheelAngle !== undefined) {
      resolved.wheelAngle = msg.wheelAngle;
    }
    else {
      resolved.wheelAngle = 0
    }

    if (msg.wheelAngle_time_stamp !== undefined) {
      resolved.wheelAngle_time_stamp = msg.wheelAngle_time_stamp;
    }
    else {
      resolved.wheelAngle_time_stamp = 0
    }

    if (msg.gearType !== undefined) {
      resolved.gearType = msg.gearType;
    }
    else {
      resolved.gearType = 0
    }

    if (msg.gearType_time_stamp !== undefined) {
      resolved.gearType_time_stamp = msg.gearType_time_stamp;
    }
    else {
      resolved.gearType_time_stamp = 0
    }

    if (msg.turnSignal !== undefined) {
      resolved.turnSignal = msg.turnSignal;
    }
    else {
      resolved.turnSignal = 0
    }

    if (msg.turnSignal_time_stamp !== undefined) {
      resolved.turnSignal_time_stamp = msg.turnSignal_time_stamp;
    }
    else {
      resolved.turnSignal_time_stamp = 0
    }

    if (msg.acc !== undefined) {
      resolved.acc = msg.acc;
    }
    else {
      resolved.acc = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.yaw_rate !== undefined) {
      resolved.yaw_rate = msg.yaw_rate;
    }
    else {
      resolved.yaw_rate = 0.0
    }

    if (msg.imu_time_stamp !== undefined) {
      resolved.imu_time_stamp = msg.imu_time_stamp;
    }
    else {
      resolved.imu_time_stamp = 0
    }

    return resolved;
    }
};

module.exports = canFrame;
