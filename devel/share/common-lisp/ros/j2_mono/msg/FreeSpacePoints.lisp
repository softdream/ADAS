; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude FreeSpacePoints.msg.html

(cl:defclass <FreeSpacePoints> (roslisp-msg-protocol:ros-message)
  ((property
    :reader property
    :initarg :property
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (cam_id
    :reader cam_id
    :initarg :cam_id
    :type cl:integer
    :initform 0)
   (pts_vcs
    :reader pts_vcs
    :initarg :pts_vcs
    :type (cl:vector j2_mono-msg:Point)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Point :initial-element (cl:make-instance 'j2_mono-msg:Point)))
   (pts_img
    :reader pts_img
    :initarg :pts_img
    :type (cl:vector j2_mono-msg:Point)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Point :initial-element (cl:make-instance 'j2_mono-msg:Point))))
)

(cl:defclass FreeSpacePoints (<FreeSpacePoints>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FreeSpacePoints>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FreeSpacePoints)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<FreeSpacePoints> is deprecated: use j2_mono-msg:FreeSpacePoints instead.")))

(cl:ensure-generic-function 'property-val :lambda-list '(m))
(cl:defmethod property-val ((m <FreeSpacePoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:property-val is deprecated.  Use j2_mono-msg:property instead.")
  (property m))

(cl:ensure-generic-function 'cam_id-val :lambda-list '(m))
(cl:defmethod cam_id-val ((m <FreeSpacePoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:cam_id-val is deprecated.  Use j2_mono-msg:cam_id instead.")
  (cam_id m))

(cl:ensure-generic-function 'pts_vcs-val :lambda-list '(m))
(cl:defmethod pts_vcs-val ((m <FreeSpacePoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:pts_vcs-val is deprecated.  Use j2_mono-msg:pts_vcs instead.")
  (pts_vcs m))

(cl:ensure-generic-function 'pts_img-val :lambda-list '(m))
(cl:defmethod pts_img-val ((m <FreeSpacePoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:pts_img-val is deprecated.  Use j2_mono-msg:pts_img instead.")
  (pts_img m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FreeSpacePoints>) ostream)
  "Serializes a message object of type '<FreeSpacePoints>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'property))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'property))
  (cl:let* ((signed (cl:slot-value msg 'cam_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pts_vcs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pts_vcs))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pts_img))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pts_img))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FreeSpacePoints>) istream)
  "Deserializes a message object of type '<FreeSpacePoints>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'property) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'property)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cam_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pts_vcs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pts_vcs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pts_img) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pts_img)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FreeSpacePoints>)))
  "Returns string type for a message object of type '<FreeSpacePoints>"
  "j2_mono/FreeSpacePoints")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FreeSpacePoints)))
  "Returns string type for a message object of type 'FreeSpacePoints"
  "j2_mono/FreeSpacePoints")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FreeSpacePoints>)))
  "Returns md5sum for a message object of type '<FreeSpacePoints>"
  "6fb2b5ce0fd42050cf9b73089f67f90e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FreeSpacePoints)))
  "Returns md5sum for a message object of type 'FreeSpacePoints"
  "6fb2b5ce0fd42050cf9b73089f67f90e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FreeSpacePoints>)))
  "Returns full string definition for message of type '<FreeSpacePoints>"
  (cl:format cl:nil "int32[] property~%int32 cam_id~%Point[] pts_vcs~%Point[] pts_img~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FreeSpacePoints)))
  "Returns full string definition for message of type 'FreeSpacePoints"
  (cl:format cl:nil "int32[] property~%int32 cam_id~%Point[] pts_vcs~%Point[] pts_img~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FreeSpacePoints>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'property) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pts_vcs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pts_img) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FreeSpacePoints>))
  "Converts a ROS message object to a list"
  (cl:list 'FreeSpacePoints
    (cl:cons ':property (property msg))
    (cl:cons ':cam_id (cam_id msg))
    (cl:cons ':pts_vcs (pts_vcs msg))
    (cl:cons ':pts_img (pts_img msg))
))
