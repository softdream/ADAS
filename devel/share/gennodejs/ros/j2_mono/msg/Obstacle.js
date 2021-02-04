// Auto-generated. Do not edit!

// (in-package j2_mono.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ImageSpaceInfo = require('./ImageSpaceInfo.js');
let WorldSpaceInfo = require('./WorldSpaceInfo.js');

//-----------------------------------------------------------

class Obstacle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.type = null;
      this.conf = null;
      this.life_time = null;
      this.age = null;
      this.img_info = null;
      this.world_info = null;
      this.property = null;
      this.property_name = null;
      this.property_type = null;
      this.property_conf = null;
      this.tracking_fmap = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('conf')) {
        this.conf = initObj.conf
      }
      else {
        this.conf = 0;
      }
      if (initObj.hasOwnProperty('life_time')) {
        this.life_time = initObj.life_time
      }
      else {
        this.life_time = 0;
      }
      if (initObj.hasOwnProperty('age')) {
        this.age = initObj.age
      }
      else {
        this.age = 0;
      }
      if (initObj.hasOwnProperty('img_info')) {
        this.img_info = initObj.img_info
      }
      else {
        this.img_info = new ImageSpaceInfo();
      }
      if (initObj.hasOwnProperty('world_info')) {
        this.world_info = initObj.world_info
      }
      else {
        this.world_info = new WorldSpaceInfo();
      }
      if (initObj.hasOwnProperty('property')) {
        this.property = initObj.property
      }
      else {
        this.property = [];
      }
      if (initObj.hasOwnProperty('property_name')) {
        this.property_name = initObj.property_name
      }
      else {
        this.property_name = [];
      }
      if (initObj.hasOwnProperty('property_type')) {
        this.property_type = initObj.property_type
      }
      else {
        this.property_type = [];
      }
      if (initObj.hasOwnProperty('property_conf')) {
        this.property_conf = initObj.property_conf
      }
      else {
        this.property_conf = [];
      }
      if (initObj.hasOwnProperty('tracking_fmap')) {
        this.tracking_fmap = initObj.tracking_fmap
      }
      else {
        this.tracking_fmap = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Obstacle
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    // Serialize message field [conf]
    bufferOffset = _serializer.int32(obj.conf, buffer, bufferOffset);
    // Serialize message field [life_time]
    bufferOffset = _serializer.int32(obj.life_time, buffer, bufferOffset);
    // Serialize message field [age]
    bufferOffset = _serializer.int32(obj.age, buffer, bufferOffset);
    // Serialize message field [img_info]
    bufferOffset = ImageSpaceInfo.serialize(obj.img_info, buffer, bufferOffset);
    // Serialize message field [world_info]
    bufferOffset = WorldSpaceInfo.serialize(obj.world_info, buffer, bufferOffset);
    // Serialize message field [property]
    bufferOffset = _arraySerializer.int32(obj.property, buffer, bufferOffset, null);
    // Serialize message field [property_name]
    bufferOffset = _arraySerializer.string(obj.property_name, buffer, bufferOffset, null);
    // Serialize message field [property_type]
    bufferOffset = _arraySerializer.int32(obj.property_type, buffer, bufferOffset, null);
    // Serialize message field [property_conf]
    bufferOffset = _arraySerializer.float32(obj.property_conf, buffer, bufferOffset, null);
    // Serialize message field [tracking_fmap]
    bufferOffset = _arraySerializer.int8(obj.tracking_fmap, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Obstacle
    let len;
    let data = new Obstacle(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [conf]
    data.conf = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [life_time]
    data.life_time = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [age]
    data.age = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [img_info]
    data.img_info = ImageSpaceInfo.deserialize(buffer, bufferOffset);
    // Deserialize message field [world_info]
    data.world_info = WorldSpaceInfo.deserialize(buffer, bufferOffset);
    // Deserialize message field [property]
    data.property = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [property_name]
    data.property_name = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [property_type]
    data.property_type = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [property_conf]
    data.property_conf = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [tracking_fmap]
    data.tracking_fmap = _arrayDeserializer.int8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += ImageSpaceInfo.getMessageSize(object.img_info);
    length += WorldSpaceInfo.getMessageSize(object.world_info);
    length += 4 * object.property.length;
    object.property_name.forEach((val) => {
      length += 4 + val.length;
    });
    length += 4 * object.property_type.length;
    length += 4 * object.property_conf.length;
    length += object.tracking_fmap.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/Obstacle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aa36fd0875dc274867576399a8c05785';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Obstacle(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.conf !== undefined) {
      resolved.conf = msg.conf;
    }
    else {
      resolved.conf = 0
    }

    if (msg.life_time !== undefined) {
      resolved.life_time = msg.life_time;
    }
    else {
      resolved.life_time = 0
    }

    if (msg.age !== undefined) {
      resolved.age = msg.age;
    }
    else {
      resolved.age = 0
    }

    if (msg.img_info !== undefined) {
      resolved.img_info = ImageSpaceInfo.Resolve(msg.img_info)
    }
    else {
      resolved.img_info = new ImageSpaceInfo()
    }

    if (msg.world_info !== undefined) {
      resolved.world_info = WorldSpaceInfo.Resolve(msg.world_info)
    }
    else {
      resolved.world_info = new WorldSpaceInfo()
    }

    if (msg.property !== undefined) {
      resolved.property = msg.property;
    }
    else {
      resolved.property = []
    }

    if (msg.property_name !== undefined) {
      resolved.property_name = msg.property_name;
    }
    else {
      resolved.property_name = []
    }

    if (msg.property_type !== undefined) {
      resolved.property_type = msg.property_type;
    }
    else {
      resolved.property_type = []
    }

    if (msg.property_conf !== undefined) {
      resolved.property_conf = msg.property_conf;
    }
    else {
      resolved.property_conf = []
    }

    if (msg.tracking_fmap !== undefined) {
      resolved.tracking_fmap = msg.tracking_fmap;
    }
    else {
      resolved.tracking_fmap = []
    }

    return resolved;
    }
};

module.exports = Obstacle;
