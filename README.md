ros-bridge
==========
This container is intended to run on demand containers, primarily to play `rosbags`

But is possibly to use it in other applications.

Usage
-----
This container look in the root for a *catkin_ws* and `source` it.

### Create a new catkin_ws
One way to storage a *catkin_ws* is create a ros data-container and initialize a workspace (later you are able to make backups of the data container)

```sh
docker run -v /catkin_ws --name ros-ckws-data ros:kinetic 
```

And then initialize the workspace in a new container:

```sh
docker run -it --volumes-from ros-ckws-data ros
```

### Run on demand containers
For example, you are able to play a rosbag, and then rosbridge will publish the topics

```sh
docker run -it --rm --volumes-from ros-ckws-data -v myRosbagFilesPath:/rosbag -w /rosbag rosbridge rosbag play -l whatever.bag
```
