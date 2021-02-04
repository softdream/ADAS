;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::ImageFail)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'ImageFail (find-package "J2_MONO")))
(unless (find-package "J2_MONO::IMAGEFAIL")
  (make-package "J2_MONO::IMAGEFAIL"))

(in-package "ROS")
;;//! \htmlinclude ImageFail.msg.html


(defclass j2_mono::ImageFail
  :super ros::object
  :slots (_cam_id _frame_id _fail_type _level _regions ))

(defmethod j2_mono::ImageFail
  (:init
   (&key
    ((:cam_id __cam_id) 0)
    ((:frame_id __frame_id) 0)
    ((:fail_type __fail_type) 0)
    ((:level __level) 0)
    ((:regions __regions) (let (r) (dotimes (i 0) (push (instance j2_mono::Polygon :init) r)) r))
    )
   (send-super :init)
   (setq _cam_id (round __cam_id))
   (setq _frame_id (round __frame_id))
   (setq _fail_type (round __fail_type))
   (setq _level (round __level))
   (setq _regions __regions)
   self)
  (:cam_id
   (&optional __cam_id)
   (if __cam_id (setq _cam_id __cam_id)) _cam_id)
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:fail_type
   (&optional __fail_type)
   (if __fail_type (setq _fail_type __fail_type)) _fail_type)
  (:level
   (&optional __level)
   (if __level (setq _level __level)) _level)
  (:regions
   (&rest __regions)
   (if (keywordp (car __regions))
       (send* _regions __regions)
     (progn
       (if __regions (setq _regions (car __regions)))
       _regions)))
  (:serialization-length
   ()
   (+
    ;; int32 _cam_id
    4
    ;; int32 _frame_id
    4
    ;; int32 _fail_type
    4
    ;; int32 _level
    4
    ;; j2_mono/Polygon[] _regions
    (apply #'+ (send-all _regions :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _cam_id
       (write-long _cam_id s)
     ;; int32 _frame_id
       (write-long _frame_id s)
     ;; int32 _fail_type
       (write-long _fail_type s)
     ;; int32 _level
       (write-long _level s)
     ;; j2_mono/Polygon[] _regions
     (write-long (length _regions) s)
     (dolist (elem _regions)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _cam_id
     (setq _cam_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _frame_id
     (setq _frame_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _fail_type
     (setq _fail_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _level
     (setq _level (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; j2_mono/Polygon[] _regions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _regions (let (r) (dotimes (i n) (push (instance j2_mono::Polygon :init) r)) r))
     (dolist (elem- _regions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get j2_mono::ImageFail :md5sum-) "b75b6afa1e707dc499267f7da2b60b6c")
(setf (get j2_mono::ImageFail :datatype-) "j2_mono/ImageFail")
(setf (get j2_mono::ImageFail :definition-)
      "int32 cam_id
int32 frame_id
int32 fail_type #IMG_NORMAL=0, IMG_BLUR=1, IMG_SHELTER=2, IMG_FREEZE=4, IMG_GLARE=8
int32 level #FAIL_NONE=0, FAIL_MILD=1, FAIL_MODERATE=2, FAIL_SEVERE=3
Polygon[] regions

================================================================================
MSG: j2_mono/Polygon
Point[] pts

================================================================================
MSG: j2_mono/Point
float32 x
float32 y
float32 z

")



(provide :j2_mono/ImageFail "b75b6afa1e707dc499267f7da2b60b6c")


