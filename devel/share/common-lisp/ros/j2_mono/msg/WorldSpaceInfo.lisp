; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude WorldSpaceInfo.msg.html

(cl:defclass <WorldSpaceInfo> (roslisp-msg-protocol:ros-message)
  ((yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (vel
    :reader vel
    :initarg :vel
    :type j2_mono-msg:Velocity
    :initform (cl:make-instance 'j2_mono-msg:Velocity))
   (length
    :reader length
    :initarg :length
    :type cl:float
    :initform 0.0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0)
   (poly
    :reader poly
    :initarg :poly
    :type j2_mono-msg:Polygon
    :initform (cl:make-instance 'j2_mono-msg:Polygon))
   (position
    :reader position
    :initarg :position
    :type j2_mono-msg:Point
    :initform (cl:make-instance 'j2_mono-msg:Point))
   (traversable
    :reader traversable
    :initarg :traversable
    :type cl:integer
    :initform 0)
   (hmw
    :reader hmw
    :initarg :hmw
    :type cl:float
    :initform 0.0)
   (ttc
    :reader ttc
    :initarg :ttc
    :type cl:float
    :initform 0.0)
   (curr_lane
    :reader curr_lane
    :initarg :curr_lane
    :type cl:integer
    :initform 0)
   (sigma_yaw
    :reader sigma_yaw
    :initarg :sigma_yaw
    :type cl:float
    :initform 0.0)
   (sigma_vel
    :reader sigma_vel
    :initarg :sigma_vel
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (sigma_width
    :reader sigma_width
    :initarg :sigma_width
    :type cl:float
    :initform 0.0)
   (sigma_height
    :reader sigma_height
    :initarg :sigma_height
    :type cl:float
    :initform 0.0)
   (sigma_position
    :reader sigma_position
    :initarg :sigma_position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass WorldSpaceInfo (<WorldSpaceInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WorldSpaceInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WorldSpaceInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<WorldSpaceInfo> is deprecated: use j2_mono-msg:WorldSpaceInfo instead.")))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:yaw-val is deprecated.  Use j2_mono-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'vel-val :lambda-list '(m))
(cl:defmethod vel-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:vel-val is deprecated.  Use j2_mono-msg:vel instead.")
  (vel m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:length-val is deprecated.  Use j2_mono-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:width-val is deprecated.  Use j2_mono-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:height-val is deprecated.  Use j2_mono-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'poly-val :lambda-list '(m))
(cl:defmethod poly-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:poly-val is deprecated.  Use j2_mono-msg:poly instead.")
  (poly m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:position-val is deprecated.  Use j2_mono-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'traversable-val :lambda-list '(m))
(cl:defmethod traversable-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:traversable-val is deprecated.  Use j2_mono-msg:traversable instead.")
  (traversable m))

(cl:ensure-generic-function 'hmw-val :lambda-list '(m))
(cl:defmethod hmw-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:hmw-val is deprecated.  Use j2_mono-msg:hmw instead.")
  (hmw m))

(cl:ensure-generic-function 'ttc-val :lambda-list '(m))
(cl:defmethod ttc-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:ttc-val is deprecated.  Use j2_mono-msg:ttc instead.")
  (ttc m))

(cl:ensure-generic-function 'curr_lane-val :lambda-list '(m))
(cl:defmethod curr_lane-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:curr_lane-val is deprecated.  Use j2_mono-msg:curr_lane instead.")
  (curr_lane m))

(cl:ensure-generic-function 'sigma_yaw-val :lambda-list '(m))
(cl:defmethod sigma_yaw-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:sigma_yaw-val is deprecated.  Use j2_mono-msg:sigma_yaw instead.")
  (sigma_yaw m))

(cl:ensure-generic-function 'sigma_vel-val :lambda-list '(m))
(cl:defmethod sigma_vel-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:sigma_vel-val is deprecated.  Use j2_mono-msg:sigma_vel instead.")
  (sigma_vel m))

(cl:ensure-generic-function 'sigma_width-val :lambda-list '(m))
(cl:defmethod sigma_width-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:sigma_width-val is deprecated.  Use j2_mono-msg:sigma_width instead.")
  (sigma_width m))

(cl:ensure-generic-function 'sigma_height-val :lambda-list '(m))
(cl:defmethod sigma_height-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:sigma_height-val is deprecated.  Use j2_mono-msg:sigma_height instead.")
  (sigma_height m))

(cl:ensure-generic-function 'sigma_position-val :lambda-list '(m))
(cl:defmethod sigma_position-val ((m <WorldSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:sigma_position-val is deprecated.  Use j2_mono-msg:sigma_position instead.")
  (sigma_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WorldSpaceInfo>) ostream)
  "Serializes a message object of type '<WorldSpaceInfo>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'vel) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'length))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'poly) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:let* ((signed (cl:slot-value msg 'traversable)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'hmw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ttc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'curr_lane)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sigma_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sigma_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'sigma_vel))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sigma_width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sigma_height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sigma_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'sigma_position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WorldSpaceInfo>) istream)
  "Deserializes a message object of type '<WorldSpaceInfo>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'vel) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'length) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'poly) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'traversable) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hmw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ttc) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'curr_lane) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sigma_yaw) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sigma_vel) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sigma_vel)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sigma_width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sigma_height) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sigma_position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sigma_position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WorldSpaceInfo>)))
  "Returns string type for a message object of type '<WorldSpaceInfo>"
  "j2_mono/WorldSpaceInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WorldSpaceInfo)))
  "Returns string type for a message object of type 'WorldSpaceInfo"
  "j2_mono/WorldSpaceInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WorldSpaceInfo>)))
  "Returns md5sum for a message object of type '<WorldSpaceInfo>"
  "06b0dcae51474264c1f32cddd4cb2623")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WorldSpaceInfo)))
  "Returns md5sum for a message object of type 'WorldSpaceInfo"
  "06b0dcae51474264c1f32cddd4cb2623")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WorldSpaceInfo>)))
  "Returns full string definition for message of type '<WorldSpaceInfo>"
  (cl:format cl:nil "float32 yaw #rad~%Velocity vel #m/s relative velocity~%float32 length # real length of the obstacle in world coordinate~%float32 width # real width~%float32 height # real height~%Polygon poly # ~%Point position # real position of the obstacle in world coordinate~%int32 traversable~%float32 hmw~%float32 ttc~%int32 curr_lane~%float32 sigma_yaw~%float32[] sigma_vel~%float32 sigma_width~%float32 sigma_height~%float32[] sigma_position~%~%~%================================================================================~%MSG: j2_mono/Velocity~%float32 vx~%float32 vy~%float32 vz~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WorldSpaceInfo)))
  "Returns full string definition for message of type 'WorldSpaceInfo"
  (cl:format cl:nil "float32 yaw #rad~%Velocity vel #m/s relative velocity~%float32 length # real length of the obstacle in world coordinate~%float32 width # real width~%float32 height # real height~%Polygon poly # ~%Point position # real position of the obstacle in world coordinate~%int32 traversable~%float32 hmw~%float32 ttc~%int32 curr_lane~%float32 sigma_yaw~%float32[] sigma_vel~%float32 sigma_width~%float32 sigma_height~%float32[] sigma_position~%~%~%================================================================================~%MSG: j2_mono/Velocity~%float32 vx~%float32 vy~%float32 vz~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WorldSpaceInfo>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'vel))
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'poly))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     4
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sigma_vel) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sigma_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WorldSpaceInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'WorldSpaceInfo
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':vel (vel msg))
    (cl:cons ':length (length msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':poly (poly msg))
    (cl:cons ':position (position msg))
    (cl:cons ':traversable (traversable msg))
    (cl:cons ':hmw (hmw msg))
    (cl:cons ':ttc (ttc msg))
    (cl:cons ':curr_lane (curr_lane msg))
    (cl:cons ':sigma_yaw (sigma_yaw msg))
    (cl:cons ':sigma_vel (sigma_vel msg))
    (cl:cons ':sigma_width (sigma_width msg))
    (cl:cons ':sigma_height (sigma_height msg))
    (cl:cons ':sigma_position (sigma_position msg))
))
