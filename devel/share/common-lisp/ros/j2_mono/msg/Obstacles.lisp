; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude Obstacles.msg.html

(cl:defclass <Obstacles> (roslisp-msg-protocol:ros-message)
  ((cam_id
    :reader cam_id
    :initarg :cam_id
    :type cl:integer
    :initform 0)
   (obstacle
    :reader obstacle
    :initarg :obstacle
    :type (cl:vector j2_mono-msg:Obstacle)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Obstacle :initial-element (cl:make-instance 'j2_mono-msg:Obstacle)))
   (conf_scale
    :reader conf_scale
    :initarg :conf_scale
    :type cl:float
    :initform 0.0))
)

(cl:defclass Obstacles (<Obstacles>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Obstacles>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Obstacles)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<Obstacles> is deprecated: use j2_mono-msg:Obstacles instead.")))

(cl:ensure-generic-function 'cam_id-val :lambda-list '(m))
(cl:defmethod cam_id-val ((m <Obstacles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:cam_id-val is deprecated.  Use j2_mono-msg:cam_id instead.")
  (cam_id m))

(cl:ensure-generic-function 'obstacle-val :lambda-list '(m))
(cl:defmethod obstacle-val ((m <Obstacles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:obstacle-val is deprecated.  Use j2_mono-msg:obstacle instead.")
  (obstacle m))

(cl:ensure-generic-function 'conf_scale-val :lambda-list '(m))
(cl:defmethod conf_scale-val ((m <Obstacles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:conf_scale-val is deprecated.  Use j2_mono-msg:conf_scale instead.")
  (conf_scale m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Obstacles>) ostream)
  "Serializes a message object of type '<Obstacles>"
  (cl:let* ((signed (cl:slot-value msg 'cam_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacle))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'conf_scale))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Obstacles>) istream)
  "Deserializes a message object of type '<Obstacles>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cam_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacle) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacle)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Obstacle))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'conf_scale) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Obstacles>)))
  "Returns string type for a message object of type '<Obstacles>"
  "j2_mono/Obstacles")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Obstacles)))
  "Returns string type for a message object of type 'Obstacles"
  "j2_mono/Obstacles")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Obstacles>)))
  "Returns md5sum for a message object of type '<Obstacles>"
  "b666125b67b55ba2c6622f953580c9ac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Obstacles)))
  "Returns md5sum for a message object of type 'Obstacles"
  "b666125b67b55ba2c6622f953580c9ac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Obstacles>)))
  "Returns full string definition for message of type '<Obstacles>"
  (cl:format cl:nil "int32 cam_id~%Obstacle[] obstacle~%float32 conf_scale # default 0.1~%~%================================================================================~%MSG: j2_mono/Obstacle~%int32 id~%int32 type #ObstacleType_VehicleRear=0, ObstacleType_VehicleFull=1, ObstacleType_Pedestrian=2, ObstacleType_TrafficSign=3, ObstacleType_TrafficLight=4, ObstacleType_ParkingSlot=5, ObstacleType_RoadSign=6, ObstacleType_Cyclist=18~%int32 conf~%int32 life_time~%int32 age~%ImageSpaceInfo img_info~%WorldSpaceInfo world_info~%int32[] property #~%string[] property_name~%int32[] property_type~%float32[] property_conf~%int8[] tracking_fmap~%~%~%================================================================================~%MSG: j2_mono/ImageSpaceInfo~%Rect rect~%Box3D box~%Polygon poly~%float32 sigma_width~%float32 sigma_height~%float32 sigma_x~%float32 sigma_y~%~%================================================================================~%MSG: j2_mono/Rect~%float32 left~%float32 top~%float32 right~%float32 bottom~%~%================================================================================~%MSG: j2_mono/Box3D~%Point lower_lt~%Point lower_lb~%Point lower_rb~%Point lower_rt~%Point upper_lt~%Point upper_lb~%Point upper_rb~%Point upper_rt~%float32 conf~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%================================================================================~%MSG: j2_mono/WorldSpaceInfo~%float32 yaw #rad~%Velocity vel #m/s relative velocity~%float32 length # real length of the obstacle in world coordinate~%float32 width # real width~%float32 height # real height~%Polygon poly # ~%Point position # real position of the obstacle in world coordinate~%int32 traversable~%float32 hmw~%float32 ttc~%int32 curr_lane~%float32 sigma_yaw~%float32[] sigma_vel~%float32 sigma_width~%float32 sigma_height~%float32[] sigma_position~%~%~%================================================================================~%MSG: j2_mono/Velocity~%float32 vx~%float32 vy~%float32 vz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Obstacles)))
  "Returns full string definition for message of type 'Obstacles"
  (cl:format cl:nil "int32 cam_id~%Obstacle[] obstacle~%float32 conf_scale # default 0.1~%~%================================================================================~%MSG: j2_mono/Obstacle~%int32 id~%int32 type #ObstacleType_VehicleRear=0, ObstacleType_VehicleFull=1, ObstacleType_Pedestrian=2, ObstacleType_TrafficSign=3, ObstacleType_TrafficLight=4, ObstacleType_ParkingSlot=5, ObstacleType_RoadSign=6, ObstacleType_Cyclist=18~%int32 conf~%int32 life_time~%int32 age~%ImageSpaceInfo img_info~%WorldSpaceInfo world_info~%int32[] property #~%string[] property_name~%int32[] property_type~%float32[] property_conf~%int8[] tracking_fmap~%~%~%================================================================================~%MSG: j2_mono/ImageSpaceInfo~%Rect rect~%Box3D box~%Polygon poly~%float32 sigma_width~%float32 sigma_height~%float32 sigma_x~%float32 sigma_y~%~%================================================================================~%MSG: j2_mono/Rect~%float32 left~%float32 top~%float32 right~%float32 bottom~%~%================================================================================~%MSG: j2_mono/Box3D~%Point lower_lt~%Point lower_lb~%Point lower_rb~%Point lower_rt~%Point upper_lt~%Point upper_lb~%Point upper_rb~%Point upper_rt~%float32 conf~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%================================================================================~%MSG: j2_mono/WorldSpaceInfo~%float32 yaw #rad~%Velocity vel #m/s relative velocity~%float32 length # real length of the obstacle in world coordinate~%float32 width # real width~%float32 height # real height~%Polygon poly # ~%Point position # real position of the obstacle in world coordinate~%int32 traversable~%float32 hmw~%float32 ttc~%int32 curr_lane~%float32 sigma_yaw~%float32[] sigma_vel~%float32 sigma_width~%float32 sigma_height~%float32[] sigma_position~%~%~%================================================================================~%MSG: j2_mono/Velocity~%float32 vx~%float32 vy~%float32 vz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Obstacles>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacle) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Obstacles>))
  "Converts a ROS message object to a list"
  (cl:list 'Obstacles
    (cl:cons ':cam_id (cam_id msg))
    (cl:cons ':obstacle (obstacle msg))
    (cl:cons ':conf_scale (conf_scale msg))
))
