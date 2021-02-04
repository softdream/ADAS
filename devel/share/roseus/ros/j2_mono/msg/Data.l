;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Data)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Data (find-package "J2_MONO")))
(unless (find-package "J2_MONO::DATA")
  (make-package "J2_MONO::DATA"))

(in-package "ROS")
;;//! \htmlinclude Data.msg.html


(defclass j2_mono::Data
  :super ros::object
  :slots (_version _frame_id _image _data_descriptor _odometry _structure_perception ))

(defmethod j2_mono::Data
  (:init
   (&key
    ((:version __version) 0)
    ((:frame_id __frame_id) 0)
    ((:image __image) (let (r) (dotimes (i 0) (push (instance j2_mono::Image :init) r)) r))
    ((:data_descriptor __data_descriptor) 0)
    ((:odometry __odometry) (instance j2_mono::odometryFrame :init))
    ((:structure_perception __structure_perception) (instance j2_mono::StructurePerception :init))
    )
   (send-super :init)
   (setq _version (round __version))
   (setq _frame_id (round __frame_id))
   (setq _image __image)
   (setq _data_descriptor (round __data_descriptor))
   (setq _odometry __odometry)
   (setq _structure_perception __structure_perception)
   self)
  (:version
   (&optional __version)
   (if __version (setq _version __version)) _version)
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:data_descriptor
   (&optional __data_descriptor)
   (if __data_descriptor (setq _data_descriptor __data_descriptor)) _data_descriptor)
  (:odometry
   (&rest __odometry)
   (if (keywordp (car __odometry))
       (send* _odometry __odometry)
     (progn
       (if __odometry (setq _odometry (car __odometry)))
       _odometry)))
  (:structure_perception
   (&rest __structure_perception)
   (if (keywordp (car __structure_perception))
       (send* _structure_perception __structure_perception)
     (progn
       (if __structure_perception (setq _structure_perception (car __structure_perception)))
       _structure_perception)))
  (:serialization-length
   ()
   (+
    ;; int32 _version
    4
    ;; int32 _frame_id
    4
    ;; j2_mono/Image[] _image
    (apply #'+ (send-all _image :serialization-length)) 4
    ;; int32 _data_descriptor
    4
    ;; j2_mono/odometryFrame _odometry
    (send _odometry :serialization-length)
    ;; j2_mono/StructurePerception _structure_perception
    (send _structure_perception :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _version
       (write-long _version s)
     ;; int32 _frame_id
       (write-long _frame_id s)
     ;; j2_mono/Image[] _image
     (write-long (length _image) s)
     (dolist (elem _image)
       (send elem :serialize s)
       )
     ;; int32 _data_descriptor
       (write-long _data_descriptor s)
     ;; j2_mono/odometryFrame _odometry
       (send _odometry :serialize s)
     ;; j2_mono/StructurePerception _structure_perception
       (send _structure_perception :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _version
     (setq _version (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _frame_id
     (setq _frame_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; j2_mono/Image[] _image
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _image (let (r) (dotimes (i n) (push (instance j2_mono::Image :init) r)) r))
     (dolist (elem- _image)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32 _data_descriptor
     (setq _data_descriptor (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; j2_mono/odometryFrame _odometry
     (send _odometry :deserialize buf ptr-) (incf ptr- (send _odometry :serialization-length))
   ;; j2_mono/StructurePerception _structure_perception
     (send _structure_perception :deserialize buf ptr-) (incf ptr- (send _structure_perception :serialization-length))
   ;;
   self)
  )

(setf (get j2_mono::Data :md5sum-) "e14d20a277709c9126477d5d06db7a45")
(setf (get j2_mono::Data :datatype-) "j2_mono/Data")
(setf (get j2_mono::Data :definition-)
      "int32 version
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

")



(provide :j2_mono/Data "e14d20a277709c9126477d5d06db7a45")


