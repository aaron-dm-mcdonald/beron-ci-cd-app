# OSS-grafana-k8s-cluster

This is the updated k8s infrastructure for self hosted (OSS) grafana. 

## Fix Documentation 

Detailed log of troubleshooting cluster and grafana are available:  
https://docs.google.com/document/d/1Bhf5o4lgJKNc3V1W72eeMnChGItycjzxT2G1YftoUBM/edit

Grafana Documentation: https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/

Theo's Documentation: https://docs.google.com/document/d/1whVdpWic21cgoSkyMRdFnS72AZtlHPV8/edit?pli=1


## Features
1) Variables for zone and project. Interpolation is used throughout so there is only point to enter project IDs. 
2) local exec for connecting to cluster assuming you initalized gcloud prior to deploying terraform infrastructure 
3) Local logs for the k8s and cluster config
4) grafana yaml config broken into logical segments 
5) persistent disk for PV
6) node pool machine type is moved to N2 gen for acceptable performance 

## Grafana Config Steps
1) ensure gcloud is initalized 
2) Deploy Terraform infrastructure 
3) Ensure local-exec connects to cluster
4) verify connectivity 
5) create namespace: kubectl create namespace my-grafana
6) verify namespace: kubectl get namespace my-grafana
7) configure PV (no namespace needed): kubectl apply -f grafana/pv.yaml  
8) kubectl apply -f grafana/pvc.yaml --namespace=my-grafana
9) kubectl apply -f grafana/deployment.yaml --namespace=my-grafana
10) kubectl apply -f grafana/svc.yaml --namespace=my-grafana
11) kubectl get all --namespace=my-grafana
12) await for external IP on loadbalancer service. Append port 3000 to IP to open UI in web browser. 