# base image
FROM ubuntu

# 1. Set locale and clean up (single RUN command)
RUN apt-get update && \
    apt-get install -y locales software-properties-common lsb-release gnupg curl && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    add-apt-repository universe

# 2. Add ROS2 repo (no major change needed here)
RUN apt-get update && apt-get install curl -y && \
    export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}') && \
    curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb" && \
    apt-get install /tmp/ros2-apt-source.deb

# 3. Install ROS and Gazebo (consolidated into a single RUN command with cleanup)
RUN apt-get update && \
    apt-get install ros-dev-tools -y --no-install-recommends && \
    apt-get install ros-jazzy-ros-base -y --no-install-recommends && \
    curl -fsSL https://packages.osrfoundation.org/gazebo.gpg \
      -o /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] https://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" \
      > /etc/apt/sources.list.d/gazebo-stable.list && \
    apt-get update && \
    apt-get install -y gz-harmonic && \
    rm -rf /var/lib/apt/lists/* # BEST PRACTICE: Clean up!

# 4. Add ROS2 to path for interactive shells
RUN echo 'source /opt/ros/jazzy/setup.bash' >> /root/.bashrc

# 5. Correctly set the default startup command (replaces the incorrect RUN ["/bin/bash"])
CMD ["/bin/bash"]