# Monitoring and alerting project
Miscellaneous projects related to DevOps

Project details
1. Create a local monitioring and alerting environment
2. Components: Prometheus(monitoring), grafana(visualization), alertmanager(alerting)
3. Test "inhibit rules" to suppress child alerts. Eg: if CPU_utilization > 90% then CPU_utilization > 70% should not fire

   
Prerequisites 
1. Install the following on your local system
   a. docker
   b. docker-compose

Steps to setup docker environment:
1. mkdir monitoring_project && cd monitoring_project
2. Clone this repo 

    Changes to be made
    File alertmanager/alertmanager/yml
      1. lines 3,4 -> add sender_email (Try using gmail.com emails)
      2. line 5 -> sender_password
      3. line 30 -> receiver_email (Try using gmail.com emails)


2. run "docker-compose up -d"
3. Important urls :
   1. prometheus : http://localhost:9000
   2. grafana : http://localhost:3000
   3. alertmanager : http://localhost:9093


Steps to increase CPU utilization on node exporter container
1. "docker ps" -> copy the container-id for node exporter
2. "docker exec -it <container-id> sh" -> to get the shell for node exporter container
3. "dd if=/dev/zero of=/dev/null" -> manual convert and copy files
4. Take a new terminal tab
5. "docker stats" -> to check CPU utilization of all containers (check node-exporter)

