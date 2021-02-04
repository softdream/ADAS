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

class FreeSpacePoints {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.property = null;
      this.cam_id = null;
      this.pts_vcs = null;
      this.pts_img = null;
    }
    else {
      if (initObj.hasOwnProperty('property')) {
        this.property = initObj.property
      }
      else {
        this.property = [];
      }
      if (initObj.hasOwnProperty('cam_id')) {
        this.cam_id = initObj.cam_id
      }
      else {
        this.cam_id = 0;
      }
      if (initObj.hasOwnProperty('pts_vcs')) {
        this.pts_vcs = initObj.pts_vcs
      }
      else {
        this.pts_vcs = [];
      }
      if (initObj.hasOwnProperty('pts_img')) {
        this.pts_img = initObj.pts_img
      }
      else {
        this.pts_img = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FreeSpacePoints
    // Serialize message field [property]
    bufferOffset = _arraySerializer.int32(obj.property, buffer, bufferOffset, null);
    // Serialize message field [cam_id]
    bufferOffset = _serializer.int32(obj.cam_id, buffer, bufferOffset);
    // Serialize message field [pts_vcs]
    // Serialize the length for message field [pts_vcs]
    bufferOffset = _serializer.uint32(obj.pts_vcs.length, buffer, bufferOffset);
    obj.pts_vcs.forEach((val) => {
      bufferOffset = Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [pts_img]
    // Serialize the length for message field [pts_img]
    bufferOffset = _serializer.uint32(obj.pts_img.length, buffer, bufferOffset);
    obj.pts_img.forEach((val) => {
      bufferOffset = Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FreeSpacePoints
    let len;
    let data = new FreeSpacePoints(null);
    // Deserialize message field [property]
    data.property = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [cam_id]
    data.cam_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pts_vcs]
    // Deserialize array length for message field [pts_vcs]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pts_vcs = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pts_vcs[i] = Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [pts_img]
    // Deserialize array length for message field [pts_img]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pts_img = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pts_img[i] = Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.property.length;
    length += 12 * object.pts_vcs.length;
    length += 12 * object.pts_img.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/FreeSpacePoints';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6fb2b5ce0fd42050cf9b73089f67f90e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] property
    int32 cam_id
    Point[] pts_vcs
    Point[] pts_img
    
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
    const resolved = new FreeSpacePoints(null);
    if (msg.property !== undefined) {
      resolved.property = msg.property;
    }
    else {
      resolved.property = []
    }

    if (msg.cam_id !== undefined) {
      resolved.cam_id = msg.cam_id;
    }
    else {
      resolved.cam_id = 0
    }

    if (msg.pts_vcs !== undefined) {
      resolved.pts_vcs = new Array(msg.pts_vcs.length);
      for (let i = 0; i < resolved.pts_vcs.length; ++i) {
        resolved.pts_vcs[i] = Point.Resolve(msg.pts_vcs[i]);
      }
    }
    else {
      resolved.pts_vcs = []
    }

    if (msg.pts_img !== undefined) {
      resolved.pts_img = new Array(msg.pts_img.length);
      for (let i = 0; i < resolved.pts_img.length; ++i) {
        resolved.pts_img[i] = Point.Resolve(msg.pts_img[i]);
      }
    }
    else {
      resolved.pts_img = []
    }

    return resolved;
    }
};

module.exports = FreeSpacePoints;
