#!/bin/bash

HADOOP_FILE="/etc/hadoop/conf"

echo $HADOOP_FILE

sudo sed -i '/export HADOOP_HEAPSIZE/c\export HADOOP_HEAPSIZE="10240"' $HADOOP_FILE/hadoop-env.sh
sudo /etc/init.d/hive-metastore restart
#sudo /etc/init.d/hive-metastore status
#echo $HADOOP_OPTS 
sudo sed -i '/export HADOOP_HEAPSIZE/c\export HADOOP_HEAPSIZE="1024"' $HADOOP_FILE/hadoop-env.sh
