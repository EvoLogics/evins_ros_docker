FROM ros:indigo
ADD ros_entrypoint.sh /
ADD .zsh* /root/
COPY hosts /root/hosts
COPY .zsh /root/.zsh
ADD .tmux.conf /root
ADD bashrc /root/.bashrc
RUN apt-get update \
 && apt-get install --force-yes -y zsh build-essential tmux nano bash-completion wget m4 curl\
 && apt-get install --force-yes -y ros-indigo-auv-msgs libeigen3-dev ros-indigo-tf ros-indigo-tf-conversions ros-indigo-image-transport\
 && easy_install --upgrade pytz \
 && apt-get install --force-yes -y ros-indigo-nmea-msgs libxslt1-dev ros-indigo-map-server ros-indigo-cv-bridge ros-indigo-filters libqt4-dev libudev-dev libgeographiclib-dev python-serial ros-indigo-laser-geometry ros-indigo-joy ros-indigo-qt-build libusb-dev libgusb2 libusb++-dev libusb-1.0-0-dev\
 && mkdir -p ~/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/indigo/setup.bash; catkin_init_workspace /root/catkin_ws/src'
RUN wget https://packages.erlang-solutions.com/erlang/debian/pool/esl-erlang_19.2-1~ubuntu~trusty_amd64.deb; dpkg -i esl-erlang_19.2-1~ubuntu~trusty_amd64.deb; rm esl-erlang_19.2-1~ubuntu~trusty_amd64.deb
WORKDIR /root/catkin_ws
RUN mkdir -p /root/catkin_ws/src/evins_nodes\
 && mkdir -p /root/catkin_ws/src/sim_nodes\
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["/bin/zsh"]
