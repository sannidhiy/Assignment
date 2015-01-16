#!bin/bash
echo "Enter service name:\n"
read service
echo "Enter operation-start/stop/restart\n"
read op
echo "Service: $service and operation: $op\n"

service $service status > file1.txt

res=`cat file1.txt | grep start | wc -l`

if [ $res -eq 1 ] && [ "$op" = "start" ]
then echo "\n$service is already running\n"
elif [ $res -eq 1 ] && [ "$op" = "stop" ]
then service $service $op
echo "Service $service stopped\n"
elif [ $res -eq 0 ] && [ "$op" = "start" ]
then service $service $op
echo "Service $service Started\n"
elif [ $res -eq 0 ] && [ "$op" = "stop" ]
then echo "Service $service already stopeed\n"
elif [ $res -ge 0 ] && [ "$op" = "restart" ]
then service $service $op
echo "Service $service Restarated\n"
else
echo "Please check the input"
fi
