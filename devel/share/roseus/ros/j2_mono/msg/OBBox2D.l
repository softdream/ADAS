;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::OBBox2D)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'OBBox2D (find-package "J2_MONO")))
(unless (find-package "J2_MONO::OBBOX2D")
  (make-package "J2_MONO::OBBOX2D"))

(in-package "ROS")
;;//! \htmlinclude OBBox2D.msg.html


(defclass j2_mono::OBBox2D
  :super ros::object
  :slots (_corner _axes_pts _size ))

(defmethod j2_mono::OBBox2D
  (:init
   (&key
    ((:corner __corner) (instance j2_mono::Point :init))
    ((:axes_pts __axes_pts) (instance j2_mono::Point :init))
    ((:size __size) 0.0)
    )
   (send-super :init)
   (setq _corner __corner)
   (setq _axes_pts __axes_pts)
   (setq _size (float __size))
   self)
  (:corner
   (&rest __corner)
   (if (keywordp (car __corner))
       (send* _corner __corner)
     (progn
       (if __corner (setq _corner (car __corner)))
       _corner)))
  (:axes_pts
   (&rest __axes_pts)
   (if (keywordp (car __axes_pts))
       (send* _axes_pts __axes_pts)
     (progn
       (if __axes_pts (setq _axes_pts (car __axes_pts)))
       _axes_pts)))
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:serialization-length
   ()
   (+
    ;; j2_mono/Point _corner
    (send _corner :serialization-length)
    ;; j2_mono/Point _axes_pts
    (send _axes_pts :serialization-length)
    ;; float32 _size
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; j2_mono/Point _corner
       (send _corner :serialize s)
     ;; j2_mono/Point _axes_pts
       (send _axes_pts :serialize s)
     ;; float32 _size
       (sys::poke _size (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; j2_mono/Point _corner
     (send _corner :deserialize buf ptr-) (incf ptr- (send _corner :serialization-length))
   ;; j2_mono/Point _axes_pts
     (send _axes_pts :deserialize buf ptr-) (incf ptr- (send _axes_pts :serialization-length))
   ;; float32 _size
     (setq _size (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get j2_mono::OBBox2D :md5sum-) "20845fd799692f5fd377b5118d47def7")
(setf (get j2_mono::OBBox2D :datatype-) "j2_mono/OBBox2D")
(setf (get j2_mono::OBBox2D :definition-)
      "Point corner
Point axes_pts
float32 size

================================================================================
MSG: j2_mono/Point
float32 x
float32 y
float32 z

")



(provide :j2_mono/OBBox2D "20845fd799692f5fd377b5118d47def7")


