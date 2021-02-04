;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::StructurePerception)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'StructurePerception (find-package "J2_MONO")))
(unless (find-package "J2_MONO::STRUCTUREPERCEPTION")
  (make-package "J2_MONO::STRUCTUREPERCEPTION"))

(in-package "ROS")
;;//! \htmlinclude StructurePerception.msg.html


(defclass j2_mono::StructurePerception
  :super ros::object
  :slots (_obstacles _lines _parsing _depth _scan_pts ))

(defmethod j2_mono::StructurePerception
  (:init
   (&key
    ((:obstacles __obstacles) (let (r) (dotimes (i 0) (push (instance j2_mono::Obstacles :init) r)) r))
    ((:lines __lines) (let (r) (dotimes (i 0) (push (instance j2_mono::Lines :init) r)) r))
    ((:parsing __parsing) (let (r) (dotimes (i 0) (push (instance j2_mono::Image :init) r)) r))
    ((:depth __depth) (let (r) (dotimes (i 0) (push (instance j2_mono::Image :init) r)) r))
    ((:scan_pts __scan_pts) (let (r) (dotimes (i 0) (push (instance j2_mono::FreeSpacePoints :init) r)) r))
    )
   (send-super :init)
   (setq _obstacles __obstacles)
   (setq _lines __lines)
   (setq _parsing __parsing)
   (setq _depth __depth)
   (setq _scan_pts __scan_pts)
   self)
  (:obstacles
   (&rest __obstacles)
   (if (keywordp (car __obstacles))
       (send* _obstacles __obstacles)
     (progn
       (if __obstacles (setq _obstacles (car __obstacles)))
       _obstacles)))
  (:lines
   (&rest __lines)
   (if (keywordp (car __lines))
       (send* _lines __lines)
     (progn
       (if __lines (setq _lines (car __lines)))
       _lines)))
  (:parsing
   (&rest __parsing)
   (if (keywordp (car __parsing))
       (send* _parsing __parsing)
     (progn
       (if __parsing (setq _parsing (car __parsing)))
       _parsing)))
  (:depth
   (&rest __depth)
   (if (keywordp (car __depth))
       (send* _depth __depth)
     (progn
       (if __depth (setq _depth (car __depth)))
       _depth)))
  (:scan_pts
   (&rest __scan_pts)
   (if (keywordp (car __scan_pts))
       (send* _scan_pts __scan_pts)
     (progn
       (if __scan_pts (setq _scan_pts (car __scan_pts)))
       _scan_pts)))
  (:serialization-length
   ()
   (+
    ;; j2_mono/Obstacles[] _obstacles
    (apply #'+ (send-all _obstacles :serialization-length)) 4
    ;; j2_mono/Lines[] _lines
    (apply #'+ (send-all _lines :serialization-length)) 4
    ;; j2_mono/Image[] _parsing
    (apply #'+ (send-all _parsing :serialization-length)) 4
    ;; j2_mono/Image[] _depth
    (apply #'+ (send-all _depth :serialization-length)) 4
    ;; j2_mono/FreeSpacePoints[] _scan_pts
    (apply #'+ (send-all _scan_pts :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; j2_mono/Obstacles[] _obstacles
     (write-long (length _obstacles) s)
     (dolist (elem _obstacles)
       (send elem :serialize s)
       )
     ;; j2_mono/Lines[] _lines
     (write-long (length _lines) s)
     (dolist (elem _lines)
       (send elem :serialize s)
       )
     ;; j2_mono/Image[] _parsing
     (write-long (length _parsing) s)
     (dolist (elem _parsing)
       (send elem :serialize s)
       )
     ;; j2_mono/Image[] _depth
     (write-long (length _depth) s)
     (dolist (elem _depth)
       (send elem :serialize s)
       )
     ;; j2_mono/FreeSpacePoints[] _scan_pts
     (write-long (length _scan_pts) s)
     (dolist (elem _scan_pts)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; j2_mono/Obstacles[] _obstacles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacles (let (r) (dotimes (i n) (push (instance j2_mono::Obstacles :init) r)) r))
     (dolist (elem- _obstacles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; j2_mono/Lines[] _lines
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lines (let (r) (dotimes (i n) (push (instance j2_mono::Lines :init) r)) r))
     (dolist (elem- _lines)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; j2_mono/Image[] _parsing
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _parsing (let (r) (dotimes (i n) (push (instance j2_mono::Image :init) r)) r))
     (dolist (elem- _parsing)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; j2_mono/Image[] _depth
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _depth (let (r) (dotimes (i n) (push (instance j2_mono::Image :init) r)) r))
     (dolist (elem- _depth)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; j2_mono/FreeSpacePoints[] _scan_pts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _scan_pts (let (r) (dotimes (i n) (push (instance j2_mono::FreeSpacePoints :init) r)) r))
     (dolist (elem- _scan_pts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get j2_mono::StructurePerception :md5sum-) "3d9b9bfdc995a7d79a16758bb8437266")
(setf (get j2_mono::StructurePerception :datatype-) "j2_mono/StructurePerception")
(setf (get j2_mono::StructurePerception :definition-)
      "Obstacles[] obstacles
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

")



(provide :j2_mono/StructurePerception "3d9b9bfdc995a7d79a16758bb8437266")


