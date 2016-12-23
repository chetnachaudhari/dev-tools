cd /usr/local/Cellar/mysql/5.7.11;
sudo ./bin/mysql.server start;
cd $HADOOP_HOME/bin;
hdfs namenode -format;
cd ../sbin/;
./start-dfs.sh;
./start-yarn.sh;
./mr-jobhistory-daemon.sh --config $HADOOP_CONF_DIR start historyserver ;
cd ~/Repositories/Chetna/hive/packaging/target/apache-hive-*-bin/apache-hive-*-bin/bin;
./hive --service metastore &
