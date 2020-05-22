# kubernetes-restart-operator
Sometimes some pods should be deleted time to time.This crontab will delete given workload pods on given cron.<br>
First create docker image<br>
docker build -t anilkuscu95/restarter .<br>
Lastly you should configure your specification on restart.yaml file.<br>
At the args section on the yaml file you should specify your deployment for restart timer.<br>
