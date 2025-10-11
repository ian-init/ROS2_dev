This repo aims to develop the basic ROS2 nodes architecture

Fodler struucture:

<workspace_name>/
├── src/
│   ├── <node1_name>.cpp
│   ├── <node2_name>.cpp
│   ├── <node3_name>.cpp
│   ├── <node4_name>.cpp
│   ├── <node5_name>.cpp
│   └── ...
├── launch/
│   └── launch.py # Launch file to start all nodes
├── CMakeLists.txt # CMake configuration file
└── package.xml # Package configuration file

Flow:
source /opt/ros/jazzy/setup.bash && \ ** kadsa <!-- The path is set in Docker config, we can skip this -->
mkdir -p ~/<workspace_name>/src && \
cd ~/<workspace_name>/src/ && \
# (create publish.cpp, CMakeLists.txt, package.xml) && \
cd ~/<workspace_name> && colcon build && \
source install/setup.bash && \
ros2 run <workspace_name> <executable_name>