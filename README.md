# Setup Environment

### Create directory for `project` related ROS modules (here: EVINS)
Replace `'path_to_ROS_WORKSPACE'` with the path to your ROS WORKSPACE (here: /opt/ros/evins):
```shell
export ROS_WORKSPACE=/opt/ros/evins
cd $ROS_WORKSPACE
mkdir -p src/evins_nodes
export EVINS_DIR=$ROS_WORKSPACE/src/evins_nodes
echo "export EVINS_DIR=$ROS_WORKSPACE/src/evins_nodes" >> ~/.bashrc
```

### Clone repositories
```shell
cd $EVINS_DIR
git clone --recursive git@github.com:evologics/evins_ros_docker
```

### Update `evins_ros_docker` repository

```shell
cd $EVINS_DIR/evins_ros_docker
git pull --recurse-submodules
git submodule update
```

# Install docker

1. ##### Recommended extra packages for Trusty 14.04
```shell
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r)
```

+ ##### Install packages to allow apt to use a repository over HTTPS:
```shell
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
```

+ ##### Add Docker’s official GPG key:
```shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```
+ ##### Install it:
```shell
sudo apt-get update
sudo apt-get install docker-ce
```
+ ##### Verify that Docker CE is installed correctly by running the `hello-world` image:
```shell
sudo docker run hello-world
```
+ ##### Create the docker group:
```shell
sudo groupadd docker
```

+ ##### Add your user to the `docker` group:
```shell
sudo usermod -aG docker $USER
```

+ ##### Log out and log back in so that your group membership is re-evaluated.

# Run EviNS Docker containers

## Build EviNS docker imange
```shell
cd $EVINS_DIR/evins_ros_docker/docker
docker build -t ros:evins .
```

## Open vpn (not in container)
On a different terminal:
```shell
cd `evologics_emulator`
sudo ./run-dmace-***.sh
password: *******
```

## Test container
Just to see if everything is ok
```shell
cd $EVINS_DIR/evins_ros_docker/docker
./run-generic-container test /bin/bash
exit
```

## Compile in container
```shell
./compile-container
```

## Run vehicle simulation in container
+ Dynamics simulation:
For each vehicle you must run (`'container_name'` must be the same for both):
+ EviNS architecture:
```shell
./run-sim-container 'ID' 'MISSION' 'ROLE'
```
where 'ID' is the simulated modem address, 'MISSION' is one of the mission
directories defined in $EVINS_DIR/evins_ros_docker/missions and 'ROLE' is
the top level launch file in the 'MISSIONS'/launch directory.

For example,
```shell
./run-evins-container 1 polling ship
```

## Run something in the running container
Replace `'container_name'` with the name of the container that you want to enter:
```shell
docker exec -i -t 'container_name' bash
```
