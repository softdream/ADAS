;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::ImageSpaceInfo)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'ImageSpaceInfo (find-package "J2_MONO")))
(unless (find-package "J2_MONO::IMAGESPACEINFO")
  (make-package "J2_MONO::IMAGESPACEINFO"))

(in-package "ROS")
;;//! \htmlinclude ImageSpaceInfo.msg.html


(defclass j2_mono::ImageSpaceInfo
  :super ros::object
  :slots (_rect _box _poly _sigma_width _sigma_height _sigma_x _sigma_y ))

(defmethod j2_mono::ImageSpaceInfo
  (:init
   (&key
    ((:rect __rect) (instance j2_mono::Rect :init))
    ((:box __box) (instance j2_mono::Box3D :init))
    ((:poly __poly) (instance j2_mono::Polygon :init))
    ((:sigma_width __sigma_width) 0.0)
    ((:sigma_height __sigma_height) 0.0)
    ((:sigma_x __sigma_x) 0.0)
    ((:sigma_y __sigma_y) 0.0)
    )
   (send-super :init)
   (setq _rect __rect)
   (setq _box __box)
   (setq _poly __poly)
   (setq _sigma_width (float __sigma_width))
   (setq _sigma_height (float __sigma_height))
   (setq _sigma_x (float __sigma_x))
   (setq _sigma_y (float __sigma_y))
   self)
  (:rect
   (&rest __rect)
   (if (keywordp (car __rect))
       (send* _rect __rect)
     (progn
       (if __rect (setq _rect (car __rect)))
       _rect)))
  (:box
   (&rest __box)
   (if (keywordp (car __box))
       (send* _box __box)
     (progn
       (if __box (setq _box (car __box)))
       _box)))
  (:poly
   (&rest __poly)
   (if (keywordp (car __poly))
       (send* _poly __poly)
     (progn
       (if __poly (setq _poly (car __poly)))
       _poly)))
  (:sigma_width
   (&optional __sigma_width)
   (if __sigma_width (setq _sigma_width __sigma_width)) _sigma_width)
  (:sigma_height
   (&optional __sigma_height)
   (if __sigma_height (setq _sigma_height __sigma_height)) _sigma_height)
  (:sigma_x
   (&optional __sigma_x)
   (if __sigma_x (setq _sigma_x __sigma_x)) _sigma_x)
  (:sigma_y
   (&optional __sigma_y)
   (if __sigma_y (setq _sigma_y __sigma_y)) _sigma_y)
  (:serialization-length
   ()
   (+
    ;; j2_mono/Rect _rect
    (send _rect :serialization-length)
    ;; j2_mono/Box3D _box
    (send _box :serialization-length)
    ;; j2_mono/Polygon _poly
    (send _poly :serialization-length)
    ;; float32 _sigma_width
    4
    ;; float32 _sigma_height
    4
    ;; float32 _sigma_x
    4
    ;; float32 _sigma_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; j2_mono/Rect _rect
       (send _rect :serialize s)
     ;; j2_mono/Box3D _box
       (send _box :serialize s)
     ;; j2_mono/Polygon _poly
       (send _poly :serialize s)
     ;; float32 _sigma_width
       (sys::poke _sigma_width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sigma_height
       (sys::poke _sigma_height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sigma_x
       (sys::poke _sigma_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sigma_y
       (sys::poke _sigma_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; j2_mono/Rect _rect
     (send _rect :deserialize buf ptr-) (incf ptr- (send _rect :serialization-length))
   ;; j2_mono/Box3D _box
     (send _box :deserialize buf ptr-) (incf ptr- (send _box :serialization-length))
   ;; j2_mono/Polygon _poly
     (send _poly :deserialize buf ptr-) (incf ptr- (send _poly :serialization-length))
   ;; float32 _sigma_width
     (setq _sigma_width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sigma_height
     (setq _sigma_height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sigma_x
     (setq _sigma_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sigma_y
     (setq _sigma_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get j2_mono::ImageSpaceInfo :md5sum-) "1fb215e492dbe974ebabb86f0056d4f6")
(setf (get j2_mono::ImageSpaceInfo :datatype-) "j2_mono/ImageSpaceInfo")
(setf (get j2_mono::ImageSpaceInfo :definition-)
      "Rect rect
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

")



(provide :j2_mono/ImageSpaceInfo "1fb215e492dbe974ebabb86f0056d4f6")


