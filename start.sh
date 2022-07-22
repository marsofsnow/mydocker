
mkdir –p ./data/elasticsearch/data
sudo chmod 777 ./data/elasticsearch/data

docker-compose up   elasticsearch zookeeper kafka     filebeat  go-stash  kibana    prometheus grafana  jaeger
#docker-compose up   zookeeper kafka
#docker-compose down    prometheus grafana  jaeger
#docker-compose up -d prometheus grafana  jaeger
docker-compose up  postgresql pgadmin4


# 在kafka中创建topic
#docker exec -it kafka /bin/sh
#cd /opt/kafka/bin/
#./kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 -partitions 1 --topic looklook-log
#find / -name \*kafka_\* | head -1 | grep -o '\kafka[^\n]*'
#kafka_2.13-2.8.1