// Auto-generated. Do not edit!

// (in-package j2_mono.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Rect = require('./Rect.js');
let Box3D = require('./Box3D.js');
let Polygon = require('./Polygon.js');

//-----------------------------------------------------------

class ImageSpaceInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rect = null;
      this.box = null;
      this.poly = null;
      this.sigma_width = null;
      this.sigma_height = null;
      this.sigma_x = null;
      this.sigma_y = null;
    }
    else {
      if (initObj.hasOwnProperty('rect')) {
        this.rect = initObj.rect
      }
      else {
        this.rect = new Rect();
      }
      if (initObj.hasOwnProperty('box')) {
        this.box = initObj.box
      }
      else {
        this.box = new Box3D();
      }
      if (initObj.hasOwnProperty('poly')) {
        this.poly = initObj.poly
      }
      else {
        this.poly = new Polygon();
      }
      if (initObj.hasOwnProperty('sigma_width')) {
        this.sigma_width = initObj.sigma_width
      }
      else {
        this.sigma_width = 0.0;
      }
      if (initObj.hasOwnProperty('sigma_height')) {
        this.sigma_height = initObj.sigma_height
      }
      else {
        this.sigma_height = 0.0;
      }
      if (initObj.hasOwnProperty('sigma_x')) {
        this.sigma_x = initObj.sigma_x
      }
      else {
        this.sigma_x = 0.0;
      }
      if (initObj.hasOwnProperty('sigma_y')) {
        this.sigma_y = initObj.sigma_y
      }
      else {
        this.sigma_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImageSpaceInfo
    // Serialize message field [rect]
    bufferOffset = Rect.serialize(obj.rect, buffer, bufferOffset);
    // Serialize message field [box]
    bufferOffset = Box3D.serialize(obj.box, buffer, bufferOffset);
    // Serialize message field [poly]
    bufferOffset = Polygon.serialize(obj.poly, buffer, bufferOffset);
    // Serialize message field [sigma_width]
    bufferOffset = _serializer.float32(obj.sigma_width, buffer, bufferOffset);
    // Serialize message field [sigma_height]
    bufferOffset = _serializer.float32(obj.sigma_height, buffer, bufferOffset);
    // Serialize message field [sigma_x]
    bufferOffset = _serializer.float32(obj.sigma_x, buffer, bufferOffset);
    // Serialize message field [sigma_y]
    bufferOffset = _serializer.float32(obj.sigma_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImageSpaceInfo
    let len;
    let data = new ImageSpaceInfo(null);
    // Deserialize message field [rect]
    data.rect = Rect.deserialize(buffer, bufferOffset);
    // Deserialize message field [box]
    data.box = Box3D.deserialize(buffer, bufferOffset);
    // Deserialize message field [poly]
    data.poly = Polygon.deserialize(buffer, bufferOffset);
    // Deserialize message field [sigma_width]
    data.sigma_width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sigma_height]
    data.sigma_height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sigma_x]
    data.sigma_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sigma_y]
    data.sigma_y = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Polygon.getMessageSize(object.poly);
    return length + 132;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/ImageSpaceInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1fb215e492dbe974ebabb86f0056d4f6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Rect rect
    Box3D box
    Polygon poly
    float32 sigma_width
    float32 sigma_height
    float32 sigma_x
    float32 sigma_y
    
    ================================================================================
    MSG: j2_mono/Rect
    float32 left
    float32 top
    float32 right
    float32 bottom
    
    ================================================================================
    MSG: j2_mono/Box3D
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
    
    ================================================================================
    MSG: j2_mono/Polygon
    Point[] pts
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImageSpaceInfo(null);
    if (msg.rect !== undefined) {
      resolved.rect = Rect.Resolve(msg.rect)
    }
    else {
      resolved.rect = new Rect()
    }

    if (msg.box !== undefined) {
      resolved.box = Box3D.Resolve(msg.box)
    }
    else {
      resolved.box = new Box3D()
    }

    if (msg.poly !== undefined) {
      resolved.poly = Polygon.Resolve(msg.poly)
    }
    else {
      resolved.poly = new Polygon()
    }

    if (msg.sigma_width !== undefined) {
      resolved.sigma_width = msg.sigma_width;
    }
    else {
      resolved.sigma_width = 0.0
    }

    if (msg.sigma_height !== undefined) {
      resolved.sigma_height = msg.sigma_height;
    }
    else {
      resolved.sigma_height = 0.0
    }

    if (msg.sigma_x !== undefined) {
      resolved.sigma_x = msg.sigma_x;
    }
    else {
      resolved.sigma_x = 0.0
    }

    if (msg.sigma_y !== undefined) {
      resolved.sigma_y = msg.sigma_y;
    }
    else {
      resolved.sigma_y = 0.0
    }

    return resolved;
    }
};

module.exports = ImageSpaceInfo;
