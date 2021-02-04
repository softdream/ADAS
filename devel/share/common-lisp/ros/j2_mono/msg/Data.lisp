; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude Data.msg.html

(cl:defclass <Data> (roslisp-msg-protocol:ros-message)
  ((version
    :reader version
    :initarg :version
    :type cl:integer
    :initform 0)
   (frame_id
    :reader frame_id
    :initarg :frame_id
    :type cl:integer
    :initform 0)
   (image
    :reader image
    :initarg :image
    :type (cl:vector j2_mono-msg:Image)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Image :initial-element (cl:make-instance 'j2_mono-msg:Image)))
   (data_descriptor
    :reader data_descriptor
    :initarg :data_descriptor
    :type cl:integer
    :initform 0)
   (odometry
    :reader odometry
    :initarg :odometry
    :type j2_mono-msg:odometryFrame
    :initform (cl:make-instance 'j2_mono-msg:odometryFrame))
   (structure_perception
    :reader structure_perception
    :initarg :structure_perception
    :type j2_mono-msg:StructurePerception
    :initform (cl:make-instance 'j2_mono-msg:StructurePerception)))
)

(cl:defclass Data (<Data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<Data> is deprecated: use j2_mono-msg:Data instead.")))

(cl:ensure-generic-function 'version-val :lambda-list '(m))
(cl:defmethod version-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:version-val is deprecated.  Use j2_mono-msg:version instead.")
  (version m))

(cl:ensure-generic-function 'frame_id-val :lambda-list '(m))
(cl:defmethod frame_id-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:frame_id-val is deprecated.  Use j2_mono-msg:frame_id instead.")
  (frame_id m))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:image-val is deprecated.  Use j2_mono-msg:image instead.")
  (image m))

(cl:ensure-generic-function 'data_descriptor-val :lambda-list '(m))
(cl:defmethod data_descriptor-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:data_descriptor-val is deprecated.  Use j2_mono-msg:data_descriptor instead.")
  (data_descriptor m))

(cl:ensure-generic-function 'odometry-val :lambda-list '(m))
(cl:defmethod odometry-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:odometry-val is deprecated.  Use j2_mono-msg:odometry instead.")
  (odometry m))

(cl:ensure-generic-function 'structure_perception-val :lambda-list '(m))
(cl:defmethod structure_perception-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:structure_perception-val is deprecated.  Use j2_mono-msg:structure_perception instead.")
  (structure_perception m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Data>) ostream)
  "Serializes a message object of type '<Data>"
  (cl:let* ((signed (cl:slot-value msg 'version)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'frame_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'image))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'image))
  (cl:let* ((signed (cl:slot-value msg 'data_descriptor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'odometry) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'structure_perception) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Data>) istream)
  "Deserializes a message object of type '<Data>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'version) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'image) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'image)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Image))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data_descriptor) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'odometry) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'structure_perception) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Data>)))
  "Returns string type for a message object of type '<Data>"
  "j2_mono/Data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Data)))
  "Returns string type for a message object of type 'Data"
  "j2_mono/Data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Data>)))
  "Returns md5sum for a message object of type '<Data>"
  "e14d20a277709c9126477d5d06db7a45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Data)))
  "Returns md5sum for a message object of type 'Data"
  "e14d20a277709c9126477d5d06db7a45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Data>)))
  "Returns full string definition for message of type '<Data>"
  (cl:format cl:nil "int32 version~%int32 frame_id~%Image[] image~%int32 data_descriptor~%#CameraParam camera~%#CameraParam camera_default~%#CameraMatrix camera_matrix~%#SensorFrame sensor~%#MotionFrame montion~%odometryFrame odometry~%StructurePerception structure_perception~%~%================================================================================~%MSG: j2_mono/Image~%int32 width~%int32 height~%int32 channel~%int64 time_stamp~%int32 send_mode~%int32 format~%int32 index~%int32 count~%int32 depth~%int32 align~%int32 image_counter~%~%================================================================================~%MSG: j2_mono/odometryFrame~%float32 x~%float32 y~%float32 yaw~%float32 speed~%float32 yaw_rate~%int32 time_stamp~%~%================================================================================~%MSG: j2_mono/StructurePerception~%Obstacles[] obstacles~%Lines[] lines~%Image[] parsing~%Image[] depth~%FreeSpacePoints[] scan_pts~%#ParsingSetting[] parsing_settings~%~%================================================================================~%MSG: j2_mono/Obstacles~%int32 cam_id~%Obstacle[] obstacle~%float32 conf_scale # default 0.1~%~%================================================================================~%MSG: j2_mono/Obstacle~%int32 id~%int32 type #ObstacleType_VehicleRear=0, ObstacleType_VehicleFull=1, ObstacleType_Pedestrian=2, ObstacleType_TrafficSign=3, ObstacleType_TrafficLight=4, ObstacleType_ParkingSlot=5, ObstacleType_RoadSign=6, ObstacleType_Cyclist=18~%int32 conf~%int32 life_time~%int32 age~%ImageSpaceInfo img_info~%WorldSpaceInfo world_info~%int32[] property #~%string[] property_name~%int32[] property_type~%float32[] property_conf~%int8[] tracking_fmap~%~%~%================================================================================~%MSG: j2_mono/ImageSpaceInfo~%Rect rect~%Box3D box~%Polygon poly~%float32 sigma_width~%float32 sigma_height~%float32 sigma_x~%float32 sigma_y~%~%================================================================================~%MSG: j2_mono/Rect~%float32 left~%float32 top~%float32 right~%float32 bottom~%~%================================================================================~%MSG: j2_mono/Box3D~%Point lower_lt~%Point lower_lb~%Point lower_rb~%Point lower_rt~%Point upper_lt~%Point upper_lb~%Point upper_rb~%Point upper_rt~%float32 conf~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%================================================================================~%MSG: j2_mono/WorldSpaceInfo~%float32 yaw #rad~%Velocity vel #m/s relative velocity~%float32 length # real length of the obstacle in world coordinate~%float32 width # real width~%float32 height # real height~%Polygon poly # ~%Point position # real position of the obstacle in world coordinate~%int32 traversable~%float32 hmw~%float32 ttc~%int32 curr_lane~%float32 sigma_yaw~%float32[] sigma_vel~%float32 sigma_width~%float32 sigma_height~%float32[] sigma_position~%~%~%================================================================================~%MSG: j2_mono/Velocity~%float32 vx~%float32 vy~%float32 vz~%~%================================================================================~%MSG: j2_mono/Lines~%uint32 cam_id~%Line[] lines~%~%================================================================================~%MSG: j2_mono/Line~%int32 id~%int32 life_time~%float32[] coeffs~%Point[] end_points~%int32 type #LINE_DOUBLE=512, LINE_DASH=1024, LINE_SOLID=2048~%int32 source #LINE_PERCEPTION=2097152, LINE_TRACKING=4194304~%float32 dist_to_front_wheel~%float32 width~%int32 type_sibling~%float32 conf~%float32[] sigma_coeffs~%~%~%================================================================================~%MSG: j2_mono/FreeSpacePoints~%int32[] property~%int32 cam_id~%Point[] pts_vcs~%Point[] pts_img~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Data)))
  "Returns full string definition for message of type 'Data"
  (cl:format cl:nil "int32 version~%int32 frame_id~%Image[] image~%int32 data_descriptor~%#CameraParam camera~%#CameraParam camera_default~%#CameraMatrix camera_matrix~%#SensorFrame sensor~%#MotionFrame montion~%odometryFrame odometry~%StructurePerception structure_perception~%~%================================================================================~%MSG: j2_mono/Image~%int32 width~%int32 height~%int32 channel~%int64 time_stamp~%int32 send_mode~%int32 format~%int32 index~%int32 count~%int32 depth~%int32 align~%int32 image_counter~%~%================================================================================~%MSG: j2_mono/odometryFrame~%float32 x~%float32 y~%float32 yaw~%float32 speed~%float32 yaw_rate~%int32 time_stamp~%~%================================================================================~%MSG: j2_mono/StructurePerception~%Obstacles[] obstacles~%Lines[] lines~%Image[] parsing~%Image[] depth~%FreeSpacePoints[] scan_pts~%#ParsingSetting[] parsing_settings~%~%================================================================================~%MSG: j2_mono/Obstacles~%int32 cam_id~%Obstacle[] obstacle~%float32 conf_scale # default 0.1~%~%================================================================================~%MSG: j2_mono/Obstacle~%int32 id~%int32 type #ObstacleType_VehicleRear=0, ObstacleType_VehicleFull=1, ObstacleType_Pedestrian=2, ObstacleType_TrafficSign=3, ObstacleType_TrafficLight=4, ObstacleType_ParkingSlot=5, ObstacleType_RoadSign=6, ObstacleType_Cyclist=18~%int32 conf~%int32 life_time~%int32 age~%ImageSpaceInfo img_info~%WorldSpaceInfo world_info~%int32[] property #~%string[] property_name~%int32[] property_type~%float32[] property_conf~%int8[] tracking_fmap~%~%~%================================================================================~%MSG: j2_mono/ImageSpaceInfo~%Rect rect~%Box3D box~%Polygon poly~%float32 sigma_width~%float32 sigma_height~%float32 sigma_x~%float32 sigma_y~%~%================================================================================~%MSG: j2_mono/Rect~%float32 left~%float32 top~%float32 right~%float32 bottom~%~%================================================================================~%MSG: j2_mono/Box3D~%Point lower_lt~%Point lower_lb~%Point lower_rb~%Point lower_rt~%Point upper_lt~%Point upper_lb~%Point upper_rb~%Point upper_rt~%float32 conf~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%================================================================================~%MSG: j2_mono/WorldSpaceInfo~%float32 yaw #rad~%Velocity vel #m/s relative velocity~%float32 length # real length of the obstacle in world coordinate~%float32 width # real width~%float32 height # real height~%Polygon poly # ~%Point position # real position of the obstacle in world coordinate~%int32 traversable~%float32 hmw~%float32 ttc~%int32 curr_lane~%float32 sigma_yaw~%float32[] sigma_vel~%float32 sigma_width~%float32 sigma_height~%float32[] sigma_position~%~%~%================================================================================~%MSG: j2_mono/Velocity~%float32 vx~%float32 vy~%float32 vz~%~%================================================================================~%MSG: j2_mono/Lines~%uint32 cam_id~%Line[] lines~%~%================================================================================~%MSG: j2_mono/Line~%int32 id~%int32 life_time~%float32[] coeffs~%Point[] end_points~%int32 type #LINE_DOUBLE=512, LINE_DASH=1024, LINE_SOLID=2048~%int32 source #LINE_PERCEPTION=2097152, LINE_TRACKING=4194304~%float32 dist_to_front_wheel~%float32 width~%int32 type_sibling~%float32 conf~%float32[] sigma_coeffs~%~%~%================================================================================~%MSG: j2_mono/FreeSpacePoints~%int32[] property~%int32 cam_id~%Point[] pts_vcs~%Point[] pts_img~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Data>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'image) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'odometry))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'structure_perception))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Data>))
  "Converts a ROS message object to a list"
  (cl:list 'Data
    (cl:cons ':version (version msg))
    (cl:cons ':frame_id (frame_id msg))
    (cl:cons ':image (image msg))
    (cl:cons ':data_descriptor (data_descriptor msg))
    (cl:cons ':odometry (odometry msg))
    (cl:cons ':structure_perception (structure_perception msg))
))
