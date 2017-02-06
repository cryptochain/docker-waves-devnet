# Docker container for Waves Testnet node 

This Docker image will install the latest release version of Waves Testnet node upon building. 


## Building the image

### Prerequisites 

You need the latest version of Docker installed.

Please, follow installation istructions at [Docker Site](https://docs.docker.com/engine/installation/).

### Building the image

In order to build a new Docker image execute the following commands:


Clone the project's repository:

```
git clone https://github.com/wavesplatform/docker-waves-testnet.git
```

Get into project's directory:

```
cd docker-waves-testnet
```

Build an image with the following command:

```
docker build -t waves-testnet .

```

### Running the image

List your Docker's images:

```
docker images
```

To start a new Docker container, please, execute:

```
docker run --name waves-testnet waves-testnet

```

This image defines a storage volume in folder `/waves`. This folder is persisted on host drive. So, your node configuration and downloaded blockchain will survive the container restart. You can find the location of this volume on a host computer using `docker inspect` command.

Alternatively you can map the volume on a host folder using option `-v` as in:

```
docker run --name waves-testnet -v /home/user/local-waves-folder:/waves waves-testnet
```

To start and stop the container use Docker commands `docker start waves-testnet` and `docker stop waves-testnet`.