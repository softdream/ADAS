;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::odometryFrame)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'odometryFrame (find-package "J2_MONO")))
(unless (find-package "J2_MONO::ODOMETRYFRAME")
  (make-package "J2_MONO::ODOMETRYFRAME"))

(in-package "ROS")
;;//! \htmlinclude odometryFrame.msg.html


(defclass j2_mono::odometryFrame
  :super ros::object
  :slots (_x _y _yaw _speed _yaw_rate _time_stamp ))

(defmethod j2_mono::odometryFrame
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:yaw __yaw) 0.0)
    ((:speed __speed) 0.0)
    ((:yaw_rate __yaw_rate) 0.0)
    ((:time_stamp __time_stamp) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _yaw (float __yaw))
   (setq _speed (float __speed))
   (setq _yaw_rate (float __yaw_rate))
   (setq _time_stamp (round __time_stamp))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:yaw_rate
   (&optional __yaw_rate)
   (if __yaw_rate (setq _yaw_rate __yaw_rate)) _yaw_rate)
  (:time_stamp
   (&optional __time_stamp)
   (if __time_stamp (setq _time_stamp __time_stamp)) _time_stamp)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _yaw
    4
    ;; float32 _speed
    4
    ;; float32 _yaw_rate
    4
    ;; int32 _time_stamp
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_rate
       (sys::poke _yaw_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _time_stamp
       (write-long _time_stamp s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_rate
     (setq _yaw_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _time_stamp
     (setq _time_stamp (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get j2_mono::odometryFrame :md5sum-) "5a95cc00626a88f4bbae5ae097e0829f")
(setf (get j2_mono::odometryFrame :datatype-) "j2_mono/odometryFrame")
(setf (get j2_mono::odometryFrame :definition-)
      "float32 x
float32 y
float32 yaw
float32 speed
float32 yaw_rate
int32 time_stamp

")



(provide :j2_mono/odometryFrame "5a95cc00626a88f4bbae5ae097e0829f")


