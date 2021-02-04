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

class Image {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.width = null;
      this.height = null;
      this.channel = null;
      this.time_stamp = null;
      this.send_mode = null;
      this.format = null;
      this.index = null;
      this.count = null;
      this.depth = null;
      this.align = null;
      this.image_counter = null;
    }
    else {
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0;
      }
      if (initObj.hasOwnProperty('channel')) {
        this.channel = initObj.channel
      }
      else {
        this.channel = 0;
      }
      if (initObj.hasOwnProperty('time_stamp')) {
        this.time_stamp = initObj.time_stamp
      }
      else {
        this.time_stamp = 0;
      }
      if (initObj.hasOwnProperty('send_mode')) {
        this.send_mode = initObj.send_mode
      }
      else {
        this.send_mode = 0;
      }
      if (initObj.hasOwnProperty('format')) {
        this.format = initObj.format
      }
      else {
        this.format = 0;
      }
      if (initObj.hasOwnProperty('index')) {
        this.index = initObj.index
      }
      else {
        this.index = 0;
      }
      if (initObj.hasOwnProperty('count')) {
        this.count = initObj.count
      }
      else {
        this.count = 0;
      }
      if (initObj.hasOwnProperty('depth')) {
        this.depth = initObj.depth
      }
      else {
        this.depth = 0;
      }
      if (initObj.hasOwnProperty('align')) {
        this.align = initObj.align
      }
      else {
        this.align = 0;
      }
      if (initObj.hasOwnProperty('image_counter')) {
        this.image_counter = initObj.image_counter
      }
      else {
        this.image_counter = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Image
    // Serialize message field [width]
    bufferOffset = _serializer.int32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.int32(obj.height, buffer, bufferOffset);
    // Serialize message field [channel]
    bufferOffset = _serializer.int32(obj.channel, buffer, bufferOffset);
    // Serialize message field [time_stamp]
    bufferOffset = _serializer.int64(obj.time_stamp, buffer, bufferOffset);
    // Serialize message field [send_mode]
    bufferOffset = _serializer.int32(obj.send_mode, buffer, bufferOffset);
    // Serialize message field [format]
    bufferOffset = _serializer.int32(obj.format, buffer, bufferOffset);
    // Serialize message field [index]
    bufferOffset = _serializer.int32(obj.index, buffer, bufferOffset);
    // Serialize message field [count]
    bufferOffset = _serializer.int32(obj.count, buffer, bufferOffset);
    // Serialize message field [depth]
    bufferOffset = _serializer.int32(obj.depth, buffer, bufferOffset);
    // Serialize message field [align]
    bufferOffset = _serializer.int32(obj.align, buffer, bufferOffset);
    // Serialize message field [image_counter]
    bufferOffset = _serializer.int32(obj.image_counter, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Image
    let len;
    let data = new Image(null);
    // Deserialize message field [width]
    data.width = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [channel]
    data.channel = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [time_stamp]
    data.time_stamp = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [send_mode]
    data.send_mode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [format]
    data.format = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [index]
    data.index = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [count]
    data.count = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [depth]
    data.depth = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [align]
    data.align = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [image_counter]
    data.image_counter = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/Image';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5423f0f8301d9093d1931c3f216d2abd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 width
    int32 height
    int32 channel
    int64 time_stamp
    int32 send_mode
    int32 format
    int32 index
    int32 count
    int32 depth
    int32 align
    int32 image_counter
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Image(null);
    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0
    }

    if (msg.channel !== undefined) {
      resolved.channel = msg.channel;
    }
    else {
      resolved.channel = 0
    }

    if (msg.time_stamp !== undefined) {
      resolved.time_stamp = msg.time_stamp;
    }
    else {
      resolved.time_stamp = 0
    }

    if (msg.send_mode !== undefined) {
      resolved.send_mode = msg.send_mode;
    }
    else {
      resolved.send_mode = 0
    }

    if (msg.format !== undefined) {
      resolved.format = msg.format;
    }
    else {
      resolved.format = 0
    }

    if (msg.index !== undefined) {
      resolved.index = msg.index;
    }
    else {
      resolved.index = 0
    }

    if (msg.count !== undefined) {
      resolved.count = msg.count;
    }
    else {
      resolved.count = 0
    }

    if (msg.depth !== undefined) {
      resolved.depth = msg.depth;
    }
    else {
      resolved.depth = 0
    }

    if (msg.align !== undefined) {
      resolved.align = msg.align;
    }
    else {
      resolved.align = 0
    }

    if (msg.image_counter !== undefined) {
      resolved.image_counter = msg.image_counter;
    }
    else {
      resolved.image_counter = 0
    }

    return resolved;
    }
};

module.exports = Image;
