Automated build of phpPgAdmin with Docker
=================

Pull From Docker Index
----------

    docker pull jacksoncage/phppgadmin-docker

Build It Yourself
----------

    git clone https://github.com/jacksoncage/phppgadmin-docker.git
    cd phppgadmin-docker
    docker build  -t <your username>/phppgadmin-docker .

Running phpPgAdmin
----------

Running the container
    docker run -d -p 80 <your username>/phppgadmin-docker
    
Get your container's IP Address and Port:

    docker inspect <container_id> | grep IPAddress | cut -d '"' -f 4
    docker port <container_id> 80 | cut -d ":" -f2

Now go to `<your container's ip>:<container's port>` in your browser