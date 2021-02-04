; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude Line.msg.html

(cl:defclass <Line> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (life_time
    :reader life_time
    :initarg :life_time
    :type cl:integer
    :initform 0)
   (coeffs
    :reader coeffs
    :initarg :coeffs
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (end_points
    :reader end_points
    :initarg :end_points
    :type (cl:vector j2_mono-msg:Point)
   :initform (cl:make-array 0 :element-type 'j2_mono-msg:Point :initial-element (cl:make-instance 'j2_mono-msg:Point)))
   (type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0)
   (source
    :reader source
    :initarg :source
    :type cl:integer
    :initform 0)
   (dist_to_front_wheel
    :reader dist_to_front_wheel
    :initarg :dist_to_front_wheel
    :type cl:float
    :initform 0.0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (type_sibling
    :reader type_sibling
    :initarg :type_sibling
    :type cl:integer
    :initform 0)
   (conf
    :reader conf
    :initarg :conf
    :type cl:float
    :initform 0.0)
   (sigma_coeffs
    :reader sigma_coeffs
    :initarg :sigma_coeffs
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Line (<Line>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Line>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Line)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<Line> is deprecated: use j2_mono-msg:Line instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:id-val is deprecated.  Use j2_mono-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'life_time-val :lambda-list '(m))
(cl:defmethod life_time-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:life_time-val is deprecated.  Use j2_mono-msg:life_time instead.")
  (life_time m))

(cl:ensure-generic-function 'coeffs-val :lambda-list '(m))
(cl:defmethod coeffs-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:coeffs-val is deprecated.  Use j2_mono-msg:coeffs instead.")
  (coeffs m))

(cl:ensure-generic-function 'end_points-val :lambda-list '(m))
(cl:defmethod end_points-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:end_points-val is deprecated.  Use j2_mono-msg:end_points instead.")
  (end_points m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:type-val is deprecated.  Use j2_mono-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'source-val :lambda-list '(m))
(cl:defmethod source-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:source-val is deprecated.  Use j2_mono-msg:source instead.")
  (source m))

(cl:ensure-generic-function 'dist_to_front_wheel-val :lambda-list '(m))
(cl:defmethod dist_to_front_wheel-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:dist_to_front_wheel-val is deprecated.  Use j2_mono-msg:dist_to_front_wheel instead.")
  (dist_to_front_wheel m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:width-val is deprecated.  Use j2_mono-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'type_sibling-val :lambda-list '(m))
(cl:defmethod type_sibling-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:type_sibling-val is deprecated.  Use j2_mono-msg:type_sibling instead.")
  (type_sibling m))

(cl:ensure-generic-function 'conf-val :lambda-list '(m))
(cl:defmethod conf-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:conf-val is deprecated.  Use j2_mono-msg:conf instead.")
  (conf m))

(cl:ensure-generic-function 'sigma_coeffs-val :lambda-list '(m))
(cl:defmethod sigma_coeffs-val ((m <Line>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:sigma_coeffs-val is deprecated.  Use j2_mono-msg:sigma_coeffs instead.")
  (sigma_coeffs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Line>) ostream)
  "Serializes a message object of type '<Line>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'life_time)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'coeffs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'coeffs))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'end_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'end_points))
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'source)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dist_to_front_wheel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'type_sibling)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'conf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sigma_coeffs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'sigma_coeffs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Line>) istream)
  "Deserializes a message object of type '<Line>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'life_time) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'coeffs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'coeffs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'end_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'end_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'j2_mono-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'source) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dist_to_front_wheel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type_sibling) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'conf) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sigma_coeffs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sigma_coeffs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Line>)))
  "Returns string type for a message object of type '<Line>"
  "j2_mono/Line")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Line)))
  "Returns string type for a message object of type 'Line"
  "j2_mono/Line")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Line>)))
  "Returns md5sum for a message object of type '<Line>"
  "5f428496e74b1f87cdeb56e87ec4d4bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Line)))
  "Returns md5sum for a message object of type 'Line"
  "5f428496e74b1f87cdeb56e87ec4d4bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Line>)))
  "Returns full string definition for message of type '<Line>"
  (cl:format cl:nil "int32 id~%int32 life_time~%float32[] coeffs~%Point[] end_points~%int32 type #LINE_DOUBLE=512, LINE_DASH=1024, LINE_SOLID=2048~%int32 source #LINE_PERCEPTION=2097152, LINE_TRACKING=4194304~%float32 dist_to_front_wheel~%float32 width~%int32 type_sibling~%float32 conf~%float32[] sigma_coeffs~%~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Line)))
  "Returns full string definition for message of type 'Line"
  (cl:format cl:nil "int32 id~%int32 life_time~%float32[] coeffs~%Point[] end_points~%int32 type #LINE_DOUBLE=512, LINE_DASH=1024, LINE_SOLID=2048~%int32 source #LINE_PERCEPTION=2097152, LINE_TRACKING=4194304~%float32 dist_to_front_wheel~%float32 width~%int32 type_sibling~%float32 conf~%float32[] sigma_coeffs~%~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Line>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'coeffs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'end_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sigma_coeffs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Line>))
  "Converts a ROS message object to a list"
  (cl:list 'Line
    (cl:cons ':id (id msg))
    (cl:cons ':life_time (life_time msg))
    (cl:cons ':coeffs (coeffs msg))
    (cl:cons ':end_points (end_points msg))
    (cl:cons ':type (type msg))
    (cl:cons ':source (source msg))
    (cl:cons ':dist_to_front_wheel (dist_to_front_wheel msg))
    (cl:cons ':width (width msg))
    (cl:cons ':type_sibling (type_sibling msg))
    (cl:cons ':conf (conf msg))
    (cl:cons ':sigma_coeffs (sigma_coeffs msg))
))
