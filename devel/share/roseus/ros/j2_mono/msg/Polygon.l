;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Polygon)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Polygon (find-package "J2_MONO")))
(unless (find-package "J2_MONO::POLYGON")
  (make-package "J2_MONO::POLYGON"))

(in-package "ROS")
;;//! \htmlinclude Polygon.msg.html


(defclass j2_mono::Polygon
  :super ros::object
  :slots (_pts ))

(defmethod j2_mono::Polygon
  (:init
   (&key
    ((:pts __pts) (let (r) (dotimes (i 0) (push (instance j2_mono::Point :init) r)) r))
    )
   (send-super :init)
   (setq _pts __pts)
   self)
  (:pts
   (&rest __pts)
   (if (keywordp (car __pts))
       (send* _pts __pts)
     (progn
       (if __pts (setq _pts (car __pts)))
       _pts)))
  (:serialization-length
   ()
   (+
    ;; j2_mono/Point[] _pts
    (apply #'+ (send-all _pts :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; j2_mono/Point[] _pts
     (write-long (length _pts) s)
     (dolist (elem _pts)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; j2_mono/Point[] _pts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pts (let (r) (dotimes (i n) (push (instance j2_mono::Point :init) r)) r))
     (dolist (elem- _pts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get j2_mono::Polygon :md5sum-) "c9d7e166d449653c48720f55c89cbced")
(setf (get j2_mono::Polygon :datatype-) "j2_mono/Polygon")
(setf (get j2_mono::Polygon :definition-)
      "Point[] pts

================================================================================
MSG: j2_mono/Point
float32 x
float32 y
float32 z

")



(provide :j2_mono/Polygon "c9d7e166d449653c48720f55c89cbced")


