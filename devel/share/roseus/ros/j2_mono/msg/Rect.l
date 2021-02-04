;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Rect)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Rect (find-package "J2_MONO")))
(unless (find-package "J2_MONO::RECT")
  (make-package "J2_MONO::RECT"))

(in-package "ROS")
;;//! \htmlinclude Rect.msg.html


(defclass j2_mono::Rect
  :super ros::object
  :slots (_left _top _right _bottom ))

(defmethod j2_mono::Rect
  (:init
   (&key
    ((:left __left) 0.0)
    ((:top __top) 0.0)
    ((:right __right) 0.0)
    ((:bottom __bottom) 0.0)
    )
   (send-super :init)
   (setq _left (float __left))
   (setq _top (float __top))
   (setq _right (float __right))
   (setq _bottom (float __bottom))
   self)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:top
   (&optional __top)
   (if __top (setq _top __top)) _top)
  (:right
   (&optional __right)
   (if __right (setq _right __right)) _right)
  (:bottom
   (&optional __bottom)
   (if __bottom (setq _bottom __bottom)) _bottom)
  (:serialization-length
   ()
   (+
    ;; float32 _left
    4
    ;; float32 _top
    4
    ;; float32 _right
    4
    ;; float32 _bottom
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _left
       (sys::poke _left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _top
       (sys::poke _top (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right
       (sys::poke _right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bottom
       (sys::poke _bottom (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _left
     (setq _left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _top
     (setq _top (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right
     (setq _right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bottom
     (setq _bottom (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get j2_mono::Rect :md5sum-) "7aad971742c7cc38deb20cfb704affa1")
(setf (get j2_mono::Rect :datatype-) "j2_mono/Rect")
(setf (get j2_mono::Rect :definition-)
      "float32 left
float32 top
float32 right
float32 bottom

")



(provide :j2_mono/Rect "7aad971742c7cc38deb20cfb704affa1")


