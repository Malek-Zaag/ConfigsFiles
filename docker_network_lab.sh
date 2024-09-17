# IPVlan L2
docker network create -d ipvlan --subnet=10.0.0.0/24 --gateway=10.0.0.4 -o parent=eth0 ipvlan


docker run --rm -itd --network ipvlan --name c1 alpine /bin/sh
docker run --rm -it --network ipvlan --name c2  alpine /bin/sh

----
# IPVlan L3
docker network create -d ipvlan --subnet=10.0.0.0/24 --subnet=10.1.214.0/24 -o ipvlan_mode=l3 ipvlan ipvlan
docker run --rm -itd --network ipvlan --ip=10.0.0.10 --name c1 alpine /bin/sh
docker run --rm -it --network ipvlan --ip=10.1.214.10 --name c2  alpine /bin/sh


docker run --net=ipnet210 --ip=192.168.214.9 -it --rm alpine ping -c 2 10.1.214.10
docker run --net=ipnet210 --ip=10.1.214.9 -it --rm alpine ping -c 2 192.168.214.10

----
# MACVlan
docker network create -d macvlan --subnet=10.0.0.0/24 --gateway=10.0.0.4 -o parent=eth0 macvlan
docker run --rm -itd --network macvlan --name c1 alpine /bin/sh
docker run --rm -it --network macvlan --name c2  alpine /bin/sh