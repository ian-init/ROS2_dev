cmake_minimum_required(VERSION 3.8)
project(<!-- Replace with the actual workspace name -->)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

add_executable(<!-- give a name for the executable --> src/<!-- node name.cpp -->)
ament_target_dependencies(<!-- executable name --> rclcpp std_msgs)

install(TARGETS 
  <!-- executable name -->
  DESTINATION lib/${PROJECT_NAME})

ament_package()