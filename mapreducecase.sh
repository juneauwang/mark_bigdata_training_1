#!/bin/sh
#This script is created by Mark
#This script contains 
#1. Start dfs services
#2. List files in specific folder in HDFS
#3. Put file on local file system to HDFS 
#4. Run a specific task to proceed specific file
#5. Display result
#6. Delete result
displayHelp(){
	echo "usage:./mapreducecase.sh [local file path] [HDFS folder path] [MapReduce method]"
	

}

if [ $# -lt 1 ];
then
	displayHelp
else
	cd /home/hadoop/hadoop-3.1.1/
	sbin/start-dfs.sh
	bin/hdfs dfs -ls $2/input
	bin/hdfs dfs -put $1 $2
	bin/hdfs dfs -ls $2/input
	bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.1.jar $3 $2/input $2/output
	bin/hdfs dfs -cat $2/output/*
	bin/hdfs dfs -rm -r $2/output
fi 