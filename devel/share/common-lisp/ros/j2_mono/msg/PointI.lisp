; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude PointI.msg.html

(cl:defclass <PointI> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (z
    :reader z
    :initarg :z
    :type cl:integer
    :initform 0))
)

(cl:defclass PointI (<PointI>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointI>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointI)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<PointI> is deprecated: use j2_mono-msg:PointI instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <PointI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:x-val is deprecated.  Use j2_mono-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <PointI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:y-val is deprecated.  Use j2_mono-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <PointI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:z-val is deprecated.  Use j2_mono-msg:z instead.")
  (z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointI>) ostream)
  "Serializes a message object of type '<PointI>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointI>) istream)
  "Deserializes a message object of type '<PointI>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'z) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointI>)))
  "Returns string type for a message object of type '<PointI>"
  "j2_mono/PointI")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointI)))
  "Returns string type for a message object of type 'PointI"
  "j2_mono/PointI")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointI>)))
  "Returns md5sum for a message object of type '<PointI>"
  "3cb41a2c4416de195dbb95b7777a06fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointI)))
  "Returns md5sum for a message object of type 'PointI"
  "3cb41a2c4416de195dbb95b7777a06fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointI>)))
  "Returns full string definition for message of type '<PointI>"
  (cl:format cl:nil "int32 x~%int32 y~%int32 z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointI)))
  "Returns full string definition for message of type 'PointI"
  (cl:format cl:nil "int32 x~%int32 y~%int32 z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointI>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointI>))
  "Converts a ROS message object to a list"
  (cl:list 'PointI
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
))
