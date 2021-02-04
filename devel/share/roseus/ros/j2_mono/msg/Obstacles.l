;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Obstacles)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Obstacles (find-package "J2_MONO")))
(unless (find-package "J2_MONO::OBSTACLES")
  (make-package "J2_MONO::OBSTACLES"))

(in-package "ROS")
;;//! \htmlinclude Obstacles.msg.html


(defclass j2_mono::Obstacles
  :super ros::object
  :slots (_cam_id _obstacle _conf_scale ))

(defmethod j2_mono::Obstacles
  (:init
   (&key
    ((:cam_id __cam_id) 0)
    ((:obstacle __obstacle) (let (r) (dotimes (i 0) (push (instance j2_mono::Obstacle :init) r)) r))
    ((:conf_scale __conf_scale) 0.0)
    )
   (send-super :init)
   (setq _cam_id (round __cam_id))
   (setq _obstacle __obstacle)
   (setq _conf_scale (float __conf_scale))
   self)
  (:cam_id
   (&optional __cam_id)
   (if __cam_id (setq _cam_id __cam_id)) _cam_id)
  (:obstacle
   (&rest __obstacle)
   (if (keywordp (car __obstacle))
       (send* _obstacle __obstacle)
     (progn
       (if __obstacle (setq _obstacle (car __obstacle)))
       _obstacle)))
  (:conf_scale
   (&optional __conf_scale)
   (if __conf_scale (setq _conf_scale __conf_scale)) _conf_scale)
  (:serialization-length
   ()
   (+
    ;; int32 _cam_id
    4
    ;; j2_mono/Obstacle[] _obstacle
    (apply #'+ (send-all _obstacle :serialization-length)) 4
    ;; float32 _conf_scale
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _cam_id
       (write-long _cam_id s)
     ;; j2_mono/Obstacle[] _obstacle
     (write-long (length _obstacle) s)
     (dolist (elem _obstacle)
       (send elem :serialize s)
       )
     ;; float32 _conf_scale
       (sys::poke _conf_scale (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _cam_id
     (setq _cam_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; j2_mono/Obstacle[] _obstacle
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacle (let (r) (dotimes (i n) (push (instance j2_mono::Obstacle :init) r)) r))
     (dolist (elem- _obstacle)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float32 _conf_scale
     (setq _conf_scale (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get j2_mono::Obstacles :md5sum-) "b666125b67b55ba2c6622f953580c9ac")
(setf (get j2_mono::Obstacles :datatype-) "j2_mono/Obstacles")
(setf (get j2_mono::Obstacles :definition-)
      "int32 cam_id
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

")



(provide :j2_mono/Obstacles "b666125b67b55ba2c6622f953580c9ac")


