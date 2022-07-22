#!/bin/bash

data_dir=~/docker-volumes
es_data_dir=$data_dir/elasticsearch/data
if [ ! -d "$data_dir" ]; then
        sudo mkdir -m 777 -p $data_dir
fi
if [ ! -d "$es_data_dir" ]; then
        sudo mkdir -m 777 -p $es_data_dir
fi


docker-compose up   elasticsearch  kibana  zookeeper kafka     filebeat  go-stash   prometheus grafana  jaeger redis
#docker-compose up   zookeeper kafka
#docker-compose down    prometheus grafana  jaeger
#docker-compose up -d prometheus grafana  jaeger
#docker-compose up  postgresql pgadmin4


# 在kafka中创建topic
#docker exec -it kafka /bin/sh
#cd /opt/kafka/bin/
#./kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 -partitions 1 --topic looklook-log
#find / -name \*kafka_\* | head -1 | grep -o '\kafka[^\n]*'
#kafka_2.13-2.8.1

#docker-compose start   elasticsearch  kibana  zookeeper kafka     filebeat  go-stash   prometheus grafana  jaeger