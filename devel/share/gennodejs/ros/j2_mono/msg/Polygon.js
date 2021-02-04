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

class Polygon {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pts = null;
    }
    else {
      if (initObj.hasOwnProperty('pts')) {
        this.pts = initObj.pts
      }
      else {
        this.pts = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Polygon
    // Serialize message field [pts]
    // Serialize the length for message field [pts]
    bufferOffset = _serializer.uint32(obj.pts.length, buffer, bufferOffset);
    obj.pts.forEach((val) => {
      bufferOffset = Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Polygon
    let len;
    let data = new Polygon(null);
    // Deserialize message field [pts]
    // Deserialize array length for message field [pts]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pts = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pts[i] = Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 12 * object.pts.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/Polygon';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c9d7e166d449653c48720f55c89cbced';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Point[] pts
    
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
    const resolved = new Polygon(null);
    if (msg.pts !== undefined) {
      resolved.pts = new Array(msg.pts.length);
      for (let i = 0; i < resolved.pts.length; ++i) {
        resolved.pts[i] = Point.Resolve(msg.pts[i]);
      }
    }
    else {
      resolved.pts = []
    }

    return resolved;
    }
};

module.exports = Polygon;
