;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Obstacle)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Obstacle (find-package "J2_MONO")))
(unless (find-package "J2_MONO::OBSTACLE")
  (make-package "J2_MONO::OBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude Obstacle.msg.html


(defclass j2_mono::Obstacle
  :super ros::object
  :slots (_id _type _conf _life_time _age _img_info _world_info _property _property_name _property_type _property_conf _tracking_fmap ))

(defmethod j2_mono::Obstacle
  (:init
   (&key
    ((:id __id) 0)
    ((:type __type) 0)
    ((:conf __conf) 0)
    ((:life_time __life_time) 0)
    ((:age __age) 0)
    ((:img_info __img_info) (instance j2_mono::ImageSpaceInfo :init))
    ((:world_info __world_info) (instance j2_mono::WorldSpaceInfo :init))
    ((:property __property) (make-array 0 :initial-element 0 :element-type :integer))
    ((:property_name __property_name) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:property_type __property_type) (make-array 0 :initial-element 0 :element-type :integer))
    ((:property_conf __property_conf) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:tracking_fmap __tracking_fmap) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _type (round __type))
   (setq _conf (round __conf))
   (setq _life_time (round __life_time))
   (setq _age (round __age))
   (setq _img_info __img_info)
   (setq _world_info __world_info)
   (setq _property __property)
   (setq _property_name __property_name)
   (setq _property_type __property_type)
   (setq _property_conf __property_conf)
   (setq _tracking_fmap __tracking_fmap)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:conf
   (&optional __conf)
   (if __conf (setq _conf __conf)) _conf)
  (:life_time
   (&optional __life_time)
   (if __life_time (setq _life_time __life_time)) _life_time)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:img_info
   (&rest __img_info)
   (if (keywordp (car __img_info))
       (send* _img_info __img_info)
     (progn
       (if __img_info (setq _img_info (car __img_info)))
       _img_info)))
  (:world_info
   (&rest __world_info)
   (if (keywordp (car __world_info))
       (send* _world_info __world_info)
     (progn
       (if __world_info (setq _world_info (car __world_info)))
       _world_info)))
  (:property
   (&optional __property)
   (if __property (setq _property __property)) _property)
  (:property_name
   (&optional __property_name)
   (if __property_name (setq _property_name __property_name)) _property_name)
  (:property_type
   (&optional __property_type)
   (if __property_type (setq _property_type __property_type)) _property_type)
  (:property_conf
   (&optional __property_conf)
   (if __property_conf (setq _property_conf __property_conf)) _property_conf)
  (:tracking_fmap
   (&optional __tracking_fmap)
   (if __tracking_fmap (setq _tracking_fmap __tracking_fmap)) _tracking_fmap)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int32 _type
    4
    ;; int32 _conf
    4
    ;; int32 _life_time
    4
    ;; int32 _age
    4
    ;; j2_mono/ImageSpaceInfo _img_info
    (send _img_info :serialization-length)
    ;; j2_mono/WorldSpaceInfo _world_info
    (send _world_info :serialization-length)
    ;; int32[] _property
    (* 4    (length _property)) 4
    ;; string[] _property_name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _property_name)) 4
    ;; int32[] _property_type
    (* 4    (length _property_type)) 4
    ;; float32[] _property_conf
    (* 4    (length _property_conf)) 4
    ;; int8[] _tracking_fmap
    (* 1    (length _tracking_fmap)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int32 _type
       (write-long _type s)
     ;; int32 _conf
       (write-long _conf s)
     ;; int32 _life_time
       (write-long _life_time s)
     ;; int32 _age
       (write-long _age s)
     ;; j2_mono/ImageSpaceInfo _img_info
       (send _img_info :serialize s)
     ;; j2_mono/WorldSpaceInfo _world_info
       (send _world_info :serialize s)
     ;; int32[] _property
     (write-long (length _property) s)
     (dotimes (i (length _property))
       (write-long (elt _property i) s)
       )
     ;; string[] _property_name
     (write-long (length _property_name) s)
     (dolist (elem _property_name)
       (write-long (length elem) s) (princ elem s)
       )
     ;; int32[] _property_type
     (write-long (length _property_type) s)
     (dotimes (i (length _property_type))
       (write-long (elt _property_type i) s)
       )
     ;; float32[] _property_conf
     (write-long (length _property_conf) s)
     (dotimes (i (length _property_conf))
       (sys::poke (elt _property_conf i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int8[] _tracking_fmap
     (write-long (length _tracking_fmap) s)
     (dotimes (i (length _tracking_fmap))
       (write-byte (elt _tracking_fmap i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _conf
     (setq _conf (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _life_time
     (setq _life_time (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _age
     (setq _age (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; j2_mono/ImageSpaceInfo _img_info
     (send _img_info :deserialize buf ptr-) (incf ptr- (send _img_info :serialization-length))
   ;; j2_mono/WorldSpaceInfo _world_info
     (send _world_info :deserialize buf ptr-) (incf ptr- (send _world_info :serialization-length))
   ;; int32[] _property
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _property (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _property i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; string[] _property_name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _property_name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _property_name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; int32[] _property_type
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _property_type (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _property_type i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _property_conf
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _property_conf (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _property_conf i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int8[] _tracking_fmap
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tracking_fmap (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _tracking_fmap i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _tracking_fmap i) 127) (setf (elt _tracking_fmap i) (- (elt _tracking_fmap i) 256)))
     ))
   ;;
   self)
  )

(setf (get j2_mono::Obstacle :md5sum-) "aa36fd0875dc274867576399a8c05785")
(setf (get j2_mono::Obstacle :datatype-) "j2_mono/Obstacle")
(setf (get j2_mono::Obstacle :definition-)
      "int32 id
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



(provide :j2_mono/Obstacle "aa36fd0875dc274867576399a8c05785")


