// Auto-generated. Do not edit!

// (in-package j2_mono.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Obstacles = require('./Obstacles.js');
let Lines = require('./Lines.js');
let Image = require('./Image.js');
let FreeSpacePoints = require('./FreeSpacePoints.js');

//-----------------------------------------------------------

class StructurePerception {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.obstacles = null;
      this.lines = null;
      this.parsing = null;
      this.depth = null;
      this.scan_pts = null;
    }
    else {
      if (initObj.hasOwnProperty('obstacles')) {
        this.obstacles = initObj.obstacles
      }
      else {
        this.obstacles = [];
      }
      if (initObj.hasOwnProperty('lines')) {
        this.lines = initObj.lines
      }
      else {
        this.lines = [];
      }
      if (initObj.hasOwnProperty('parsing')) {
        this.parsing = initObj.parsing
      }
      else {
        this.parsing = [];
      }
      if (initObj.hasOwnProperty('depth')) {
        this.depth = initObj.depth
      }
      else {
        this.depth = [];
      }
      if (initObj.hasOwnProperty('scan_pts')) {
        this.scan_pts = initObj.scan_pts
      }
      else {
        this.scan_pts = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StructurePerception
    // Serialize message field [obstacles]
    // Serialize the length for message field [obstacles]
    bufferOffset = _serializer.uint32(obj.obstacles.length, buffer, bufferOffset);
    obj.obstacles.forEach((val) => {
      bufferOffset = Obstacles.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [lines]
    // Serialize the length for message field [lines]
    bufferOffset = _serializer.uint32(obj.lines.length, buffer, bufferOffset);
    obj.lines.forEach((val) => {
      bufferOffset = Lines.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [parsing]
    // Serialize the length for message field [parsing]
    bufferOffset = _serializer.uint32(obj.parsing.length, buffer, bufferOffset);
    obj.parsing.forEach((val) => {
      bufferOffset = Image.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [depth]
    // Serialize the length for message field [depth]
    bufferOffset = _serializer.uint32(obj.depth.length, buffer, bufferOffset);
    obj.depth.forEach((val) => {
      bufferOffset = Image.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [scan_pts]
    // Serialize the length for message field [scan_pts]
    bufferOffset = _serializer.uint32(obj.scan_pts.length, buffer, bufferOffset);
    obj.scan_pts.forEach((val) => {
      bufferOffset = FreeSpacePoints.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StructurePerception
    let len;
    let data = new StructurePerception(null);
    // Deserialize message field [obstacles]
    // Deserialize array length for message field [obstacles]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacles = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacles[i] = Obstacles.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [lines]
    // Deserialize array length for message field [lines]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.lines = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.lines[i] = Lines.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [parsing]
    // Deserialize array length for message field [parsing]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.parsing = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.parsing[i] = Image.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [depth]
    // Deserialize array length for message field [depth]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.depth = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.depth[i] = Image.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [scan_pts]
    // Deserialize array length for message field [scan_pts]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.scan_pts = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.scan_pts[i] = FreeSpacePoints.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.obstacles.forEach((val) => {
      length += Obstacles.getMessageSize(val);
    });
    object.lines.forEach((val) => {
      length += Lines.getMessageSize(val);
    });
    length += 48 * object.parsing.length;
    length += 48 * object.depth.length;
    object.scan_pts.forEach((val) => {
      length += FreeSpacePoints.getMessageSize(val);
    });
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/StructurePerception';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3d9b9bfdc995a7d79a16758bb8437266';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Obstacles[] obstacles
    Lines[] lines
    Image[] parsing
    Image[] depth
    FreeSpacePoints[] scan_pts
    #ParsingSetting[] parsing_settings
    
    ================================================================================
    MSG: j2_mono/Obstacles
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
    
    ================================================================================
    MSG: j2_mono/Lines
    uint32 cam_id
    Line[] lines
    
    ================================================================================
    MSG: j2_mono/Line
    int32 id
    int32 life_time
    float32[] coeffs
    Point[] end_points
    int32 type #LINE_DOUBLE=512, LINE_DASH=1024, LINE_SOLID=2048
    int32 source #LINE_PERCEPTION=2097152, LINE_TRACKING=4194304
    float32 dist_to_front_wheel
    float32 width
    int32 type_sibling
    float32 conf
    float32[] sigma_coeffs
    
    
    ================================================================================
    MSG: j2_mono/Image
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
    
    ================================================================================
    MSG: j2_mono/FreeSpacePoints
    int32[] property
    int32 cam_id
    Point[] pts_vcs
    Point[] pts_img
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StructurePerception(null);
    if (msg.obstacles !== undefined) {
      resolved.obstacles = new Array(msg.obstacles.length);
      for (let i = 0; i < resolved.obstacles.length; ++i) {
        resolved.obstacles[i] = Obstacles.Resolve(msg.obstacles[i]);
      }
    }
    else {
      resolved.obstacles = []
    }

    if (msg.lines !== undefined) {
      resolved.lines = new Array(msg.lines.length);
      for (let i = 0; i < resolved.lines.length; ++i) {
        resolved.lines[i] = Lines.Resolve(msg.lines[i]);
      }
    }
    else {
      resolved.lines = []
    }

    if (msg.parsing !== undefined) {
      resolved.parsing = new Array(msg.parsing.length);
      for (let i = 0; i < resolved.parsing.length; ++i) {
        resolved.parsing[i] = Image.Resolve(msg.parsing[i]);
      }
    }
    else {
      resolved.parsing = []
    }

    if (msg.depth !== undefined) {
      resolved.depth = new Array(msg.depth.length);
      for (let i = 0; i < resolved.depth.length; ++i) {
        resolved.depth[i] = Image.Resolve(msg.depth[i]);
      }
    }
    else {
      resolved.depth = []
    }

    if (msg.scan_pts !== undefined) {
      resolved.scan_pts = new Array(msg.scan_pts.length);
      for (let i = 0; i < resolved.scan_pts.length; ++i) {
        resolved.scan_pts[i] = FreeSpacePoints.Resolve(msg.scan_pts[i]);
      }
    }
    else {
      resolved.scan_pts = []
    }

    return resolved;
    }
};

module.exports = StructurePerception;
