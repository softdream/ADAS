; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude Polygon.msg.html

(cl:defclass <Polygon> (roslisp-msg-protocol:ros-message)
  ((pts
    :reader pts
    :initarg :pts
    :type (cl:vector j2_mono-msg:Point)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Point :initial-element (cl:make-instance 'j2_mono-msg:Point))))
)

(cl:defclass Polygon (<Polygon>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Polygon>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Polygon)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<Polygon> is deprecated: use j2_mono-msg:Polygon instead.")))

(cl:ensure-generic-function 'pts-val :lambda-list '(m))
(cl:defmethod pts-val ((m <Polygon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:pts-val is deprecated.  Use j2_mono-msg:pts instead.")
  (pts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Polygon>) ostream)
  "Serializes a message object of type '<Polygon>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pts))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Polygon>) istream)
  "Deserializes a message object of type '<Polygon>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pts) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pts)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Polygon>)))
  "Returns string type for a message object of type '<Polygon>"
  "j2_mono/Polygon")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Polygon)))
  "Returns string type for a message object of type 'Polygon"
  "j2_mono/Polygon")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Polygon>)))
  "Returns md5sum for a message object of type '<Polygon>"
  "c9d7e166d449653c48720f55c89cbced")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Polygon)))
  "Returns md5sum for a message object of type 'Polygon"
  "c9d7e166d449653c48720f55c89cbced")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Polygon>)))
  "Returns full string definition for message of type '<Polygon>"
  (cl:format cl:nil "Point[] pts~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Polygon)))
  "Returns full string definition for message of type 'Polygon"
  (cl:format cl:nil "Point[] pts~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Polygon>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pts) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Polygon>))
  "Converts a ROS message object to a list"
  (cl:list 'Polygon
    (cl:cons ':pts (pts msg))
))
