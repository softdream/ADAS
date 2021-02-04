; Auto-generated. Do not edit!


(cl:in-package j2_mono-msg)


;//! \htmlinclude ImageSpaceInfo.msg.html

(cl:defclass <ImageSpaceInfo> (roslisp-msg-protocol:ros-message)
  ((rect
    :reader rect
    :initarg :rect
    :type j2_mono-msg:Rect
    :initform (cl:make-instance 'j2_mono-msg:Rect))
   (box
    :reader box
    :initarg :box
    :type j2_mono-msg:Box3D
    :initform (cl:make-instance 'j2_mono-msg:Box3D))
   (poly
    :reader poly
    :initarg :poly
    :type j2_mono-msg:Polygon
    :initform (cl:make-instance 'j2_mono-msg:Polygon))
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
   (sigma_x
    :reader sigma_x
    :initarg :sigma_x
    :type cl:float
    :initform 0.0)
   (sigma_y
    :reader sigma_y
    :initarg :sigma_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass ImageSpaceInfo (<ImageSpaceInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImageSpaceInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImageSpaceInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name j2_mono-msg:<ImageSpaceInfo> is deprecated: use j2_mono-msg:ImageSpaceInfo instead.")))

(cl:ensure-generic-function 'rect-val :lambda-list '(m))
(cl:defmethod rect-val ((m <ImageSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:rect-val is deprecated.  Use j2_mono-msg:rect instead.")
  (rect m))

(cl:ensure-generic-function 'box-val :lambda-list '(m))
(cl:defmethod box-val ((m <ImageSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:box-val is deprecated.  Use j2_mono-msg:box instead.")
  (box m))

(cl:ensure-generic-function 'poly-val :lambda-list '(m))
(cl:defmethod poly-val ((m <ImageSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:poly-val is deprecated.  Use j2_mono-msg:poly instead.")
  (poly m))

(cl:ensure-generic-function 'sigma_width-val :lambda-list '(m))
(cl:defmethod sigma_width-val ((m <ImageSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:sigma_width-val is deprecated.  Use j2_mono-msg:sigma_width instead.")
  (sigma_width m))

(cl:ensure-generic-function 'sigma_height-val :lambda-list '(m))
(cl:defmethod sigma_height-val ((m <ImageSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:sigma_height-val is deprecated.  Use j2_mono-msg:sigma_height instead.")
  (sigma_height m))

(cl:ensure-generic-function 'sigma_x-val :lambda-list '(m))
(cl:defmethod sigma_x-val ((m <ImageSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:sigma_x-val is deprecated.  Use j2_mono-msg:sigma_x instead.")
  (sigma_x m))

(cl:ensure-generic-function 'sigma_y-val :lambda-list '(m))
(cl:defmethod sigma_y-val ((m <ImageSpaceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader j2_mono-msg:sigma_y-val is deprecated.  Use j2_mono-msg:sigma_y instead.")
  (sigma_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImageSpaceInfo>) ostream)
  "Serializes a message object of type '<ImageSpaceInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rect) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'box) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'poly) ostream)
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sigma_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sigma_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImageSpaceInfo>) istream)
  "Deserializes a message object of type '<ImageSpaceInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rect) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'box) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'poly) istream)
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sigma_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sigma_y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImageSpaceInfo>)))
  "Returns string type for a message object of type '<ImageSpaceInfo>"
  "j2_mono/ImageSpaceInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImageSpaceInfo)))
  "Returns string type for a message object of type 'ImageSpaceInfo"
  "j2_mono/ImageSpaceInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImageSpaceInfo>)))
  "Returns md5sum for a message object of type '<ImageSpaceInfo>"
  "1fb215e492dbe974ebabb86f0056d4f6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImageSpaceInfo)))
  "Returns md5sum for a message object of type 'ImageSpaceInfo"
  "1fb215e492dbe974ebabb86f0056d4f6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImageSpaceInfo>)))
  "Returns full string definition for message of type '<ImageSpaceInfo>"
  (cl:format cl:nil "Rect rect~%Box3D box~%Polygon poly~%float32 sigma_width~%float32 sigma_height~%float32 sigma_x~%float32 sigma_y~%~%================================================================================~%MSG: j2_mono/Rect~%float32 left~%float32 top~%float32 right~%float32 bottom~%~%================================================================================~%MSG: j2_mono/Box3D~%Point lower_lt~%Point lower_lb~%Point lower_rb~%Point lower_rt~%Point upper_lt~%Point upper_lb~%Point upper_rb~%Point upper_rt~%float32 conf~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImageSpaceInfo)))
  "Returns full string definition for message of type 'ImageSpaceInfo"
  (cl:format cl:nil "Rect rect~%Box3D box~%Polygon poly~%float32 sigma_width~%float32 sigma_height~%float32 sigma_x~%float32 sigma_y~%~%================================================================================~%MSG: j2_mono/Rect~%float32 left~%float32 top~%float32 right~%float32 bottom~%~%================================================================================~%MSG: j2_mono/Box3D~%Point lower_lt~%Point lower_lb~%Point lower_rb~%Point lower_rt~%Point upper_lt~%Point upper_lb~%Point upper_rb~%Point upper_rt~%float32 conf~%~%================================================================================~%MSG: j2_mono/Point~%float32 x~%float32 y~%float32 z~%~%================================================================================~%MSG: j2_mono/Polygon~%Point[] pts~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImageSpaceInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rect))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'box))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'poly))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImageSpaceInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'ImageSpaceInfo
    (cl:cons ':rect (rect msg))
    (cl:cons ':box (box msg))
    (cl:cons ':poly (poly msg))
    (cl:cons ':sigma_width (sigma_width msg))
    (cl:cons ':sigma_height (sigma_height msg))
    (cl:cons ':sigma_x (sigma_x msg))
    (cl:cons ':sigma_y (sigma_y msg))
))
