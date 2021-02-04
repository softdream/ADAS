# Install script for directory: /home/zxy/ADASWork/catkin_ws/src/j2_mono

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/zxy/ADASWork/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/j2_mono/msg" TYPE FILE FILES
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Point.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/PointI.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Polygon.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Rect.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/OBBox2D.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Box3D.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Image.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/ImageFail.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Velocity.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Line.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Lines.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/WorldSpaceInfo.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/ImageSpaceInfo.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/canFrame.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/odometryFrame.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Obstacle.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Obstacles.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/FreeSpacePoints.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/StructurePerception.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Data.msg"
    "/home/zxy/ADASWork/catkin_ws/src/j2_mono/msg/Meta.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/j2_mono/cmake" TYPE FILE FILES "/home/zxy/ADASWork/catkin_ws/build/j2_mono/catkin_generated/installspace/j2_mono-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/zxy/ADASWork/catkin_ws/devel/include/j2_mono")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/zxy/ADASWork/catkin_ws/devel/share/roseus/ros/j2_mono")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/zxy/ADASWork/catkin_ws/devel/share/common-lisp/ros/j2_mono")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/zxy/ADASWork/catkin_ws/devel/share/gennodejs/ros/j2_mono")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/zxy/ADASWork/catkin_ws/devel/lib/python2.7/dist-packages/j2_mono")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/zxy/ADASWork/catkin_ws/devel/lib/python2.7/dist-packages/j2_mono")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/zxy/ADASWork/catkin_ws/build/j2_mono/catkin_generated/installspace/j2_mono.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/j2_mono/cmake" TYPE FILE FILES "/home/zxy/ADASWork/catkin_ws/build/j2_mono/catkin_generated/installspace/j2_mono-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/j2_mono/cmake" TYPE FILE FILES
    "/home/zxy/ADASWork/catkin_ws/build/j2_mono/catkin_generated/installspace/j2_monoConfig.cmake"
    "/home/zxy/ADASWork/catkin_ws/build/j2_mono/catkin_generated/installspace/j2_monoConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/j2_mono" TYPE FILE FILES "/home/zxy/ADASWork/catkin_ws/src/j2_mono/package.xml")
endif()

