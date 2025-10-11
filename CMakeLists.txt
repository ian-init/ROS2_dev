cmake_minimum_required(VERSION 3.8)
project(battery_publisher)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

add_executable(publish src/publish.cpp)
ament_target_dependencies(publish rclcpp std_msgs)

install(TARGETS publish
  DESTINATION lib/${PROJECT_NAME})

ament_package()