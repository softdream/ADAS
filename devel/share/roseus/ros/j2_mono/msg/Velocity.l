;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Velocity)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Velocity (find-package "J2_MONO")))
(unless (find-package "J2_MONO::VELOCITY")
  (make-package "J2_MONO::VELOCITY"))

(in-package "ROS")
;;//! \htmlinclude Velocity.msg.html


(defclass j2_mono::Velocity
  :super ros::object
  :slots (_vx _vy _vz ))

(defmethod j2_mono::Velocity
  (:init
   (&key
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:vz __vz) 0.0)
    )
   (send-super :init)
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _vz (float __vz))
   self)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:vz
   (&optional __vz)
   (if __vz (setq _vz __vz)) _vz)
  (:serialization-length
   ()
   (+
    ;; float32 _vx
    4
    ;; float32 _vy
    4
    ;; float32 _vz
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vz
       (sys::poke _vz (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _vx
     (setq _vx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vy
     (setq _vy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vz
     (setq _vz (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get j2_mono::Velocity :md5sum-) "ac272c003bd99cf28cdbf4d88ce75837")
(setf (get j2_mono::Velocity :datatype-) "j2_mono/Velocity")
(setf (get j2_mono::Velocity :definition-)
      "float32 vx
float32 vy
float32 vz

")



(provide :j2_mono/Velocity "ac272c003bd99cf28cdbf4d88ce75837")


