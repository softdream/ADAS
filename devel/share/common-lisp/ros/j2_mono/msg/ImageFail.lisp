; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude ImageFail.msg.html

(cl:defclass <ImageFail> (roslisp-msg-protocol:ros-message)
  ((cam_id
    :reader cam_id
    :initarg :cam_id
    :type cl:integer
    :initform 0)
   (frame_id
    :reader frame_id
    :initarg :frame_id
    :type cl:integer
    :initform 0)
   (fail_type
    :reader fail_type
    :initarg :fail_type
    :type cl:integer
    :initform 0)
   (level
    :reader level
    :initarg :level
    :type cl:integer
    :initform 0)
   (regions
    :reader regions
    :initarg :regions
    :type (cl:vector j2_mono-msg:Polygon)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Polygon :initial-element (cl:make-instance 'j2_mono-msg:Polygon))))
)

(cl:defclass ImageFail (<ImageFail>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImageFail>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImageFail)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<ImageFail> is deprecated: use j2_mono-msg:ImageFail instead.")))

(cl:ensure-generic-function 'cam_id-val :lambda-list '(m))
(cl:defmethod cam_id-val ((m <ImageFail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:cam_id-val is deprecated.  Use j2_mono-msg:cam_id instead.")
  (cam_id m))

(cl:ensure-generic-function 'frame_id-val :lambda-list '(m))
(cl:defmethod frame_id-val ((m <ImageFail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:frame_id-val is deprecated.  Use j2_mono-msg:frame_id instead.")
  (frame_id m))

(cl:ensure-generic-function 'fail_type-val :lambda-list '(m))
(cl:defmethod fail_type-val ((m <ImageFail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:fail_type-val is deprecated.  Use j2_mono-msg:fail_type instead.")
  (fail_type m))

(cl:ensure-generic-function 'level-val :lambda-list '(m))
(cl:defmethod level-val ((m <ImageFail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:level-val is deprecated.  Use j2_mono-msg:level instead.")
  (level m))

(cl:ensure-generic-function 'regions-val :lambda-list '(m))
(cl:defmethod regions-val ((m <ImageFail>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:regions-val is deprecated.  Use j2_mono-msg:regions instead.")
  (regions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImageFail>) ostream)
  "Serializes a message object of type '<ImageFail>"
  (cl:let* ((signed (cl:slot-value msg 'cam_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'frame_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fail_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'level)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'regions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'regions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImageFail>) istream)
  "Deserializes a message object of type '<ImageFail>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cam_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fail_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'level) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'regions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'regions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Polygon))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImageFail>)))
  "Returns string type for a message object of type '<ImageFail>"
  "j2_mono/ImageFail")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImageFail)))
  "Returns string type for a message object of type 'ImageFail"
  "j2_mono/ImageFail")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImageFail>)))
  "Returns md5sum for a message object of type '<ImageFail>"
  "b75b6afa1e707dc499267f7da2b60b6c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImageFail)))
  "Returns md5sum for a message object of type 'ImageFail"
  "b75b6afa1e707dc499267f7da2b60b6c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImageFail>)))
  "Returns full string definition for message of type '<ImageFail>"
  (cl:format cl:nil "int32 cam_id~%int32 frame_id~%int32 fail_type #IMG_NORMAL=0, IMG_BLUR=1, IMG_SHELTER=2, IMG_FREEZE=4, IMG_GLARE=8~%int32 level #FAIL_NONE=0, FAIL_MILD=1, FAIL_MODERATE=2, FAIL_SEVERE=3~%Polygon[] regions~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImageFail)))
  "Returns full string definition for message of type 'ImageFail"
  (cl:format cl:nil "int32 cam_id~%int32 frame_id~%int32 fail_type #IMG_NORMAL=0, IMG_BLUR=1, IMG_SHELTER=2, IMG_FREEZE=4, IMG_GLARE=8~%int32 level #FAIL_NONE=0, FAIL_MILD=1, FAIL_MODERATE=2, FAIL_SEVERE=3~%Polygon[] regions~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImageFail>))
  (cl:+ 0
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'regions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImageFail>))
  "Converts a ROS message object to a list"
  (cl:list 'ImageFail
    (cl:cons ':cam_id (cam_id msg))
    (cl:cons ':frame_id (frame_id msg))
    (cl:cons ':fail_type (fail_type msg))
    (cl:cons ':level (level msg))
    (cl:cons ':regions (regions msg))
))
