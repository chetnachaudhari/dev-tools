#!/bin/bash
cd /Users/chetna.chaudhari/Documents/hadoop-2.7.2;
bin/hdfs namenode -format
sbin/start-dfs.sh
sbin/start-yarn.sh
