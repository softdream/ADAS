// Auto-generated. Do not edit!

// (in-package j2_mono.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Data = require('./Data.js');

//-----------------------------------------------------------

class Meta {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.version = null;
      this.frame_id = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('version')) {
        this.version = initObj.version
      }
      else {
        this.version = 0;
      }
      if (initObj.hasOwnProperty('frame_id')) {
        this.frame_id = initObj.frame_id
      }
      else {
        this.frame_id = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new Data();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Meta
    // Serialize message field [version]
    bufferOffset = _serializer.int32(obj.version, buffer, bufferOffset);
    // Serialize message field [frame_id]
    bufferOffset = _serializer.int32(obj.frame_id, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = Data.serialize(obj.data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Meta
    let len;
    let data = new Meta(null);
    // Deserialize message field [version]
    data.version = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [frame_id]
    data.frame_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = Data.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Data.getMessageSize(object.data);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'j2_mono/Meta';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8c467c3ca79679713158dc0117d10d95';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 version
    int32 frame_id
    Data data
    
    ================================================================================
    MSG: j2_mono/Data
    int32 version
    int32 frame_id
    Image[] image
    int32 data_descriptor
    #CameraParam camera
    #CameraParam camera_default
    #CameraMatrix camera_matrix
    #SensorFrame sensor
    #MotionFrame montion
    odometryFrame odometry
    StructurePerception structure_perception
    
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
    MSG: j2_mono/odometryFrame
    float32 x
    float32 y
    float32 yaw
    float32 speed
    float32 yaw_rate
    int32 time_stamp
    
    ================================================================================
    MSG: j2_mono/StructurePerception
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
    const resolved = new Meta(null);
    if (msg.version !== undefined) {
      resolved.version = msg.version;
    }
    else {
      resolved.version = 0
    }

    if (msg.frame_id !== undefined) {
      resolved.frame_id = msg.frame_id;
    }
    else {
      resolved.frame_id = 0
    }

    if (msg.data !== undefined) {
      resolved.data = Data.Resolve(msg.data)
    }
    else {
      resolved.data = new Data()
    }

    return resolved;
    }
};

module.exports = Meta;
