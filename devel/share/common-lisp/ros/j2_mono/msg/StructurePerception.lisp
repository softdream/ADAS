; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude StructurePerception.msg.html

(cl:defclass <StructurePerception> (roslisp-msg-protocol:ros-message)
  ((obstacles
    :reader obstacles
    :initarg :obstacles
    :type (cl:vector j2_mono-msg:Obstacles)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Obstacles :initial-element (cl:make-instance 'j2_mono-msg:Obstacles)))
   (lines
    :reader lines
    :initarg :lines
    :type (cl:vector j2_mono-msg:Lines)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Lines :initial-element (cl:make-instance 'j2_mono-msg:Lines)))
   (parsing
    :reader parsing
    :initarg :parsing
    :type (cl:vector j2_mono-msg:Image)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Image :initial-element (cl:make-instance 'j2_mono-msg:Image)))
   (depth
    :reader depth
    :initarg :depth
    :type (cl:vector j2_mono-msg:Image)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Image :initial-element (cl:make-instance 'j2_mono-msg:Image)))
   (scan_pts
    :reader scan_pts
    :initarg :scan_pts
    :type (cl:vector j2_mono-msg:FreeSpacePoints)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:FreeSpacePoints :initial-element (cl:make-instance 'j2_mono-msg:FreeSpacePoints))))
)

(cl:defclass StructurePerception (<StructurePerception>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StructurePerception>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StructurePerception)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<StructurePerception> is deprecated: use j2_mono-msg:StructurePerception instead.")))

(cl:ensure-generic-function 'obstacles-val :lambda-list '(m))
(cl:defmethod obstacles-val ((m <StructurePerception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:obstacles-val is deprecated.  Use j2_mono-msg:obstacles instead.")
  (obstacles m))

(cl:ensure-generic-function 'lines-val :lambda-list '(m))
(cl:defmethod lines-val ((m <StructurePerception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:lines-val is deprecated.  Use j2_mono-msg:lines instead.")
  (lines m))

(cl:ensure-generic-function 'parsing-val :lambda-list '(m))
(cl:defmethod parsing-val ((m <StructurePerception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:parsing-val is deprecated.  Use j2_mono-msg:parsing instead.")
  (parsing m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <StructurePerception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:depth-val is deprecated.  Use j2_mono-msg:depth instead.")
  (depth m))

(cl:ensure-generic-function 'scan_pts-val :lambda-list '(m))
(cl:defmethod scan_pts-val ((m <StructurePerception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:scan_pts-val is deprecated.  Use j2_mono-msg:scan_pts instead.")
  (scan_pts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StructurePerception>) ostream)
  "Serializes a message object of type '<StructurePerception>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacles))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lines))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'lines))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'parsing))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'parsing))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'depth))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'scan_pts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'scan_pts))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StructurePerception>) istream)
  "Deserializes a message object of type '<StructurePerception>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Obstacles))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lines) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lines)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Lines))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'parsing) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'parsing)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Image))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'depth) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'depth)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Image))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'scan_pts) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'scan_pts)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:FreeSpacePoints))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StructurePerception>)))
  "Returns string type for a message object of type '<StructurePerception>"
  "j2_mono/StructurePerception")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StructurePerception)))
  "Returns string type for a message object of type 'StructurePerception"
  "j2_mono/StructurePerception")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StructurePerception>)))
  "Returns md5sum for a message object of type '<StructurePerception>"
  "3d9b9bfdc995a7d79a16758bb8437266")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StructurePerception)))
  "Returns md5sum for a message object of type 'StructurePerception"
  "3d9b9bfdc995a7d79a16758bb8437266")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StructurePerception>)))
  "Returns full string definition for message of type '<StructurePerception>"
  (cl:format cl:nil "Obstacles[] obstacles~%Lines[] lines~%Image[] parsing~%Image[] depth~%FreeSpacePoints[] scan_pts~%#ParsingSetting[] parsing_settings~%~%================================================================================~%MSG: j2_mono/Obstacles~%int32 cam_id~%Obstacle[] obstacle~%float32 conf_scale # default 0.1~%~%================================================================================~%MSG: j2_mono/Obstacle~%int32 id~%int32 type #ObstacleType_VehicleRear=0, ObstacleType_VehicleFull=1, ObstacleType_Pedestrian=2, ObstacleType_TrafficSign=3, ObstacleType_TrafficLight=4, ObstacleType_ParkingSlot=5, ObstacleType_RoadSign=6, ObstacleType_Cyclist=18~%int32 conf~%int32 life_time~%int32 age~%ImageSpaceInfo img_info~%WorldSpaceInfo world_info~%int32[] property #~%string[] property_name~%int32[] property_type~%float32[] property_conf~%int8[] tracking_fmap~%~%~%================================================================================~%MSG: j2_mono/ImageSpaceInfo~%Rect rect~%Box3D box~%Polygon poly~%float32 sigma_width~%float32 sigma_height~%float32 sigma_x~%float32 sigma_y~%~%================================================================================~%MSG: j2_mono/Rect~%float32 left~%float32 top~%float32 right~%float32 bottom~%~%================================================================================~%MSG: j2_mono/Box3D~%Point lower_lt~%Point lower_lb~%Point lower_rb~%Point lower_rt~%Point upper_lt~%Point upper_lb~%Point upper_rb~%Point upper_rt~%float32 conf~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%================================================================================~%MSG: j2_mono/WorldSpaceInfo~%float32 yaw #rad~%Velocity vel #m/s relative velocity~%float32 length # real length of the obstacle in world coordinate~%float32 width # real width~%float32 height # real height~%Polygon poly # ~%Point position # real position of the obstacle in world coordinate~%int32 traversable~%float32 hmw~%float32 ttc~%int32 curr_lane~%float32 sigma_yaw~%float32[] sigma_vel~%float32 sigma_width~%float32 sigma_height~%float32[] sigma_position~%~%~%================================================================================~%MSG: j2_mono/Velocity~%float32 vx~%float32 vy~%float32 vz~%~%================================================================================~%MSG: j2_mono/Lines~%uint32 cam_id~%Line[] lines~%~%================================================================================~%MSG: j2_mono/Line~%int32 id~%int32 life_time~%float32[] coeffs~%Point[] end_points~%int32 type #LINE_DOUBLE=512, LINE_DASH=1024, LINE_SOLID=2048~%int32 source #LINE_PERCEPTION=2097152, LINE_TRACKING=4194304~%float32 dist_to_front_wheel~%float32 width~%int32 type_sibling~%float32 conf~%float32[] sigma_coeffs~%~%~%================================================================================~%MSG: j2_mono/Image~%int32 width~%int32 height~%int32 channel~%int64 time_stamp~%int32 send_mode~%int32 format~%int32 index~%int32 count~%int32 depth~%int32 align~%int32 image_counter~%~%================================================================================~%MSG: j2_mono/FreeSpacePoints~%int32[] property~%int32 cam_id~%Point[] pts_vcs~%Point[] pts_img~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StructurePerception)))
  "Returns full string definition for message of type 'StructurePerception"
  (cl:format cl:nil "Obstacles[] obstacles~%Lines[] lines~%Image[] parsing~%Image[] depth~%FreeSpacePoints[] scan_pts~%#ParsingSetting[] parsing_settings~%~%================================================================================~%MSG: j2_mono/Obstacles~%int32 cam_id~%Obstacle[] obstacle~%float32 conf_scale # default 0.1~%~%================================================================================~%MSG: j2_mono/Obstacle~%int32 id~%int32 type #ObstacleType_VehicleRear=0, ObstacleType_VehicleFull=1, ObstacleType_Pedestrian=2, ObstacleType_TrafficSign=3, ObstacleType_TrafficLight=4, ObstacleType_ParkingSlot=5, ObstacleType_RoadSign=6, ObstacleType_Cyclist=18~%int32 conf~%int32 life_time~%int32 age~%ImageSpaceInfo img_info~%WorldSpaceInfo world_info~%int32[] property #~%string[] property_name~%int32[] property_type~%float32[] property_conf~%int8[] tracking_fmap~%~%~%================================================================================~%MSG: j2_mono/ImageSpaceInfo~%Rect rect~%Box3D box~%Polygon poly~%float32 sigma_width~%float32 sigma_height~%float32 sigma_x~%float32 sigma_y~%~%================================================================================~%MSG: j2_mono/Rect~%float32 left~%float32 top~%float32 right~%float32 bottom~%~%================================================================================~%MSG: j2_mono/Box3D~%Point lower_lt~%Point lower_lb~%Point lower_rb~%Point lower_rt~%Point upper_lt~%Point upper_lb~%Point upper_rb~%Point upper_rt~%float32 conf~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%================================================================================~%MSG: j2_mono/WorldSpaceInfo~%float32 yaw #rad~%Velocity vel #m/s relative velocity~%float32 length # real length of the obstacle in world coordinate~%float32 width # real width~%float32 height # real height~%Polygon poly # ~%Point position # real position of the obstacle in world coordinate~%int32 traversable~%float32 hmw~%float32 ttc~%int32 curr_lane~%float32 sigma_yaw~%float32[] sigma_vel~%float32 sigma_width~%float32 sigma_height~%float32[] sigma_position~%~%~%================================================================================~%MSG: j2_mono/Velocity~%float32 vx~%float32 vy~%float32 vz~%~%================================================================================~%MSG: j2_mono/Lines~%uint32 cam_id~%Line[] lines~%~%================================================================================~%MSG: j2_mono/Line~%int32 id~%int32 life_time~%float32[] coeffs~%Point[] end_points~%int32 type #LINE_DOUBLE=512, LINE_DASH=1024, LINE_SOLID=2048~%int32 source #LINE_PERCEPTION=2097152, LINE_TRACKING=4194304~%float32 dist_to_front_wheel~%float32 width~%int32 type_sibling~%float32 conf~%float32[] sigma_coeffs~%~%~%================================================================================~%MSG: j2_mono/Image~%int32 width~%int32 height~%int32 channel~%int64 time_stamp~%int32 send_mode~%int32 format~%int32 index~%int32 count~%int32 depth~%int32 align~%int32 image_counter~%~%================================================================================~%MSG: j2_mono/FreeSpacePoints~%int32[] property~%int32 cam_id~%Point[] pts_vcs~%Point[] pts_img~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StructurePerception>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lines) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'parsing) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'depth) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'scan_pts) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StructurePerception>))
  "Converts a ROS message object to a list"
  (cl:list 'StructurePerception
    (cl:cons ':obstacles (obstacles msg))
    (cl:cons ':lines (lines msg))
    (cl:cons ':parsing (parsing msg))
    (cl:cons ':depth (depth msg))
    (cl:cons ':scan_pts (scan_pts msg))
))
