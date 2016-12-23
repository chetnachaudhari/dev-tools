source ~/.bashrc;
cd ~/Repositories/Chetna/hive;
compile_hive;
cd ~/Repositories/Chetna/hive/packaging/target/apache-hive-*-bin/apache-hive-*-bin/bin;
cp ~/dev-tools/hive/conf/hive-site.xml ~/Repositories/Chetna/hive/packaging/target/apache-hive-*-bin/apache-hive-*-bin/conf/hive-site.xml;
cp ~/Downloads/mysql-connector-java-5.1.39/mysql-connector-java-5.1.39-bin.jar ~/Repositories/Chetna/hive/packaging/target/apache-hive-*-bin/apache-hive-*-bin/lib/;
./hive --service metastore &

