;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::canFrame)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'canFrame (find-package "J2_MONO")))
(unless (find-package "J2_MONO::CANFRAME")
  (make-package "J2_MONO::CANFRAME"))

(in-package "ROS")
;;//! \htmlinclude canFrame.msg.html


(defclass j2_mono::canFrame
  :super ros::object
  :slots (_vehSpeed _vehSpeed_time_stamp _wheelAngle _wheelAngle_time_stamp _gearType _gearType_time_stamp _turnSignal _turnSignal_time_stamp _acc _yaw _yaw_rate _imu_time_stamp ))

(defmethod j2_mono::canFrame
  (:init
   (&key
    ((:vehSpeed __vehSpeed) 0)
    ((:vehSpeed_time_stamp __vehSpeed_time_stamp) 0)
    ((:wheelAngle __wheelAngle) 0)
    ((:wheelAngle_time_stamp __wheelAngle_time_stamp) 0)
    ((:gearType __gearType) 0)
    ((:gearType_time_stamp __gearType_time_stamp) 0)
    ((:turnSignal __turnSignal) 0)
    ((:turnSignal_time_stamp __turnSignal_time_stamp) 0)
    ((:acc __acc) 0.0)
    ((:yaw __yaw) 0.0)
    ((:yaw_rate __yaw_rate) 0.0)
    ((:imu_time_stamp __imu_time_stamp) 0)
    )
   (send-super :init)
   (setq _vehSpeed (round __vehSpeed))
   (setq _vehSpeed_time_stamp (round __vehSpeed_time_stamp))
   (setq _wheelAngle (round __wheelAngle))
   (setq _wheelAngle_time_stamp (round __wheelAngle_time_stamp))
   (setq _gearType (round __gearType))
   (setq _gearType_time_stamp (round __gearType_time_stamp))
   (setq _turnSignal (round __turnSignal))
   (setq _turnSignal_time_stamp (round __turnSignal_time_stamp))
   (setq _acc (float __acc))
   (setq _yaw (float __yaw))
   (setq _yaw_rate (float __yaw_rate))
   (setq _imu_time_stamp (round __imu_time_stamp))
   self)
  (:vehSpeed
   (&optional __vehSpeed)
   (if __vehSpeed (setq _vehSpeed __vehSpeed)) _vehSpeed)
  (:vehSpeed_time_stamp
   (&optional __vehSpeed_time_stamp)
   (if __vehSpeed_time_stamp (setq _vehSpeed_time_stamp __vehSpeed_time_stamp)) _vehSpeed_time_stamp)
  (:wheelAngle
   (&optional __wheelAngle)
   (if __wheelAngle (setq _wheelAngle __wheelAngle)) _wheelAngle)
  (:wheelAngle_time_stamp
   (&optional __wheelAngle_time_stamp)
   (if __wheelAngle_time_stamp (setq _wheelAngle_time_stamp __wheelAngle_time_stamp)) _wheelAngle_time_stamp)
  (:gearType
   (&optional __gearType)
   (if __gearType (setq _gearType __gearType)) _gearType)
  (:gearType_time_stamp
   (&optional __gearType_time_stamp)
   (if __gearType_time_stamp (setq _gearType_time_stamp __gearType_time_stamp)) _gearType_time_stamp)
  (:turnSignal
   (&optional __turnSignal)
   (if __turnSignal (setq _turnSignal __turnSignal)) _turnSignal)
  (:turnSignal_time_stamp
   (&optional __turnSignal_time_stamp)
   (if __turnSignal_time_stamp (setq _turnSignal_time_stamp __turnSignal_time_stamp)) _turnSignal_time_stamp)
  (:acc
   (&optional __acc)
   (if __acc (setq _acc __acc)) _acc)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:yaw_rate
   (&optional __yaw_rate)
   (if __yaw_rate (setq _yaw_rate __yaw_rate)) _yaw_rate)
  (:imu_time_stamp
   (&optional __imu_time_stamp)
   (if __imu_time_stamp (setq _imu_time_stamp __imu_time_stamp)) _imu_time_stamp)
  (:serialization-length
   ()
   (+
    ;; int64 _vehSpeed
    8
    ;; int64 _vehSpeed_time_stamp
    8
    ;; int64 _wheelAngle
    8
    ;; int64 _wheelAngle_time_stamp
    8
    ;; int64 _gearType
    8
    ;; int64 _gearType_time_stamp
    8
    ;; int64 _turnSignal
    8
    ;; int64 _turnSignal_time_stamp
    8
    ;; float32 _acc
    4
    ;; float32 _yaw
    4
    ;; float32 _yaw_rate
    4
    ;; int64 _imu_time_stamp
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _vehSpeed
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _vehSpeed (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _vehSpeed) (= (length (_vehSpeed . bv)) 2)) ;; bignum
              (write-long (ash (elt (_vehSpeed . bv) 0) 0) s)
              (write-long (ash (elt (_vehSpeed . bv) 1) -1) s))
             ((and (class _vehSpeed) (= (length (_vehSpeed . bv)) 1)) ;; big1
              (write-long (elt (_vehSpeed . bv) 0) s)
              (write-long (if (>= _vehSpeed 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _vehSpeed s)(write-long (if (>= _vehSpeed 0) 0 #xffffffff) s)))
     ;; int64 _vehSpeed_time_stamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _vehSpeed_time_stamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _vehSpeed_time_stamp) (= (length (_vehSpeed_time_stamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_vehSpeed_time_stamp . bv) 0) 0) s)
              (write-long (ash (elt (_vehSpeed_time_stamp . bv) 1) -1) s))
             ((and (class _vehSpeed_time_stamp) (= (length (_vehSpeed_time_stamp . bv)) 1)) ;; big1
              (write-long (elt (_vehSpeed_time_stamp . bv) 0) s)
              (write-long (if (>= _vehSpeed_time_stamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _vehSpeed_time_stamp s)(write-long (if (>= _vehSpeed_time_stamp 0) 0 #xffffffff) s)))
     ;; int64 _wheelAngle
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _wheelAngle (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _wheelAngle) (= (length (_wheelAngle . bv)) 2)) ;; bignum
              (write-long (ash (elt (_wheelAngle . bv) 0) 0) s)
              (write-long (ash (elt (_wheelAngle . bv) 1) -1) s))
             ((and (class _wheelAngle) (= (length (_wheelAngle . bv)) 1)) ;; big1
              (write-long (elt (_wheelAngle . bv) 0) s)
              (write-long (if (>= _wheelAngle 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _wheelAngle s)(write-long (if (>= _wheelAngle 0) 0 #xffffffff) s)))
     ;; int64 _wheelAngle_time_stamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _wheelAngle_time_stamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _wheelAngle_time_stamp) (= (length (_wheelAngle_time_stamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_wheelAngle_time_stamp . bv) 0) 0) s)
              (write-long (ash (elt (_wheelAngle_time_stamp . bv) 1) -1) s))
             ((and (class _wheelAngle_time_stamp) (= (length (_wheelAngle_time_stamp . bv)) 1)) ;; big1
              (write-long (elt (_wheelAngle_time_stamp . bv) 0) s)
              (write-long (if (>= _wheelAngle_time_stamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _wheelAngle_time_stamp s)(write-long (if (>= _wheelAngle_time_stamp 0) 0 #xffffffff) s)))
     ;; int64 _gearType
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _gearType (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _gearType) (= (length (_gearType . bv)) 2)) ;; bignum
              (write-long (ash (elt (_gearType . bv) 0) 0) s)
              (write-long (ash (elt (_gearType . bv) 1) -1) s))
             ((and (class _gearType) (= (length (_gearType . bv)) 1)) ;; big1
              (write-long (elt (_gearType . bv) 0) s)
              (write-long (if (>= _gearType 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _gearType s)(write-long (if (>= _gearType 0) 0 #xffffffff) s)))
     ;; int64 _gearType_time_stamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _gearType_time_stamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _gearType_time_stamp) (= (length (_gearType_time_stamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_gearType_time_stamp . bv) 0) 0) s)
              (write-long (ash (elt (_gearType_time_stamp . bv) 1) -1) s))
             ((and (class _gearType_time_stamp) (= (length (_gearType_time_stamp . bv)) 1)) ;; big1
              (write-long (elt (_gearType_time_stamp . bv) 0) s)
              (write-long (if (>= _gearType_time_stamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _gearType_time_stamp s)(write-long (if (>= _gearType_time_stamp 0) 0 #xffffffff) s)))
     ;; int64 _turnSignal
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _turnSignal (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _turnSignal) (= (length (_turnSignal . bv)) 2)) ;; bignum
              (write-long (ash (elt (_turnSignal . bv) 0) 0) s)
              (write-long (ash (elt (_turnSignal . bv) 1) -1) s))
             ((and (class _turnSignal) (= (length (_turnSignal . bv)) 1)) ;; big1
              (write-long (elt (_turnSignal . bv) 0) s)
              (write-long (if (>= _turnSignal 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _turnSignal s)(write-long (if (>= _turnSignal 0) 0 #xffffffff) s)))
     ;; int64 _turnSignal_time_stamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _turnSignal_time_stamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _turnSignal_time_stamp) (= (length (_turnSignal_time_stamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_turnSignal_time_stamp . bv) 0) 0) s)
              (write-long (ash (elt (_turnSignal_time_stamp . bv) 1) -1) s))
             ((and (class _turnSignal_time_stamp) (= (length (_turnSignal_time_stamp . bv)) 1)) ;; big1
              (write-long (elt (_turnSignal_time_stamp . bv) 0) s)
              (write-long (if (>= _turnSignal_time_stamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _turnSignal_time_stamp s)(write-long (if (>= _turnSignal_time_stamp 0) 0 #xffffffff) s)))
     ;; float32 _acc
       (sys::poke _acc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_rate
       (sys::poke _yaw_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int64 _imu_time_stamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _imu_time_stamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _imu_time_stamp) (= (length (_imu_time_stamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_imu_time_stamp . bv) 0) 0) s)
              (write-long (ash (elt (_imu_time_stamp . bv) 1) -1) s))
             ((and (class _imu_time_stamp) (= (length (_imu_time_stamp . bv)) 1)) ;; big1
              (write-long (elt (_imu_time_stamp . bv) 0) s)
              (write-long (if (>= _imu_time_stamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _imu_time_stamp s)(write-long (if (>= _imu_time_stamp 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _vehSpeed
#+(or :alpha :irix6 :x86_64)
      (setf _vehSpeed (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _vehSpeed (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _vehSpeed_time_stamp
#+(or :alpha :irix6 :x86_64)
      (setf _vehSpeed_time_stamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _vehSpeed_time_stamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _wheelAngle
#+(or :alpha :irix6 :x86_64)
      (setf _wheelAngle (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _wheelAngle (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _wheelAngle_time_stamp
#+(or :alpha :irix6 :x86_64)
      (setf _wheelAngle_time_stamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _wheelAngle_time_stamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _gearType
#+(or :alpha :irix6 :x86_64)
      (setf _gearType (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _gearType (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _gearType_time_stamp
#+(or :alpha :irix6 :x86_64)
      (setf _gearType_time_stamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _gearType_time_stamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _turnSignal
#+(or :alpha :irix6 :x86_64)
      (setf _turnSignal (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _turnSignal (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _turnSignal_time_stamp
#+(or :alpha :irix6 :x86_64)
      (setf _turnSignal_time_stamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _turnSignal_time_stamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float32 _acc
     (setq _acc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_rate
     (setq _yaw_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int64 _imu_time_stamp
#+(or :alpha :irix6 :x86_64)
      (setf _imu_time_stamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _imu_time_stamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get j2_mono::canFrame :md5sum-) "2ba765f4fa3356008013509c4cc271e6")
(setf (get j2_mono::canFrame :datatype-) "j2_mono/canFrame")
(setf (get j2_mono::canFrame :definition-)
      "int64 vehSpeed # km/h 
int64 vehSpeed_time_stamp
int64 wheelAngle # rad
int64 wheelAngle_time_stamp
int64 gearType  # GEAR_TYPE_N = 0, GEAR_TYPE_P = 1, GEAR_TYPE_R = 2, GEAR_TYPE_D = 3
int64 gearType_time_stamp
int64 turnSignal # TURN_SIGNAL_NONE = 0, TURN_SIGNAL_LEFT = 1, TURN_SIGNAL_RIGHT = 2, TURN_SIGNAL_DOUBLE = 3
int64 turnSignal_time_stamp
float32 acc # m/s^2
float32 yaw
float32 yaw_rate # rad/s
int64 imu_time_stamp

")



(provide :j2_mono/canFrame "2ba765f4fa3356008013509c4cc271e6")


