; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude Lines.msg.html

(cl:defclass <Lines> (roslisp-msg-protocol:ros-message)
  ((cam_id
    :reader cam_id
    :initarg :cam_id
    :type cl:integer
    :initform 0)
   (lines
    :reader lines
    :initarg :lines
    :type (cl:vector j2_mono-msg:Line)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Line :initial-element (cl:make-instance 'j2_mono-msg:Line))))
)

(cl:defclass Lines (<Lines>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Lines>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Lines)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<Lines> is deprecated: use j2_mono-msg:Lines instead.")))

(cl:ensure-generic-function 'cam_id-val :lambda-list '(m))
(cl:defmethod cam_id-val ((m <Lines>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:cam_id-val is deprecated.  Use j2_mono-msg:cam_id instead.")
  (cam_id m))

(cl:ensure-generic-function 'lines-val :lambda-list '(m))
(cl:defmethod lines-val ((m <Lines>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:lines-val is deprecated.  Use j2_mono-msg:lines instead.")
  (lines m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Lines>) ostream)
  "Serializes a message object of type '<Lines>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cam_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cam_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'cam_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'cam_id)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lines))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'lines))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Lines>) istream)
  "Deserializes a message object of type '<Lines>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cam_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cam_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'cam_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'cam_id)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lines) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lines)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Line))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Lines>)))
  "Returns string type for a message object of type '<Lines>"
  "j2_mono/Lines")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Lines)))
  "Returns string type for a message object of type 'Lines"
  "j2_mono/Lines")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Lines>)))
  "Returns md5sum for a message object of type '<Lines>"
  "81f65aa561ab98e1b11e8498fb81cb8c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Lines)))
  "Returns md5sum for a message object of type 'Lines"
  "81f65aa561ab98e1b11e8498fb81cb8c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Lines>)))
  "Returns full string definition for message of type '<Lines>"
  (cl:format cl:nil "uint32 cam_id~%Line[] lines~%~%================================================================================~%MSG: j2_mono/Line~%int32 id~%int32 life_time~%float32[] coeffs~%Point[] end_points~%int32 type #LINE_DOUBLE=512, LINE_DASH=1024, LINE_SOLID=2048~%int32 source #LINE_PERCEPTION=2097152, LINE_TRACKING=4194304~%float32 dist_to_front_wheel~%float32 width~%int32 type_sibling~%float32 conf~%float32[] sigma_coeffs~%~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Lines)))
  "Returns full string definition for message of type 'Lines"
  (cl:format cl:nil "uint32 cam_id~%Line[] lines~%~%================================================================================~%MSG: j2_mono/Line~%int32 id~%int32 life_time~%float32[] coeffs~%Point[] end_points~%int32 type #LINE_DOUBLE=512, LINE_DASH=1024, LINE_SOLID=2048~%int32 source #LINE_PERCEPTION=2097152, LINE_TRACKING=4194304~%float32 dist_to_front_wheel~%float32 width~%int32 type_sibling~%float32 conf~%float32[] sigma_coeffs~%~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Lines>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lines) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Lines>))
  "Converts a ROS message object to a list"
  (cl:list 'Lines
    (cl:cons ':cam_id (cam_id msg))
    (cl:cons ':lines (lines msg))
))
