// Auto-generated. Do not edit!

// (in-package j2_mono.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Line = require('./Line.js');

//-----------------------------------------------------------

class Lines {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cam_id = null;
      this.lines = null;
    }
    else {
      if (initObj.hasOwnProperty('cam_id')) {
        this.cam_id = initObj.cam_id
      }
      else {
        this.cam_id = 0;
      }
      if (initObj.hasOwnProperty('lines')) {
        this.lines = initObj.lines
      }
      else {
        this.lines = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Lines
    // Serialize message field [cam_id]
    bufferOffset = _serializer.uint32(obj.cam_id, buffer, bufferOffset);
    // Serialize message field [lines]
    // Serialize the length for message field [lines]
    bufferOffset = _serializer.uint32(obj.lines.length, buffer, bufferOffset);
    obj.lines.forEach((val) => {
      bufferOffset = Line.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Lines
    let len;
    let data = new Lines(null);
    // Deserialize message field [cam_id]
    data.cam_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [lines]
    // Deserialize array length for message field [lines]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.lines = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.lines[i] = Line.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.lines.forEach((val) => {
      length += Line.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/Lines';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '81f65aa561ab98e1b11e8498fb81cb8c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 cam_id
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Lines(null);
    if (msg.cam_id !== undefined) {
      resolved.cam_id = msg.cam_id;
    }
    else {
      resolved.cam_id = 0
    }

    if (msg.lines !== undefined) {
      resolved.lines = new Array(msg.lines.length);
      for (let i = 0; i < resolved.lines.length; ++i) {
        resolved.lines[i] = Line.Resolve(msg.lines[i]);
      }
    }
    else {
      resolved.lines = []
    }

    return resolved;
    }
};

module.exports = Lines;
