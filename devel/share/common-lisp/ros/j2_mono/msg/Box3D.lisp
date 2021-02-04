; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude Box3D.msg.html

(cl:defclass <Box3D> (roslisp-msg-protocol:ros-message)
  ((lower_lt
    :reader lower_lt
    :initarg :lower_lt
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (lower_lb
    :reader lower_lb
    :initarg :lower_lb
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (lower_rb
    :reader lower_rb
    :initarg :lower_rb
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (lower_rt
    :reader lower_rt
    :initarg :lower_rt
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (upper_lt
    :reader upper_lt
    :initarg :upper_lt
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (upper_lb
    :reader upper_lb
    :initarg :upper_lb
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (upper_rb
    :reader upper_rb
    :initarg :upper_rb
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (upper_rt
    :reader upper_rt
    :initarg :upper_rt
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (conf
    :reader conf
    :initarg :conf
    :type cl:float
    :initform 0.0))
)

(cl:defclass Box3D (<Box3D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Box3D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Box3D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<Box3D> is deprecated: use j2_mono-msg:Box3D instead.")))

(cl:ensure-generic-function 'lower_lt-val :lambda-list '(m))
(cl:defmethod lower_lt-val ((m <Box3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:lower_lt-val is deprecated.  Use j2_mono-msg:lower_lt instead.")
  (lower_lt m))

(cl:ensure-generic-function 'lower_lb-val :lambda-list '(m))
(cl:defmethod lower_lb-val ((m <Box3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:lower_lb-val is deprecated.  Use j2_mono-msg:lower_lb instead.")
  (lower_lb m))

(cl:ensure-generic-function 'lower_rb-val :lambda-list '(m))
(cl:defmethod lower_rb-val ((m <Box3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:lower_rb-val is deprecated.  Use j2_mono-msg:lower_rb instead.")
  (lower_rb m))

(cl:ensure-generic-function 'lower_rt-val :lambda-list '(m))
(cl:defmethod lower_rt-val ((m <Box3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:lower_rt-val is deprecated.  Use j2_mono-msg:lower_rt instead.")
  (lower_rt m))

(cl:ensure-generic-function 'upper_lt-val :lambda-list '(m))
(cl:defmethod upper_lt-val ((m <Box3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:upper_lt-val is deprecated.  Use j2_mono-msg:upper_lt instead.")
  (upper_lt m))

(cl:ensure-generic-function 'upper_lb-val :lambda-list '(m))
(cl:defmethod upper_lb-val ((m <Box3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:upper_lb-val is deprecated.  Use j2_mono-msg:upper_lb instead.")
  (upper_lb m))

(cl:ensure-generic-function 'upper_rb-val :lambda-list '(m))
(cl:defmethod upper_rb-val ((m <Box3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:upper_rb-val is deprecated.  Use j2_mono-msg:upper_rb instead.")
  (upper_rb m))

(cl:ensure-generic-function 'upper_rt-val :lambda-list '(m))
(cl:defmethod upper_rt-val ((m <Box3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:upper_rt-val is deprecated.  Use j2_mono-msg:upper_rt instead.")
  (upper_rt m))

(cl:ensure-generic-function 'conf-val :lambda-list '(m))
(cl:defmethod conf-val ((m <Box3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:conf-val is deprecated.  Use j2_mono-msg:conf instead.")
  (conf m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Box3D>) ostream)
  "Serializes a message object of type '<Box3D>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'lower_lt) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'lower_lb) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'lower_rb) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'lower_rt) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'upper_lt) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'upper_lb) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'upper_rb) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'upper_rt) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'conf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Box3D>) istream)
  "Deserializes a message object of type '<Box3D>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'lower_lt) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'lower_lb) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'lower_rb) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'lower_rt) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'upper_lt) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'upper_lb) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'upper_rb) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'upper_rt) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'conf) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Box3D>)))
  "Returns string type for a message object of type '<Box3D>"
  "j2_mono/Box3D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Box3D)))
  "Returns string type for a message object of type 'Box3D"
  "j2_mono/Box3D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Box3D>)))
  "Returns md5sum for a message object of type '<Box3D>"
  "d2a4c3bc64f81e95d0c37d470dea3708")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Box3D)))
  "Returns md5sum for a message object of type 'Box3D"
  "d2a4c3bc64f81e95d0c37d470dea3708")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Box3D>)))
  "Returns full string definition for message of type '<Box3D>"
  (cl:format cl:nil "Point lower_lt~%Point lower_lb~%Point lower_rb~%Point lower_rt~%Point upper_lt~%Point upper_lb~%Point upper_rb~%Point upper_rt~%float32 conf~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Box3D)))
  "Returns full string definition for message of type 'Box3D"
  (cl:format cl:nil "Point lower_lt~%Point lower_lb~%Point lower_rb~%Point lower_rt~%Point upper_lt~%Point upper_lb~%Point upper_rb~%Point upper_rt~%float32 conf~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Box3D>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'lower_lt))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'lower_lb))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'lower_rb))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'lower_rt))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'upper_lt))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'upper_lb))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'upper_rb))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'upper_rt))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Box3D>))
  "Converts a ROS message object to a list"
  (cl:list 'Box3D
    (cl:cons ':lower_lt (lower_lt msg))
    (cl:cons ':lower_lb (lower_lb msg))
    (cl:cons ':lower_rb (lower_rb msg))
    (cl:cons ':lower_rt (lower_rt msg))
    (cl:cons ':upper_lt (upper_lt msg))
    (cl:cons ':upper_lb (upper_lb msg))
    (cl:cons ':upper_rb (upper_rb msg))
    (cl:cons ':upper_rt (upper_rt msg))
    (cl:cons ':conf (conf msg))
))
