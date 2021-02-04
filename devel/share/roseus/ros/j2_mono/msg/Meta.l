;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Meta)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Meta (find-package "J2_MONO")))
(unless (find-package "J2_MONO::META")
  (make-package "J2_MONO::META"))

(in-package "ROS")
;;//! \htmlinclude Meta.msg.html


(defclass j2_mono::Meta
  :super ros::object
  :slots (_version _frame_id _data ))

(defmethod j2_mono::Meta
  (:init
   (&key
    ((:version __version) 0)
    ((:frame_id __frame_id) 0)
    ((:data __data) (instance j2_mono::Data :init))
    )
   (send-super :init)
   (setq _version (round __version))
   (setq _frame_id (round __frame_id))
   (setq _data __data)
   self)
  (:version
   (&optional __version)
   (if __version (setq _version __version)) _version)
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; int32 _version
    4
    ;; int32 _frame_id
    4
    ;; j2_mono/Data _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _version
       (write-long _version s)
     ;; int32 _frame_id
       (write-long _frame_id s)
     ;; j2_mono/Data _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _version
     (setq _version (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _frame_id
     (setq _frame_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; j2_mono/Data _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(setf (get j2_mono::Meta :md5sum-) "8c467c3ca79679713158dc0117d10d95")
(setf (get j2_mono::Meta :datatype-) "j2_mono/Meta")
(setf (get j2_mono::Meta :definition-)
      "int32 version
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

")



(provide :j2_mono/Meta "8c467c3ca79679713158dc0117d10d95")


