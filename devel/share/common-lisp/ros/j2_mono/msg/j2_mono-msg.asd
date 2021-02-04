
(cl:in-package :asdf)

(defsystem "j2_mono-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Box3D" :depends-on ("_package_Box3D"))
    (:file "_package_Box3D" :depends-on ("_package"))
    (:file "Contour" :depends-on ("_package_Contour"))
    (:file "_package_Contour" :depends-on ("_package"))
    (:file "Data" :depends-on ("_package_Data"))
    (:file "_package_Data" :depends-on ("_package"))
    (:file "FreeSpacePoints" :depends-on ("_package_FreeSpacePoints"))
    (:file "_package_FreeSpacePoints" :depends-on ("_package"))
    (:file "Image" :depends-on ("_package_Image"))
    (:file "_package_Image" :depends-on ("_package"))
    (:file "ImageFail" :depends-on ("_package_ImageFail"))
    (:file "_package_ImageFail" :depends-on ("_package"))
    (:file "ImageSpaceInfo" :depends-on ("_package_ImageSpaceInfo"))
    (:file "_package_ImageSpaceInfo" :depends-on ("_package"))
    (:file "Line" :depends-on ("_package_Line"))
    (:file "_package_Line" :depends-on ("_package"))
    (:file "Lines" :depends-on ("_package_Lines"))
    (:file "_package_Lines" :depends-on ("_package"))
    (:file "Meta" :depends-on ("_package_Meta"))
    (:file "_package_Meta" :depends-on ("_package"))
    (:file "OBBox2D" :depends-on ("_package_OBBox2D"))
    (:file "_package_OBBox2D" :depends-on ("_package"))
    (:file "Obstacle" :depends-on ("_package_Obstacle"))
    (:file "_package_Obstacle" :depends-on ("_package"))
    (:file "Obstacles" :depends-on ("_package_Obstacles"))
    (:file "_package_Obstacles" :depends-on ("_package"))
    (:file "Point" :depends-on ("_package_Point"))
    (:file "_package_Point" :depends-on ("_package"))
    (:file "PointI" :depends-on ("_package_PointI"))
    (:file "_package_PointI" :depends-on ("_package"))
    (:file "Polygon" :depends-on ("_package_Polygon"))
    (:file "_package_Polygon" :depends-on ("_package"))
    (:file "Rect" :depends-on ("_package_Rect"))
    (:file "_package_Rect" :depends-on ("_package"))
    (:file "StructurePerception" :depends-on ("_package_StructurePerception"))
    (:file "_package_StructurePerception" :depends-on ("_package"))
    (:file "Velocity" :depends-on ("_package_Velocity"))
    (:file "_package_Velocity" :depends-on ("_package"))
    (:file "WorldSpaceInfo" :depends-on ("_package_WorldSpaceInfo"))
    (:file "_package_WorldSpaceInfo" :depends-on ("_package"))
    (:file "canFrame" :depends-on ("_package_canFrame"))
    (:file "_package_canFrame" :depends-on ("_package"))
    (:file "odometryFrame" :depends-on ("_package_odometryFrame"))
    (:file "_package_odometryFrame" :depends-on ("_package"))
  ))