;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Box3D)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Box3D (find-package "J2_MONO")))
(unless (find-package "J2_MONO::BOX3D")
  (make-package "J2_MONO::BOX3D"))

(in-package "ROS")
;;//! \htmlinclude Box3D.msg.html


(defclass j2_mono::Box3D
  :super ros::object
  :slots (_lower_lt _lower_lb _lower_rb _lower_rt _upper_lt _upper_lb _upper_rb _upper_rt _conf ))

(defmethod j2_mono::Box3D
  (:init
   (&key
    ((:lower_lt __lower_lt) (instance j2_mono::Point :init))
    ((:lower_lb __lower_lb) (instance j2_mono::Point :init))
    ((:lower_rb __lower_rb) (instance j2_mono::Point :init))
    ((:lower_rt __lower_rt) (instance j2_mono::Point :init))
    ((:upper_lt __upper_lt) (instance j2_mono::Point :init))
    ((:upper_lb __upper_lb) (instance j2_mono::Point :init))
    ((:upper_rb __upper_rb) (instance j2_mono::Point :init))
    ((:upper_rt __upper_rt) (instance j2_mono::Point :init))
    ((:conf __conf) 0.0)
    )
   (send-super :init)
   (setq _lower_lt __lower_lt)
   (setq _lower_lb __lower_lb)
   (setq _lower_rb __lower_rb)
   (setq _lower_rt __lower_rt)
   (setq _upper_lt __upper_lt)
   (setq _upper_lb __upper_lb)
   (setq _upper_rb __upper_rb)
   (setq _upper_rt __upper_rt)
   (setq _conf (float __conf))
   self)
  (:lower_lt
   (&rest __lower_lt)
   (if (keywordp (car __lower_lt))
       (send* _lower_lt __lower_lt)
     (progn
       (if __lower_lt (setq _lower_lt (car __lower_lt)))
       _lower_lt)))
  (:lower_lb
   (&rest __lower_lb)
   (if (keywordp (car __lower_lb))
       (send* _lower_lb __lower_lb)
     (progn
       (if __lower_lb (setq _lower_lb (car __lower_lb)))
       _lower_lb)))
  (:lower_rb
   (&rest __lower_rb)
   (if (keywordp (car __lower_rb))
       (send* _lower_rb __lower_rb)
     (progn
       (if __lower_rb (setq _lower_rb (car __lower_rb)))
       _lower_rb)))
  (:lower_rt
   (&rest __lower_rt)
   (if (keywordp (car __lower_rt))
       (send* _lower_rt __lower_rt)
     (progn
       (if __lower_rt (setq _lower_rt (car __lower_rt)))
       _lower_rt)))
  (:upper_lt
   (&rest __upper_lt)
   (if (keywordp (car __upper_lt))
       (send* _upper_lt __upper_lt)
     (progn
       (if __upper_lt (setq _upper_lt (car __upper_lt)))
       _upper_lt)))
  (:upper_lb
   (&rest __upper_lb)
   (if (keywordp (car __upper_lb))
       (send* _upper_lb __upper_lb)
     (progn
       (if __upper_lb (setq _upper_lb (car __upper_lb)))
       _upper_lb)))
  (:upper_rb
   (&rest __upper_rb)
   (if (keywordp (car __upper_rb))
       (send* _upper_rb __upper_rb)
     (progn
       (if __upper_rb (setq _upper_rb (car __upper_rb)))
       _upper_rb)))
  (:upper_rt
   (&rest __upper_rt)
   (if (keywordp (car __upper_rt))
       (send* _upper_rt __upper_rt)
     (progn
       (if __upper_rt (setq _upper_rt (car __upper_rt)))
       _upper_rt)))
  (:conf
   (&optional __conf)
   (if __conf (setq _conf __conf)) _conf)
  (:serialization-length
   ()
   (+
    ;; j2_mono/Point _lower_lt
    (send _lower_lt :serialization-length)
    ;; j2_mono/Point _lower_lb
    (send _lower_lb :serialization-length)
    ;; j2_mono/Point _lower_rb
    (send _lower_rb :serialization-length)
    ;; j2_mono/Point _lower_rt
    (send _lower_rt :serialization-length)
    ;; j2_mono/Point _upper_lt
    (send _upper_lt :serialization-length)
    ;; j2_mono/Point _upper_lb
    (send _upper_lb :serialization-length)
    ;; j2_mono/Point _upper_rb
    (send _upper_rb :serialization-length)
    ;; j2_mono/Point _upper_rt
    (send _upper_rt :serialization-length)
    ;; float32 _conf
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; j2_mono/Point _lower_lt
       (send _lower_lt :serialize s)
     ;; j2_mono/Point _lower_lb
       (send _lower_lb :serialize s)
     ;; j2_mono/Point _lower_rb
       (send _lower_rb :serialize s)
     ;; j2_mono/Point _lower_rt
       (send _lower_rt :serialize s)
     ;; j2_mono/Point _upper_lt
       (send _upper_lt :serialize s)
     ;; j2_mono/Point _upper_lb
       (send _upper_lb :serialize s)
     ;; j2_mono/Point _upper_rb
       (send _upper_rb :serialize s)
     ;; j2_mono/Point _upper_rt
       (send _upper_rt :serialize s)
     ;; float32 _conf
       (sys::poke _conf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; j2_mono/Point _lower_lt
     (send _lower_lt :deserialize buf ptr-) (incf ptr- (send _lower_lt :serialization-length))
   ;; j2_mono/Point _lower_lb
     (send _lower_lb :deserialize buf ptr-) (incf ptr- (send _lower_lb :serialization-length))
   ;; j2_mono/Point _lower_rb
     (send _lower_rb :deserialize buf ptr-) (incf ptr- (send _lower_rb :serialization-length))
   ;; j2_mono/Point _lower_rt
     (send _lower_rt :deserialize buf ptr-) (incf ptr- (send _lower_rt :serialization-length))
   ;; j2_mono/Point _upper_lt
     (send _upper_lt :deserialize buf ptr-) (incf ptr- (send _upper_lt :serialization-length))
   ;; j2_mono/Point _upper_lb
     (send _upper_lb :deserialize buf ptr-) (incf ptr- (send _upper_lb :serialization-length))
   ;; j2_mono/Point _upper_rb
     (send _upper_rb :deserialize buf ptr-) (incf ptr- (send _upper_rb :serialization-length))
   ;; j2_mono/Point _upper_rt
     (send _upper_rt :deserialize buf ptr-) (incf ptr- (send _upper_rt :serialization-length))
   ;; float32 _conf
     (setq _conf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get j2_mono::Box3D :md5sum-) "d2a4c3bc64f81e95d0c37d470dea3708")
(setf (get j2_mono::Box3D :datatype-) "j2_mono/Box3D")
(setf (get j2_mono::Box3D :definition-)
      "Point lower_lt
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

")



(provide :j2_mono/Box3D "d2a4c3bc64f81e95d0c37d470dea3708")


