// Auto-generated. Do not edit!

// (in-package j2_mono.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Obstacle = require('./Obstacle.js');

//-----------------------------------------------------------

class Obstacles {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cam_id = null;
      this.obstacle = null;
      this.conf_scale = null;
    }
    else {
      if (initObj.hasOwnProperty('cam_id')) {
        this.cam_id = initObj.cam_id
      }
      else {
        this.cam_id = 0;
      }
      if (initObj.hasOwnProperty('obstacle')) {
        this.obstacle = initObj.obstacle
      }
      else {
        this.obstacle = [];
      }
      if (initObj.hasOwnProperty('conf_scale')) {
        this.conf_scale = initObj.conf_scale
      }
      else {
        this.conf_scale = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Obstacles
    // Serialize message field [cam_id]
    bufferOffset = _serializer.int32(obj.cam_id, buffer, bufferOffset);
    // Serialize message field [obstacle]
    // Serialize the length for message field [obstacle]
    bufferOffset = _serializer.uint32(obj.obstacle.length, buffer, bufferOffset);
    obj.obstacle.forEach((val) => {
      bufferOffset = Obstacle.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [conf_scale]
    bufferOffset = _serializer.float32(obj.conf_scale, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Obstacles
    let len;
    let data = new Obstacles(null);
    // Deserialize message field [cam_id]
    data.cam_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [obstacle]
    // Deserialize array length for message field [obstacle]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacle = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacle[i] = Obstacle.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [conf_scale]
    data.conf_scale = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.obstacle.forEach((val) => {
      length += Obstacle.getMessageSize(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/Obstacles';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b666125b67b55ba2c6622f953580c9ac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 cam_id
    Obstacle[] obstacle
    float32 conf_scale # default 0.1
    
    ================================================================================
    MSG: j2_mono/Obstacle
    int32 id
    int32 type #ObstacleType_VehicleRear=0, ObstacleType_VehicleFull=1, ObstacleType_Pedestrian=2, ObstacleType_TrafficSign=3, ObstacleType_TrafficLight=4, ObstacleType_ParkingSlot=5, ObstacleType_RoadSign=6, ObstacleType_Cyclist=18
    int32 conf
    int32 life_time
    int32 age
    ImageSpaceInfo img_info
    WorldSpaceInfo world_info
    int32[] property #
    string[] property_name
    int32[] property_type
    float32[] property_conf
    int8[] tracking_fmap
    
    
    ================================================================================
    MSG: j2_mono/ImageSpaceInfo
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
    
    ================================================================================
    MSG: j2_mono/WorldSpaceInfo
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Obstacles(null);
    if (msg.cam_id !== undefined) {
      resolved.cam_id = msg.cam_id;
    }
    else {
      resolved.cam_id = 0
    }

    if (msg.obstacle !== undefined) {
      resolved.obstacle = new Array(msg.obstacle.length);
      for (let i = 0; i < resolved.obstacle.length; ++i) {
        resolved.obstacle[i] = Obstacle.Resolve(msg.obstacle[i]);
      }
    }
    else {
      resolved.obstacle = []
    }

    if (msg.conf_scale !== undefined) {
      resolved.conf_scale = msg.conf_scale;
    }
    else {
      resolved.conf_scale = 0.0
    }

    return resolved;
    }
};

module.exports = Obstacles;
