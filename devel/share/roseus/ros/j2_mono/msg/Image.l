;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::Image)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'Image (find-package "J2_MONO")))
(unless (find-package "J2_MONO::IMAGE")
  (make-package "J2_MONO::IMAGE"))

(in-package "ROS")
;;//! \htmlinclude Image.msg.html


(defclass j2_mono::Image
  :super ros::object
  :slots (_width _height _channel _time_stamp _send_mode _format _index _count _depth _align _image_counter ))

(defmethod j2_mono::Image
  (:init
   (&key
    ((:width __width) 0)
    ((:height __height) 0)
    ((:channel __channel) 0)
    ((:time_stamp __time_stamp) 0)
    ((:send_mode __send_mode) 0)
    ((:format __format) 0)
    ((:index __index) 0)
    ((:count __count) 0)
    ((:depth __depth) 0)
    ((:align __align) 0)
    ((:image_counter __image_counter) 0)
    )
   (send-super :init)
   (setq _width (round __width))
   (setq _height (round __height))
   (setq _channel (round __channel))
   (setq _time_stamp (round __time_stamp))
   (setq _send_mode (round __send_mode))
   (setq _format (round __format))
   (setq _index (round __index))
   (setq _count (round __count))
   (setq _depth (round __depth))
   (setq _align (round __align))
   (setq _image_counter (round __image_counter))
   self)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:channel
   (&optional __channel)
   (if __channel (setq _channel __channel)) _channel)
  (:time_stamp
   (&optional __time_stamp)
   (if __time_stamp (setq _time_stamp __time_stamp)) _time_stamp)
  (:send_mode
   (&optional __send_mode)
   (if __send_mode (setq _send_mode __send_mode)) _send_mode)
  (:format
   (&optional __format)
   (if __format (setq _format __format)) _format)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:align
   (&optional __align)
   (if __align (setq _align __align)) _align)
  (:image_counter
   (&optional __image_counter)
   (if __image_counter (setq _image_counter __image_counter)) _image_counter)
  (:serialization-length
   ()
   (+
    ;; int32 _width
    4
    ;; int32 _height
    4
    ;; int32 _channel
    4
    ;; int64 _time_stamp
    8
    ;; int32 _send_mode
    4
    ;; int32 _format
    4
    ;; int32 _index
    4
    ;; int32 _count
    4
    ;; int32 _depth
    4
    ;; int32 _align
    4
    ;; int32 _image_counter
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _width
       (write-long _width s)
     ;; int32 _height
       (write-long _height s)
     ;; int32 _channel
       (write-long _channel s)
     ;; int64 _time_stamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _time_stamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _time_stamp) (= (length (_time_stamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_time_stamp . bv) 0) 0) s)
              (write-long (ash (elt (_time_stamp . bv) 1) -1) s))
             ((and (class _time_stamp) (= (length (_time_stamp . bv)) 1)) ;; big1
              (write-long (elt (_time_stamp . bv) 0) s)
              (write-long (if (>= _time_stamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _time_stamp s)(write-long (if (>= _time_stamp 0) 0 #xffffffff) s)))
     ;; int32 _send_mode
       (write-long _send_mode s)
     ;; int32 _format
       (write-long _format s)
     ;; int32 _index
       (write-long _index s)
     ;; int32 _count
       (write-long _count s)
     ;; int32 _depth
       (write-long _depth s)
     ;; int32 _align
       (write-long _align s)
     ;; int32 _image_counter
       (write-long _image_counter s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _channel
     (setq _channel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int64 _time_stamp
#+(or :alpha :irix6 :x86_64)
      (setf _time_stamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _time_stamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int32 _send_mode
     (setq _send_mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _format
     (setq _format (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _index
     (setq _index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _count
     (setq _count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _depth
     (setq _depth (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _align
     (setq _align (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _image_counter
     (setq _image_counter (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get j2_mono::Image :md5sum-) "5423f0f8301d9093d1931c3f216d2abd")
(setf (get j2_mono::Image :datatype-) "j2_mono/Image")
(setf (get j2_mono::Image :definition-)
      "int32 width
int32 height
int32 channel
int64 time_stamp
int32 send_mode
int32 format
int32 index
int32 count
int32 depth
int32 align
int32 image_counter

")



(provide :j2_mono/Image "5423f0f8301d9093d1931c3f216d2abd")


