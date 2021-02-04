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

class Line {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.life_time = null;
      this.coeffs = null;
      this.end_points = null;
      this.type = null;
      this.source = null;
      this.dist_to_front_wheel = null;
      this.width = null;
      this.type_sibling = null;
      this.conf = null;
      this.sigma_coeffs = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('life_time')) {
        this.life_time = initObj.life_time
      }
      else {
        this.life_time = 0;
      }
      if (initObj.hasOwnProperty('coeffs')) {
        this.coeffs = initObj.coeffs
      }
      else {
        this.coeffs = [];
      }
      if (initObj.hasOwnProperty('end_points')) {
        this.end_points = initObj.end_points
      }
      else {
        this.end_points = [];
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('source')) {
        this.source = initObj.source
      }
      else {
        this.source = 0;
      }
      if (initObj.hasOwnProperty('dist_to_front_wheel')) {
        this.dist_to_front_wheel = initObj.dist_to_front_wheel
      }
      else {
        this.dist_to_front_wheel = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('type_sibling')) {
        this.type_sibling = initObj.type_sibling
      }
      else {
        this.type_sibling = 0;
      }
      if (initObj.hasOwnProperty('conf')) {
        this.conf = initObj.conf
      }
      else {
        this.conf = 0.0;
      }
      if (initObj.hasOwnProperty('sigma_coeffs')) {
        this.sigma_coeffs = initObj.sigma_coeffs
      }
      else {
        this.sigma_coeffs = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Line
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [life_time]
    bufferOffset = _serializer.int32(obj.life_time, buffer, bufferOffset);
    // Serialize message field [coeffs]
    bufferOffset = _arraySerializer.float32(obj.coeffs, buffer, bufferOffset, null);
    // Serialize message field [end_points]
    // Serialize the length for message field [end_points]
    bufferOffset = _serializer.uint32(obj.end_points.length, buffer, bufferOffset);
    obj.end_points.forEach((val) => {
      bufferOffset = Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [source]
    bufferOffset = _serializer.int32(obj.source, buffer, bufferOffset);
    // Serialize message field [dist_to_front_wheel]
    bufferOffset = _serializer.float32(obj.dist_to_front_wheel, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [type_sibling]
    bufferOffset = _serializer.int32(obj.type_sibling, buffer, bufferOffset);
    // Serialize message field [conf]
    bufferOffset = _serializer.float32(obj.conf, buffer, bufferOffset);
    // Serialize message field [sigma_coeffs]
    bufferOffset = _arraySerializer.float32(obj.sigma_coeffs, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Line
    let len;
    let data = new Line(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [life_time]
    data.life_time = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [coeffs]
    data.coeffs = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [end_points]
    // Deserialize array length for message field [end_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.end_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.end_points[i] = Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [source]
    data.source = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dist_to_front_wheel]
    data.dist_to_front_wheel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [type_sibling]
    data.type_sibling = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [conf]
    data.conf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sigma_coeffs]
    data.sigma_coeffs = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.coeffs.length;
    length += 12 * object.end_points.length;
    length += 4 * object.sigma_coeffs.length;
    return length + 44;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/Line';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5f428496e74b1f87cdeb56e87ec4d4bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Line(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.life_time !== undefined) {
      resolved.life_time = msg.life_time;
    }
    else {
      resolved.life_time = 0
    }

    if (msg.coeffs !== undefined) {
      resolved.coeffs = msg.coeffs;
    }
    else {
      resolved.coeffs = []
    }

    if (msg.end_points !== undefined) {
      resolved.end_points = new Array(msg.end_points.length);
      for (let i = 0; i < resolved.end_points.length; ++i) {
        resolved.end_points[i] = Point.Resolve(msg.end_points[i]);
      }
    }
    else {
      resolved.end_points = []
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.source !== undefined) {
      resolved.source = msg.source;
    }
    else {
      resolved.source = 0
    }

    if (msg.dist_to_front_wheel !== undefined) {
      resolved.dist_to_front_wheel = msg.dist_to_front_wheel;
    }
    else {
      resolved.dist_to_front_wheel = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.type_sibling !== undefined) {
      resolved.type_sibling = msg.type_sibling;
    }
    else {
      resolved.type_sibling = 0
    }

    if (msg.conf !== undefined) {
      resolved.conf = msg.conf;
    }
    else {
      resolved.conf = 0.0
    }

    if (msg.sigma_coeffs !== undefined) {
      resolved.sigma_coeffs = msg.sigma_coeffs;
    }
    else {
      resolved.sigma_coeffs = []
    }

    return resolved;
    }
};

module.exports = Line;
