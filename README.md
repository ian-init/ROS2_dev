<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ROS2 Nodes Architecture</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            line-height: 1.6;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            color: #24292e;
        }
        h1, h2 {
            border-bottom: 1px solid #eaecef;
            padding-bottom: 0.3em;
        }
        h1 {
            font-size: 2em;
            margin-bottom: 16px;
        }
        h2 {
            font-size: 1.5em;
            margin-top: 24px;
            margin-bottom: 16px;
        }
        pre {
            background-color: #f6f8fa;
            border-radius: 6px;
            padding: 16px;
            overflow: auto;
            font-family: 'Courier New', Consolas, Monaco, monospace;
            font-size: 14px;
            line-height: 1.45;
        }
        code {
            background-color: #f6f8fa;
            border-radius: 3px;
            padding: 2px 6px;
            font-family: 'Courier New', Consolas, Monaco, monospace;
            font-size: 85%;
        }
        pre code {
            background-color: transparent;
            padding: 0;
        }
    </style>
</head>
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