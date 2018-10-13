Cloud9 v3 in docker on Raspberry Pi
=============

This is a fork from [BarryWilliams](https://github.com/BarryWilliams/cloud9-docker-arm).

# Base Docker Image
[armv7/armhf-ubuntu:14.10](https://hub.docker.com/r/armv7/armhf-ubuntu/)

# Docker Hub Image
[stockmind/cloud9-docker-arm](https://hub.docker.com/r/stockmind/cloud9-docker-arm)

# Installation

## Install Docker
Follow [Hypriot's Blog]() to install docker on a Raspberry Pi

## Run it

```
docker run -it -d -p 8080:80 -p 80:8080 stockmind/cloud9-docker-arm
```    
You can also provide auth credentials
```    
docker run -d -p 80:8080 -e AUTH=user:pass stockmind/cloud9-docker-arm
``` 
And the collab flag
```    
docker run -d -p 80:8080 -e COLLAB=true stockmind/cloud9-docker-arm
```

You can add a workspace as a volume directory with the argument `-v /your-path/workspace/:/workspace/` like this :
```
docker run -it -d -p 80:8080 -v /your-path/workspace/:/workspace/ stockmind/cloud9-docker-arm
``` 

You can also add a git repository to let the container download it for you during set up of workspace
```    
docker run -d -p 80:8080 -e GITCLONE=https://url.to/git/repo.git stockmind/cloud9-docker-arm
```

## Use It

Navigate to your raspberry pi: `http://<your pi's address>`

## Build It

Clone the latest repo on a Raspberry Pi with Docker.
```
git clone https://github.com/stockmind/cloud9-docker-arm
```

Build it
```
docker build cloud9-docker-arm/ --force-rm=true --tag="$USER/cloud9-docker-arm:latest" .
```   
And run
```
docker run -d -p 80:80 -v /your-path/workspace/:/workspace/ $USER/cloud9-docker-arm:latest
``` 
Enjoy !!    

### memo
#### make image
sudo docker build -t cloud9:1.0 .
#### make container
sudo docker run -it -d -p 8080:8080 -v workspace:/workspace/  cloud9:1.0

