;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Lines)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Lines (find-package "J2_MONO")))
(unless (find-package "J2_MONO::LINES")
  (make-package "J2_MONO::LINES"))

(in-package "ROS")
;;//! \htmlinclude Lines.msg.html


(defclass j2_mono::Lines
  :super ros::object
  :slots (_cam_id _lines ))

(defmethod j2_mono::Lines
  (:init
   (&key
    ((:cam_id __cam_id) 0)
    ((:lines __lines) (let (r) (dotimes (i 0) (push (instance j2_mono::Line :init) r)) r))
    )
   (send-super :init)
   (setq _cam_id (round __cam_id))
   (setq _lines __lines)
   self)
  (:cam_id
   (&optional __cam_id)
   (if __cam_id (setq _cam_id __cam_id)) _cam_id)
  (:lines
   (&rest __lines)
   (if (keywordp (car __lines))
       (send* _lines __lines)
     (progn
       (if __lines (setq _lines (car __lines)))
       _lines)))
  (:serialization-length
   ()
   (+
    ;; uint32 _cam_id
    4
    ;; j2_mono/Line[] _lines
    (apply #'+ (send-all _lines :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _cam_id
       (write-long _cam_id s)
     ;; j2_mono/Line[] _lines
     (write-long (length _lines) s)
     (dolist (elem _lines)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _cam_id
     (setq _cam_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; j2_mono/Line[] _lines
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lines (let (r) (dotimes (i n) (push (instance j2_mono::Line :init) r)) r))
     (dolist (elem- _lines)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get j2_mono::Lines :md5sum-) "81f65aa561ab98e1b11e8498fb81cb8c")
(setf (get j2_mono::Lines :datatype-) "j2_mono/Lines")
(setf (get j2_mono::Lines :definition-)
      "uint32 cam_id
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
MSG: j2_mono/Point
float32 x
float32 y
float32 z

")



(provide :j2_mono/Lines "81f65aa561ab98e1b11e8498fb81cb8c")


