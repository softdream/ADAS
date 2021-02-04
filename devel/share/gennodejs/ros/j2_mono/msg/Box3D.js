// Auto-generated. Do not edit!

// (in-package j2_mono.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Point = require('./Point.js');

//-----------------------------------------------------------

class Box3D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lower_lt = null;
      this.lower_lb = null;
      this.lower_rb = null;
      this.lower_rt = null;
      this.upper_lt = null;
      this.upper_lb = null;
      this.upper_rb = null;
      this.upper_rt = null;
      this.conf = null;
    }
    else {
      if (initObj.hasOwnProperty('lower_lt')) {
        this.lower_lt = initObj.lower_lt
      }
      else {
        this.lower_lt = new Point();
      }
      if (initObj.hasOwnProperty('lower_lb')) {
        this.lower_lb = initObj.lower_lb
      }
      else {
        this.lower_lb = new Point();
      }
      if (initObj.hasOwnProperty('lower_rb')) {
        this.lower_rb = initObj.lower_rb
      }
      else {
        this.lower_rb = new Point();
      }
      if (initObj.hasOwnProperty('lower_rt')) {
        this.lower_rt = initObj.lower_rt
      }
      else {
        this.lower_rt = new Point();
      }
      if (initObj.hasOwnProperty('upper_lt')) {
        this.upper_lt = initObj.upper_lt
      }
      else {
        this.upper_lt = new Point();
      }
      if (initObj.hasOwnProperty('upper_lb')) {
        this.upper_lb = initObj.upper_lb
      }
      else {
        this.upper_lb = new Point();
      }
      if (initObj.hasOwnProperty('upper_rb')) {
        this.upper_rb = initObj.upper_rb
      }
      else {
        this.upper_rb = new Point();
      }
      if (initObj.hasOwnProperty('upper_rt')) {
        this.upper_rt = initObj.upper_rt
      }
      else {
        this.upper_rt = new Point();
      }
      if (initObj.hasOwnProperty('conf')) {
        this.conf = initObj.conf
      }
      else {
        this.conf = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Box3D
    // Serialize message field [lower_lt]
    bufferOffset = Point.serialize(obj.lower_lt, buffer, bufferOffset);
    // Serialize message field [lower_lb]
    bufferOffset = Point.serialize(obj.lower_lb, buffer, bufferOffset);
    // Serialize message field [lower_rb]
    bufferOffset = Point.serialize(obj.lower_rb, buffer, bufferOffset);
    // Serialize message field [lower_rt]
    bufferOffset = Point.serialize(obj.lower_rt, buffer, bufferOffset);
    // Serialize message field [upper_lt]
    bufferOffset = Point.serialize(obj.upper_lt, buffer, bufferOffset);
    // Serialize message field [upper_lb]
    bufferOffset = Point.serialize(obj.upper_lb, buffer, bufferOffset);
    // Serialize message field [upper_rb]
    bufferOffset = Point.serialize(obj.upper_rb, buffer, bufferOffset);
    // Serialize message field [upper_rt]
    bufferOffset = Point.serialize(obj.upper_rt, buffer, bufferOffset);
    // Serialize message field [conf]
    bufferOffset = _serializer.float32(obj.conf, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Box3D
    let len;
    let data = new Box3D(null);
    // Deserialize message field [lower_lt]
    data.lower_lt = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [lower_lb]
    data.lower_lb = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [lower_rb]
    data.lower_rb = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [lower_rt]
    data.lower_rt = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [upper_lt]
    data.upper_lt = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [upper_lb]
    data.upper_lb = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [upper_rb]
    data.upper_rb = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [upper_rt]
    data.upper_rt = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [conf]
    data.conf = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 100;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/Box3D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd2a4c3bc64f81e95d0c37d470dea3708';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Box3D(null);
    if (msg.lower_lt !== undefined) {
      resolved.lower_lt = Point.Resolve(msg.lower_lt)
    }
    else {
      resolved.lower_lt = new Point()
    }

    if (msg.lower_lb !== undefined) {
      resolved.lower_lb = Point.Resolve(msg.lower_lb)
    }
    else {
      resolved.lower_lb = new Point()
    }

    if (msg.lower_rb !== undefined) {
      resolved.lower_rb = Point.Resolve(msg.lower_rb)
    }
    else {
      resolved.lower_rb = new Point()
    }

    if (msg.lower_rt !== undefined) {
      resolved.lower_rt = Point.Resolve(msg.lower_rt)
    }
    else {
      resolved.lower_rt = new Point()
    }

    if (msg.upper_lt !== undefined) {
      resolved.upper_lt = Point.Resolve(msg.upper_lt)
    }
    else {
      resolved.upper_lt = new Point()
    }

    if (msg.upper_lb !== undefined) {
      resolved.upper_lb = Point.Resolve(msg.upper_lb)
    }
    else {
      resolved.upper_lb = new Point()
    }

    if (msg.upper_rb !== undefined) {
      resolved.upper_rb = Point.Resolve(msg.upper_rb)
    }
    else {
      resolved.upper_rb = new Point()
    }

    if (msg.upper_rt !== undefined) {
      resolved.upper_rt = Point.Resolve(msg.upper_rt)
    }
    else {
      resolved.upper_rt = new Point()
    }

    if (msg.conf !== undefined) {
      resolved.conf = msg.conf;
    }
    else {
      resolved.conf = 0.0
    }

    return resolved;
    }
};

module.exports = Box3D;
