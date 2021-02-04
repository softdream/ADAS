// Auto-generated. Do not edit!

// (in-package j2_mono.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Polygon = require('./Polygon.js');

//-----------------------------------------------------------

class ImageFail {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cam_id = null;
      this.frame_id = null;
      this.fail_type = null;
      this.level = null;
      this.regions = null;
    }
    else {
      if (initObj.hasOwnProperty('cam_id')) {
        this.cam_id = initObj.cam_id
      }
      else {
        this.cam_id = 0;
      }
      if (initObj.hasOwnProperty('frame_id')) {
        this.frame_id = initObj.frame_id
      }
      else {
        this.frame_id = 0;
      }
      if (initObj.hasOwnProperty('fail_type')) {
        this.fail_type = initObj.fail_type
      }
      else {
        this.fail_type = 0;
      }
      if (initObj.hasOwnProperty('level')) {
        this.level = initObj.level
      }
      else {
        this.level = 0;
      }
      if (initObj.hasOwnProperty('regions')) {
        this.regions = initObj.regions
      }
      else {
        this.regions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImageFail
    // Serialize message field [cam_id]
    bufferOffset = _serializer.int32(obj.cam_id, buffer, bufferOffset);
    // Serialize message field [frame_id]
    bufferOffset = _serializer.int32(obj.frame_id, buffer, bufferOffset);
    // Serialize message field [fail_type]
    bufferOffset = _serializer.int32(obj.fail_type, buffer, bufferOffset);
    // Serialize message field [level]
    bufferOffset = _serializer.int32(obj.level, buffer, bufferOffset);
    // Serialize message field [regions]
    // Serialize the length for message field [regions]
    bufferOffset = _serializer.uint32(obj.regions.length, buffer, bufferOffset);
    obj.regions.forEach((val) => {
      bufferOffset = Polygon.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImageFail
    let len;
    let data = new ImageFail(null);
    // Deserialize message field [cam_id]
    data.cam_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [frame_id]
    data.frame_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [fail_type]
    data.fail_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [level]
    data.level = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [regions]
    // Deserialize array length for message field [regions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.regions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.regions[i] = Polygon.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.regions.forEach((val) => {
      length += Polygon.getMessageSize(val);
    });
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/ImageFail';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b75b6afa1e707dc499267f7da2b60b6c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 cam_id
    int32 frame_id
    int32 fail_type #IMG_NORMAL=0, IMG_BLUR=1, IMG_SHELTER=2, IMG_FREEZE=4, IMG_GLARE=8
    int32 level #FAIL_NONE=0, FAIL_MILD=1, FAIL_MODERATE=2, FAIL_SEVERE=3
    Polygon[] regions
    
    ================================================================================
    MSG: j2_mono/Polygon
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
    const resolved = new ImageFail(null);
    if (msg.cam_id !== undefined) {
      resolved.cam_id = msg.cam_id;
    }
    else {
      resolved.cam_id = 0
    }

    if (msg.frame_id !== undefined) {
      resolved.frame_id = msg.frame_id;
    }
    else {
      resolved.frame_id = 0
    }

    if (msg.fail_type !== undefined) {
      resolved.fail_type = msg.fail_type;
    }
    else {
      resolved.fail_type = 0
    }

    if (msg.level !== undefined) {
      resolved.level = msg.level;
    }
    else {
      resolved.level = 0
    }

    if (msg.regions !== undefined) {
      resolved.regions = new Array(msg.regions.length);
      for (let i = 0; i < resolved.regions.length; ++i) {
        resolved.regions[i] = Polygon.Resolve(msg.regions[i]);
      }
    }
    else {
      resolved.regions = []
    }

    return resolved;
    }
};

module.exports = ImageFail;
