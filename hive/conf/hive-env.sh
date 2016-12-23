if [ "$SERVICE" = "hiveserver2" ]; then
  JMX_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=8008"
  export HADOOP_OPTS="$HADOOP_OPTS $JMX_OPTS"
  export HIVE_HEAP=512
  export HADOOP_HEAPSIZE=512
  export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Xmx${HIVE_HEAP}m"
  export HIVE_GC_OPTS=" -XX:+UseG1GC -XX:ParallelGCThreads=8 -XX:ConcGCThreads=8 -XX:+UseNUMA -XX:MaxGCPauseMillis=500 -XX:GCPauseIntervalMillis=8000 -XX:+UseThreadPriorities -XX:ThreadPriorityPolicy=42 -Xss256k -XX:StringTableSize=1000003 -XX:+UseTLAB -XX:+UseCondCardMark -XX:+UseFastAccessorMethods -XX:+AggressiveOpts -XX:+UseCompressedOops -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -Xloggc:/var/log/hive/hive-server2.gc.`date +%s`.log -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/log/hive/heapDump-`date +%s`.hprof -XX:+PrintGCApplicationConcurrentTime -XX:+PrintGCApplicationStoppedTime "
  export HADOOP_OPTS="$HADOOP_OPTS -Xmx${HIVE_HEAP}m ${HIVE_GC_OPTS}"
fi
if [ "$SERVICE" = "metastore" ]; then
  JMX_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=9008"
  export HADOOP_OPTS="$HADOOP_OPTS $JMX_OPTS"
  export HIVE_HEAP=512
  export HADOOP_HEAPSIZE=512
  export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Xmx${HIVE_HEAP}m"
  export HIVE_GC_OPTS="-XX:+UseG1GC -XX:ParallelGCThreads=8 -XX:ConcGCThreads=8 -XX:+UseNUMA -XX:MaxGCPauseMillis=1000 -XX:GCPauseIntervalMillis=8000 -XX:+UseThreadPriorities -XX:ThreadPriorityPolicy=42 -Xss256k -XX:StringTableSize=1000003 -XX:+UseTLAB -XX:+UseCondCardMark -XX:+UseFastAccessorMethods -XX:+AggressiveOpts -XX:+UseCompressedOops  -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -Xloggc:/var/log/hive/hive-metastore.gc.`date +%s`.log -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/log/hive/heapDump-metastore`date +%s`.hprof -XX:+PrintGCApplicationConcurrentTime -XX:+PrintGCApplicationStoppedTime -XX:+UnlockCommercialFeatures -XX:+FlightRecorder"

  export HADOOP_OPTS="$HADOOP_OPTS -Xmx${HIVE_HEAP}m ${HIVE_GC_OPTS}"
fi

if [ "$SERVICE" = "cli" ]; then
   if [ -z "$DEBUG" ]; then
     export HADOOP_OPTS="$HADOOP_OPTS -XX:NewRatio=12 -Xms10m -XX:MaxHeapFreeRatio=40 -XX:MinHeapFreeRatio=15 -XX:+UseParNewGC -XX:-UseGCOverheadLimit"
   else
     export HADOOP_OPTS="$HADOOP_OPTS -XX:NewRatio=12 -Xms10m -XX:MaxHeapFreeRatio=40 -XX:MinHeapFreeRatio=15 -XX:-UseGCOverheadLimit"
   fi
 fi
