// Auto-generated. Do not edit!

// (in-package j2_mono.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Velocity = require('./Velocity.js');
let Polygon = require('./Polygon.js');
let Point = require('./Point.js');

//-----------------------------------------------------------

class WorldSpaceInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.yaw = null;
      this.vel = null;
      this.length = null;
      this.width = null;
      this.height = null;
      this.poly = null;
      this.position = null;
      this.traversable = null;
      this.hmw = null;
      this.ttc = null;
      this.curr_lane = null;
      this.sigma_yaw = null;
      this.sigma_vel = null;
      this.sigma_width = null;
      this.sigma_height = null;
      this.sigma_position = null;
    }
    else {
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('vel')) {
        this.vel = initObj.vel
      }
      else {
        this.vel = new Velocity();
      }
      if (initObj.hasOwnProperty('length')) {
        this.length = initObj.length
      }
      else {
        this.length = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('poly')) {
        this.poly = initObj.poly
      }
      else {
        this.poly = new Polygon();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new Point();
      }
      if (initObj.hasOwnProperty('traversable')) {
        this.traversable = initObj.traversable
      }
      else {
        this.traversable = 0;
      }
      if (initObj.hasOwnProperty('hmw')) {
        this.hmw = initObj.hmw
      }
      else {
        this.hmw = 0.0;
      }
      if (initObj.hasOwnProperty('ttc')) {
        this.ttc = initObj.ttc
      }
      else {
        this.ttc = 0.0;
      }
      if (initObj.hasOwnProperty('curr_lane')) {
        this.curr_lane = initObj.curr_lane
      }
      else {
        this.curr_lane = 0;
      }
      if (initObj.hasOwnProperty('sigma_yaw')) {
        this.sigma_yaw = initObj.sigma_yaw
      }
      else {
        this.sigma_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('sigma_vel')) {
        this.sigma_vel = initObj.sigma_vel
      }
      else {
        this.sigma_vel = [];
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
      if (initObj.hasOwnProperty('sigma_position')) {
        this.sigma_position = initObj.sigma_position
      }
      else {
        this.sigma_position = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WorldSpaceInfo
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [vel]
    bufferOffset = Velocity.serialize(obj.vel, buffer, bufferOffset);
    // Serialize message field [length]
    bufferOffset = _serializer.float32(obj.length, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [poly]
    bufferOffset = Polygon.serialize(obj.poly, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = Point.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [traversable]
    bufferOffset = _serializer.int32(obj.traversable, buffer, bufferOffset);
    // Serialize message field [hmw]
    bufferOffset = _serializer.float32(obj.hmw, buffer, bufferOffset);
    // Serialize message field [ttc]
    bufferOffset = _serializer.float32(obj.ttc, buffer, bufferOffset);
    // Serialize message field [curr_lane]
    bufferOffset = _serializer.int32(obj.curr_lane, buffer, bufferOffset);
    // Serialize message field [sigma_yaw]
    bufferOffset = _serializer.float32(obj.sigma_yaw, buffer, bufferOffset);
    // Serialize message field [sigma_vel]
    bufferOffset = _arraySerializer.float32(obj.sigma_vel, buffer, bufferOffset, null);
    // Serialize message field [sigma_width]
    bufferOffset = _serializer.float32(obj.sigma_width, buffer, bufferOffset);
    // Serialize message field [sigma_height]
    bufferOffset = _serializer.float32(obj.sigma_height, buffer, bufferOffset);
    // Serialize message field [sigma_position]
    bufferOffset = _arraySerializer.float32(obj.sigma_position, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WorldSpaceInfo
    let len;
    let data = new WorldSpaceInfo(null);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vel]
    data.vel = Velocity.deserialize(buffer, bufferOffset);
    // Deserialize message field [length]
    data.length = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [poly]
    data.poly = Polygon.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [traversable]
    data.traversable = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [hmw]
    data.hmw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ttc]
    data.ttc = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [curr_lane]
    data.curr_lane = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sigma_yaw]
    data.sigma_yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sigma_vel]
    data.sigma_vel = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [sigma_width]
    data.sigma_width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sigma_height]
    data.sigma_height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sigma_position]
    data.sigma_position = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Polygon.getMessageSize(object.poly);
    length += 4 * object.sigma_vel.length;
    length += 4 * object.sigma_position.length;
    return length + 76;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/WorldSpaceInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '06b0dcae51474264c1f32cddd4cb2623';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 yaw #rad
    Velocity vel #m/s relative velocity
    float32 length # real length of the obstacle in world coordinate
    float32 width # real width
    float32 height # real height
    Polygon poly # 
    Point position # real position of the obstacle in world coordinate
    int32 traversable
    float32 hmw
    float32 ttc
    int32 curr_lane
    float32 sigma_yaw
    float32[] sigma_vel
    float32 sigma_width
    float32 sigma_height
    float32[] sigma_position
    
    
    ================================================================================
    MSG: j2_mono/Velocity
    float32 vx
    float32 vy
    float32 vz
    
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
    const resolved = new WorldSpaceInfo(null);
    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.vel !== undefined) {
      resolved.vel = Velocity.Resolve(msg.vel)
    }
    else {
      resolved.vel = new Velocity()
    }

    if (msg.length !== undefined) {
      resolved.length = msg.length;
    }
    else {
      resolved.length = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.poly !== undefined) {
      resolved.poly = Polygon.Resolve(msg.poly)
    }
    else {
      resolved.poly = new Polygon()
    }

    if (msg.position !== undefined) {
      resolved.position = Point.Resolve(msg.position)
    }
    else {
      resolved.position = new Point()
    }

    if (msg.traversable !== undefined) {
      resolved.traversable = msg.traversable;
    }
    else {
      resolved.traversable = 0
    }

    if (msg.hmw !== undefined) {
      resolved.hmw = msg.hmw;
    }
    else {
      resolved.hmw = 0.0
    }

    if (msg.ttc !== undefined) {
      resolved.ttc = msg.ttc;
    }
    else {
      resolved.ttc = 0.0
    }

    if (msg.curr_lane !== undefined) {
      resolved.curr_lane = msg.curr_lane;
    }
    else {
      resolved.curr_lane = 0
    }

    if (msg.sigma_yaw !== undefined) {
      resolved.sigma_yaw = msg.sigma_yaw;
    }
    else {
      resolved.sigma_yaw = 0.0
    }

    if (msg.sigma_vel !== undefined) {
      resolved.sigma_vel = msg.sigma_vel;
    }
    else {
      resolved.sigma_vel = []
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

    if (msg.sigma_position !== undefined) {
      resolved.sigma_position = msg.sigma_position;
    }
    else {
      resolved.sigma_position = []
    }

    return resolved;
    }
};

module.exports = WorldSpaceInfo;
