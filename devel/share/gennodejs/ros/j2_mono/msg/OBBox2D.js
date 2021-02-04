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

class OBBox2D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.corner = null;
      this.axes_pts = null;
      this.size = null;
    }
    else {
      if (initObj.hasOwnProperty('corner')) {
        this.corner = initObj.corner
      }
      else {
        this.corner = new Point();
      }
      if (initObj.hasOwnProperty('axes_pts')) {
        this.axes_pts = initObj.axes_pts
      }
      else {
        this.axes_pts = new Point();
      }
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OBBox2D
    // Serialize message field [corner]
    bufferOffset = Point.serialize(obj.corner, buffer, bufferOffset);
    // Serialize message field [axes_pts]
    bufferOffset = Point.serialize(obj.axes_pts, buffer, bufferOffset);
    // Serialize message field [size]
    bufferOffset = _serializer.float32(obj.size, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OBBox2D
    let len;
    let data = new OBBox2D(null);
    // Deserialize message field [corner]
    data.corner = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [axes_pts]
    data.axes_pts = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [size]
    data.size = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/OBBox2D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '20845fd799692f5fd377b5118d47def7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Point corner
    Point axes_pts
    float32 size
    
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
    const resolved = new OBBox2D(null);
    if (msg.corner !== undefined) {
      resolved.corner = Point.Resolve(msg.corner)
    }
    else {
      resolved.corner = new Point()
    }

    if (msg.axes_pts !== undefined) {
      resolved.axes_pts = Point.Resolve(msg.axes_pts)
    }
    else {
      resolved.axes_pts = new Point()
    }

    if (msg.size !== undefined) {
      resolved.size = msg.size;
    }
    else {
      resolved.size = 0.0
    }

    return resolved;
    }
};

module.exports = OBBox2D;
