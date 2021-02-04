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

class Rect {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.left = null;
      this.top = null;
      this.right = null;
      this.bottom = null;
    }
    else {
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = 0.0;
      }
      if (initObj.hasOwnProperty('top')) {
        this.top = initObj.top
      }
      else {
        this.top = 0.0;
      }
      if (initObj.hasOwnProperty('right')) {
        this.right = initObj.right
      }
      else {
        this.right = 0.0;
      }
      if (initObj.hasOwnProperty('bottom')) {
        this.bottom = initObj.bottom
      }
      else {
        this.bottom = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Rect
    // Serialize message field [left]
    bufferOffset = _serializer.float32(obj.left, buffer, bufferOffset);
    // Serialize message field [top]
    bufferOffset = _serializer.float32(obj.top, buffer, bufferOffset);
    // Serialize message field [right]
    bufferOffset = _serializer.float32(obj.right, buffer, bufferOffset);
    // Serialize message field [bottom]
    bufferOffset = _serializer.float32(obj.bottom, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Rect
    let len;
    let data = new Rect(null);
    // Deserialize message field [left]
    data.left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [top]
    data.top = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right]
    data.right = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bottom]
    data.bottom = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/Rect';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7aad971742c7cc38deb20cfb704affa1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 left
    float32 top
    float32 right
    float32 bottom
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Rect(null);
    if (msg.left !== undefined) {
      resolved.left = msg.left;
    }
    else {
      resolved.left = 0.0
    }

    if (msg.top !== undefined) {
      resolved.top = msg.top;
    }
    else {
      resolved.top = 0.0
    }

    if (msg.right !== undefined) {
      resolved.right = msg.right;
    }
    else {
      resolved.right = 0.0
    }

    if (msg.bottom !== undefined) {
      resolved.bottom = msg.bottom;
    }
    else {
      resolved.bottom = 0.0
    }

    return resolved;
    }
};

module.exports = Rect;
