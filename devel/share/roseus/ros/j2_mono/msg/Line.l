;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Line)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Line (find-package "J2_MONO")))
(unless (find-package "J2_MONO::LINE")
  (make-package "J2_MONO::LINE"))

(in-package "ROS")
;;//! \htmlinclude Line.msg.html


(defclass j2_mono::Line
  :super ros::object
  :slots (_id _life_time _coeffs _end_points _type _source _dist_to_front_wheel _width _type_sibling _conf _sigma_coeffs ))

(defmethod j2_mono::Line
  (:init
   (&key
    ((:id __id) 0)
    ((:life_time __life_time) 0)
    ((:coeffs __coeffs) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:end_points __end_points) (let (r) (dotimes (i 0) (push (instance j2_mono::Point :init) r)) r))
    ((:type __type) 0)
    ((:source __source) 0)
    ((:dist_to_front_wheel __dist_to_front_wheel) 0.0)
    ((:width __width) 0.0)
    ((:type_sibling __type_sibling) 0)
    ((:conf __conf) 0.0)
    ((:sigma_coeffs __sigma_coeffs) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _life_time (round __life_time))
   (setq _coeffs __coeffs)
   (setq _end_points __end_points)
   (setq _type (round __type))
   (setq _source (round __source))
   (setq _dist_to_front_wheel (float __dist_to_front_wheel))
   (setq _width (float __width))
   (setq _type_sibling (round __type_sibling))
   (setq _conf (float __conf))
   (setq _sigma_coeffs __sigma_coeffs)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:life_time
   (&optional __life_time)
   (if __life_time (setq _life_time __life_time)) _life_time)
  (:coeffs
   (&optional __coeffs)
   (if __coeffs (setq _coeffs __coeffs)) _coeffs)
  (:end_points
   (&rest __end_points)
   (if (keywordp (car __end_points))
       (send* _end_points __end_points)
     (progn
       (if __end_points (setq _end_points (car __end_points)))
       _end_points)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:source
   (&optional __source)
   (if __source (setq _source __source)) _source)
  (:dist_to_front_wheel
   (&optional __dist_to_front_wheel)
   (if __dist_to_front_wheel (setq _dist_to_front_wheel __dist_to_front_wheel)) _dist_to_front_wheel)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:type_sibling
   (&optional __type_sibling)
   (if __type_sibling (setq _type_sibling __type_sibling)) _type_sibling)
  (:conf
   (&optional __conf)
   (if __conf (setq _conf __conf)) _conf)
  (:sigma_coeffs
   (&optional __sigma_coeffs)
   (if __sigma_coeffs (setq _sigma_coeffs __sigma_coeffs)) _sigma_coeffs)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int32 _life_time
    4
    ;; float32[] _coeffs
    (* 4    (length _coeffs)) 4
    ;; j2_mono/Point[] _end_points
    (apply #'+ (send-all _end_points :serialization-length)) 4
    ;; int32 _type
    4
    ;; int32 _source
    4
    ;; float32 _dist_to_front_wheel
    4
    ;; float32 _width
    4
    ;; int32 _type_sibling
    4
    ;; float32 _conf
    4
    ;; float32[] _sigma_coeffs
    (* 4    (length _sigma_coeffs)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int32 _life_time
       (write-long _life_time s)
     ;; float32[] _coeffs
     (write-long (length _coeffs) s)
     (dotimes (i (length _coeffs))
       (sys::poke (elt _coeffs i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; j2_mono/Point[] _end_points
     (write-long (length _end_points) s)
     (dolist (elem _end_points)
       (send elem :serialize s)
       )
     ;; int32 _type
       (write-long _type s)
     ;; int32 _source
       (write-long _source s)
     ;; float32 _dist_to_front_wheel
       (sys::poke _dist_to_front_wheel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _type_sibling
       (write-long _type_sibling s)
     ;; float32 _conf
       (sys::poke _conf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _sigma_coeffs
     (write-long (length _sigma_coeffs) s)
     (dotimes (i (length _sigma_coeffs))
       (sys::poke (elt _sigma_coeffs i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _life_time
     (setq _life_time (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[] _coeffs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coeffs (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _coeffs i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; j2_mono/Point[] _end_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _end_points (let (r) (dotimes (i n) (push (instance j2_mono::Point :init) r)) r))
     (dolist (elem- _end_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _source
     (setq _source (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _dist_to_front_wheel
     (setq _dist_to_front_wheel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _type_sibling
     (setq _type_sibling (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _conf
     (setq _conf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _sigma_coeffs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sigma_coeffs (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sigma_coeffs i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get j2_mono::Line :md5sum-) "5f428496e74b1f87cdeb56e87ec4d4bf")
(setf (get j2_mono::Line :datatype-) "j2_mono/Line")
(setf (get j2_mono::Line :definition-)
      "int32 id
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



(provide :j2_mono/Line "5f428496e74b1f87cdeb56e87ec4d4bf")


