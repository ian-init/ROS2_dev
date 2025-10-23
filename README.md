<!DOCTYPE html>
<html lang="en">
<body>
    <h1>ROS2 Nodes Architecture</h1>
    
    <p>This repo aims to develop the basic ROS2 nodes architecture</p>
    
    <h2>Folder Structure:</h2>
    
    <pre>
&lt;workspace_name&gt;/
├── src/
│   ├── &lt;executable_name&gt;.cpp &lt;!-- each .cpp is a node--&gt;
│   ├── &lt;executable_name&gt;.cpp
│   ├── &lt;executable_name&gt;.cpp
│   ├── &lt;executable_name&gt;.cpp
│   ├── &lt;executable_name&gt;.cpp
│   └── ...
├── launch/
│   └── launch.py # Optional: Launch file to start all nodes
├── CMakeLists.txt # CMake configuration file
└── package.xml # Package configuration file
    </pre>
    
    <h2>Flow:</h2>
    
    <pre>
source /opt/ros/jazzy/setup.bash && \ &lt;!-- The path is set in Docker config, we can skip this --&gt;
mkdir -p ~/&lt;workspace_name&gt;/src && \ &lt;!-- create folders as needed and then create the necessary files --&gt;
cd ~/&lt;workspace_name&gt;
nano create publish.cpp, ...CMakeLists.txt, package.xml

cd ~/&lt;workspace_name&gt; && colcon build && \ &lt;!-- build the workspace at the workspace root folder --&gt;
source install/setup.bash && \ &lt;!-- initializes the workspace environment --&gt;
ros2 run &lt;workspace_name&gt; &lt;executable_name&gt; &lt;!-- execute the node--&gt;
    </pre>
    
</body>
</html>