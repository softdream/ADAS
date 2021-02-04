;; Auto-generated. Do not edit!


(when (boundp 'j2_mono::FreeSpacePoints)
  (if (not (find-package "J2_MONO"))
    (make-package "J2_MONO"))
  (shadow 'FreeSpacePoints (find-package "J2_MONO")))
(unless (find-package "J2_MONO::FREESPACEPOINTS")
  (make-package "J2_MONO::FREESPACEPOINTS"))

(in-package "ROS")
;;//! \htmlinclude FreeSpacePoints.msg.html


(defclass j2_mono::FreeSpacePoints
  :super ros::object
  :slots (_property _cam_id _pts_vcs _pts_img ))

(defmethod j2_mono::FreeSpacePoints
  (:init
   (&key
    ((:property __property) (make-array 0 :initial-element 0 :element-type :integer))
    ((:cam_id __cam_id) 0)
    ((:pts_vcs __pts_vcs) (let (r) (dotimes (i 0) (push (instance j2_mono::Point :init) r)) r))
    ((:pts_img __pts_img) (let (r) (dotimes (i 0) (push (instance j2_mono::Point :init) r)) r))
    )
   (send-super :init)
   (setq _property __property)
   (setq _cam_id (round __cam_id))
   (setq _pts_vcs __pts_vcs)
   (setq _pts_img __pts_img)
   self)
  (:property
   (&optional __property)
   (if __property (setq _property __property)) _property)
  (:cam_id
   (&optional __cam_id)
   (if __cam_id (setq _cam_id __cam_id)) _cam_id)
  (:pts_vcs
   (&rest __pts_vcs)
   (if (keywordp (car __pts_vcs))
       (send* _pts_vcs __pts_vcs)
     (progn
       (if __pts_vcs (setq _pts_vcs (car __pts_vcs)))
       _pts_vcs)))
  (:pts_img
   (&rest __pts_img)
   (if (keywordp (car __pts_img))
       (send* _pts_img __pts_img)
     (progn
       (if __pts_img (setq _pts_img (car __pts_img)))
       _pts_img)))
  (:serialization-length
   ()
   (+
    ;; int32[] _property
    (* 4    (length _property)) 4
    ;; int32 _cam_id
    4
    ;; j2_mono/Point[] _pts_vcs
    (apply #'+ (send-all _pts_vcs :serialization-length)) 4
    ;; j2_mono/Point[] _pts_img
    (apply #'+ (send-all _pts_img :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _property
     (write-long (length _property) s)
     (dotimes (i (length _property))
       (write-long (elt _property i) s)
       )
     ;; int32 _cam_id
       (write-long _cam_id s)
     ;; j2_mono/Point[] _pts_vcs
     (write-long (length _pts_vcs) s)
     (dolist (elem _pts_vcs)
       (send elem :serialize s)
       )
     ;; j2_mono/Point[] _pts_img
     (write-long (length _pts_img) s)
     (dolist (elem _pts_img)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _property
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _property (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _property i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32 _cam_id
     (setq _cam_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; j2_mono/Point[] _pts_vcs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pts_vcs (let (r) (dotimes (i n) (push (instance j2_mono::Point :init) r)) r))
     (dolist (elem- _pts_vcs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; j2_mono/Point[] _pts_img
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pts_img (let (r) (dotimes (i n) (push (instance j2_mono::Point :init) r)) r))
     (dolist (elem- _pts_img)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get j2_mono::FreeSpacePoints :md5sum-) "6fb2b5ce0fd42050cf9b73089f67f90e")
(setf (get j2_mono::FreeSpacePoints :datatype-) "j2_mono/FreeSpacePoints")
(setf (get j2_mono::FreeSpacePoints :definition-)
      "int32[] property
int32 cam_id
Point[] pts_vcs
Point[] pts_img

================================================================================
MSG: j2_mono/Point
float32 x
float32 y
float32 z

")



(provide :j2_mono/FreeSpacePoints "6fb2b5ce0fd42050cf9b73089f67f90e")


