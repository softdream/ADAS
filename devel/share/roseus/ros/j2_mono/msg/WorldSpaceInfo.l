;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::WorldSpaceInfo)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'WorldSpaceInfo (find-package "J2_MONO")))
(unless (find-package "J2_MONO::WORLDSPACEINFO")
  (make-package "J2_MONO::WORLDSPACEINFO"))

(in-package "ROS")
;;//! \htmlinclude WorldSpaceInfo.msg.html


(defclass j2_mono::WorldSpaceInfo
  :super ros::object
  :slots (_yaw _vel _length _width _height _poly _position _traversable _hmw _ttc _curr_lane _sigma_yaw _sigma_vel _sigma_width _sigma_height _sigma_position ))

(defmethod j2_mono::WorldSpaceInfo
  (:init
   (&key
    ((:yaw __yaw) 0.0)
    ((:vel __vel) (instance j2_mono::Velocity :init))
    ((:length __length) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:poly __poly) (instance j2_mono::Polygon :init))
    ((:position __position) (instance j2_mono::Point :init))
    ((:traversable __traversable) 0)
    ((:hmw __hmw) 0.0)
    ((:ttc __ttc) 0.0)
    ((:curr_lane __curr_lane) 0)
    ((:sigma_yaw __sigma_yaw) 0.0)
    ((:sigma_vel __sigma_vel) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:sigma_width __sigma_width) 0.0)
    ((:sigma_height __sigma_height) 0.0)
    ((:sigma_position __sigma_position) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _yaw (float __yaw))
   (setq _vel __vel)
   (setq _length (float __length))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _poly __poly)
   (setq _position __position)
   (setq _traversable (round __traversable))
   (setq _hmw (float __hmw))
   (setq _ttc (float __ttc))
   (setq _curr_lane (round __curr_lane))
   (setq _sigma_yaw (float __sigma_yaw))
   (setq _sigma_vel __sigma_vel)
   (setq _sigma_width (float __sigma_width))
   (setq _sigma_height (float __sigma_height))
   (setq _sigma_position __sigma_position)
   self)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:vel
   (&rest __vel)
   (if (keywordp (car __vel))
       (send* _vel __vel)
     (progn
       (if __vel (setq _vel (car __vel)))
       _vel)))
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:poly
   (&rest __poly)
   (if (keywordp (car __poly))
       (send* _poly __poly)
     (progn
       (if __poly (setq _poly (car __poly)))
       _poly)))
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:traversable
   (&optional __traversable)
   (if __traversable (setq _traversable __traversable)) _traversable)
  (:hmw
   (&optional __hmw)
   (if __hmw (setq _hmw __hmw)) _hmw)
  (:ttc
   (&optional __ttc)
   (if __ttc (setq _ttc __ttc)) _ttc)
  (:curr_lane
   (&optional __curr_lane)
   (if __curr_lane (setq _curr_lane __curr_lane)) _curr_lane)
  (:sigma_yaw
   (&optional __sigma_yaw)
   (if __sigma_yaw (setq _sigma_yaw __sigma_yaw)) _sigma_yaw)
  (:sigma_vel
   (&optional __sigma_vel)
   (if __sigma_vel (setq _sigma_vel __sigma_vel)) _sigma_vel)
  (:sigma_width
   (&optional __sigma_width)
   (if __sigma_width (setq _sigma_width __sigma_width)) _sigma_width)
  (:sigma_height
   (&optional __sigma_height)
   (if __sigma_height (setq _sigma_height __sigma_height)) _sigma_height)
  (:sigma_position
   (&optional __sigma_position)
   (if __sigma_position (setq _sigma_position __sigma_position)) _sigma_position)
  (:serialization-length
   ()
   (+
    ;; float32 _yaw
    4
    ;; j2_mono/Velocity _vel
    (send _vel :serialization-length)
    ;; float32 _length
    4
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; j2_mono/Polygon _poly
    (send _poly :serialization-length)
    ;; j2_mono/Point _position
    (send _position :serialization-length)
    ;; int32 _traversable
    4
    ;; float32 _hmw
    4
    ;; float32 _ttc
    4
    ;; int32 _curr_lane
    4
    ;; float32 _sigma_yaw
    4
    ;; float32[] _sigma_vel
    (* 4    (length _sigma_vel)) 4
    ;; float32 _sigma_width
    4
    ;; float32 _sigma_height
    4
    ;; float32[] _sigma_position
    (* 4    (length _sigma_position)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; j2_mono/Velocity _vel
       (send _vel :serialize s)
     ;; float32 _length
       (sys::poke _length (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; j2_mono/Polygon _poly
       (send _poly :serialize s)
     ;; j2_mono/Point _position
       (send _position :serialize s)
     ;; int32 _traversable
       (write-long _traversable s)
     ;; float32 _hmw
       (sys::poke _hmw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ttc
       (sys::poke _ttc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _curr_lane
       (write-long _curr_lane s)
     ;; float32 _sigma_yaw
       (sys::poke _sigma_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _sigma_vel
     (write-long (length _sigma_vel) s)
     (dotimes (i (length _sigma_vel))
       (sys::poke (elt _sigma_vel i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _sigma_width
       (sys::poke _sigma_width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sigma_height
       (sys::poke _sigma_height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _sigma_position
     (write-long (length _sigma_position) s)
     (dotimes (i (length _sigma_position))
       (sys::poke (elt _sigma_position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; j2_mono/Velocity _vel
     (send _vel :deserialize buf ptr-) (incf ptr- (send _vel :serialization-length))
   ;; float32 _length
     (setq _length (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; j2_mono/Polygon _poly
     (send _poly :deserialize buf ptr-) (incf ptr- (send _poly :serialization-length))
   ;; j2_mono/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; int32 _traversable
     (setq _traversable (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _hmw
     (setq _hmw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ttc
     (setq _ttc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _curr_lane
     (setq _curr_lane (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _sigma_yaw
     (setq _sigma_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _sigma_vel
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sigma_vel (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sigma_vel i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _sigma_width
     (setq _sigma_width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sigma_height
     (setq _sigma_height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _sigma_position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sigma_position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sigma_position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get j2_mono::WorldSpaceInfo :md5sum-) "06b0dcae51474264c1f32cddd4cb2623")
(setf (get j2_mono::WorldSpaceInfo :datatype-) "j2_mono/WorldSpaceInfo")
(setf (get j2_mono::WorldSpaceInfo :definition-)
      "float32 yaw #rad
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
MSG: j2_mono/Polygon
Point[] pts

================================================================================
MSG: j2_mono/Point
float32 x
float32 y
float32 z

")



(provide :j2_mono/WorldSpaceInfo "06b0dcae51474264c1f32cddd4cb2623")


