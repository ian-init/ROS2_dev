This repo aims to develop the basic ROS2 nodes architecture

Fodler struucture:

<workspace_name>/
├── src/
│   ├── <executable_name>.cpp <!-- each .cpp is a node-->
│   ├── <executable_name>.cpp
│   ├── <executable_name>.cpp
│   ├── <executable_name>.cpp
│   ├── <executable_name>.cpp
│   └── ...
├── launch/
│   └── launch.py # Optional: Launch file to start all nodes
├── CMakeLists.txt # CMake configuration file
└── package.xml # Package configuration file

Flow:
source /opt/ros/jazzy/setup.bash && \ <!-- The path is set in Docker config, we can skip this -->
mkdir -p ~/<workspace_name>/src && \ <!-- create folders as needed and then create the necessary files -->
cd ~/<workspace_name>
nano create publish.cpp, ...CMakeLists.txt, package.xml

cd ~/<workspace_name> && colcon build && \ <!-- build the workspace at the workspace root folder -->
source install/setup.bash && \ <!-- initializes the workspace environment -->
ros2 run <workspace_name> <executable_name> <!-- execute the node-->