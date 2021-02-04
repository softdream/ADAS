; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude OBBox2D.msg.html

(cl:defclass <OBBox2D> (roslisp-msg-protocol:ros-message)
  ((corner
    :reader corner
    :initarg :corner
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (axes_pts
    :reader axes_pts
    :initarg :axes_pts
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (size
    :reader size
    :initarg :size
    :type cl:float
    :initform 0.0))
)

(cl:defclass OBBox2D (<OBBox2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OBBox2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OBBox2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<OBBox2D> is deprecated: use j2_mono-msg:OBBox2D instead.")))

(cl:ensure-generic-function 'corner-val :lambda-list '(m))
(cl:defmethod corner-val ((m <OBBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:corner-val is deprecated.  Use j2_mono-msg:corner instead.")
  (corner m))

(cl:ensure-generic-function 'axes_pts-val :lambda-list '(m))
(cl:defmethod axes_pts-val ((m <OBBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:axes_pts-val is deprecated.  Use j2_mono-msg:axes_pts instead.")
  (axes_pts m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <OBBox2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:size-val is deprecated.  Use j2_mono-msg:size instead.")
  (size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OBBox2D>) ostream)
  "Serializes a message object of type '<OBBox2D>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'corner) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'axes_pts) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'size))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OBBox2D>) istream)
  "Deserializes a message object of type '<OBBox2D>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'corner) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'axes_pts) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'size) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OBBox2D>)))
  "Returns string type for a message object of type '<OBBox2D>"
  "j2_mono/OBBox2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OBBox2D)))
  "Returns string type for a message object of type 'OBBox2D"
  "j2_mono/OBBox2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OBBox2D>)))
  "Returns md5sum for a message object of type '<OBBox2D>"
  "20845fd799692f5fd377b5118d47def7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OBBox2D)))
  "Returns md5sum for a message object of type 'OBBox2D"
  "20845fd799692f5fd377b5118d47def7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OBBox2D>)))
  "Returns full string definition for message of type '<OBBox2D>"
  (cl:format cl:nil "Point corner~%Point axes_pts~%float32 size~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OBBox2D)))
  "Returns full string definition for message of type 'OBBox2D"
  (cl:format cl:nil "Point corner~%Point axes_pts~%float32 size~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OBBox2D>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'corner))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'axes_pts))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OBBox2D>))
  "Converts a ROS message object to a list"
  (cl:list 'OBBox2D
    (cl:cons ':corner (corner msg))
    (cl:cons ':axes_pts (axes_pts msg))
    (cl:cons ':size (size msg))
))
