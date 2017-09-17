
#!/bin/bash
ssh root@qingcheng11 "${ZOOKEEPER_HOME}/bin/zkServer.sh start"
ssh root@qingcheng12 "${ZOOKEEPER_HOME}/bin/zkServer.sh start"
ssh root@qingcheng13 "${ZOOKEEPER_HOME}/bin/zkServer.sh start"
ssh root@qingcheng11 "${ZOOKEEPER_HOME}/bin/zkServer.sh status"
ssh root@qingcheng12 "${ZOOKEEPER_HOME}/bin/zkServer.sh status"
ssh root@qingcheng13 "${ZOOKEEPER_HOME}/bin/zkServer.sh status"


ssh root@qingcheng11 "${HADOOP_HOME}/sbin/start-dfs.sh"

ssh root@qingcheng11 "${HADOOP_HOME}/sbin/hadoop-daemon.sh start zkfc"
ssh root@qingcheng11 "${HADOOP_HOME}/sbin/hadoop-daemon.sh  start  namenodeh"
ssh root@qingcheng12 "${HADOOP_HOME}/sbin/hadoop-daemon.sh start zkfc"
ssh root@qingcheng12 "${HADOOP_HOME}/sbin/hadoop-daemon.sh  start  namenodeh"

ssh root@qingcheng11 "${HADOOP_HOME}/sbin/start-yarn.sh"
ssh root@qingcheng12 "${HADOOP_HOME}/sbin/start-yarn.sh"
ssh root@qingcheng11 "${HADOOP_HOME}/sbin/mr-jobhistory-daemon.sh   start historyserver"

ssh root@qingcheng11 "${FLINK_HOME}/bin/start-cluster.sh"
ssh root@qingcheng11 "${FLINK_HOME}/bin/webclient.sh start"

ssh root@qingcheng11 "${SPARK_HOME}/sbin/start-all.sh"
ssh root@qingcheng12 "${SPARK_HOME}/sbin/start-master.sh"

ssh root@qingcheng11 "${ALLUXIO_HOME}/bin/alluxio format"
ssh root@qingcheng11 "${ALLUXIO_HOME}/bin/alluxio-start.sh all Mount"


ssh root@qingcheng11 "${KAFKA_HOME}/bin/kafka-server-start.sh ${KAFKA_HOME}/config/server.properties  > /dev/null 2>&1 &"
ssh root@qingcheng12 "${KAFKA_HOME}/bin/kafka-server-start.sh ${KAFKA_HOME}/config/server.properties  > /dev/null 2>&1 &"
ssh root@qingcheng13 "${KAFKA_HOME}/bin/kafka-server-start.sh ${KAFKA_HOME}/config/server.properties  > /dev/null 2>&1 &"

ssh root@qingcheng11 "$ZEPPELIN_HOME/bin/zeppelin-daemon.sh start"
ssh root@qingcheng11 "jps"
ssh root@qingcheng12 "jps"
ssh root@qingcheng13 "jps"
