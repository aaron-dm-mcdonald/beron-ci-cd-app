# OSS-grafana-k8s-cluster

This is the updated k8s infrastructure for self hosted (OSS) grafana. 

## Fix Documentation 

Detailed log of troubleshooting cluster and grafana are available:  
https://docs.google.com/document/d/1Bhf5o4lgJKNc3V1W72eeMnChGItycjzxT2G1YftoUBM/edit

Grafana Documentation: https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/

Kubernetes Persistent Volume and PVC Documentation: https://kubernetes.io/docs/concepts/storage/persistent-volumes/

PV's in context with GKE: https://devopscube.com/persistent-volume-google-kubernetes-engine/

Theo's Documentation: https://docs.google.com/document/d/1whVdpWic21cgoSkyMRdFnS72AZtlHPV8/edit?pli=1

## Clone Repo
- `git clone https://github.com/aaron-dm-mcdonald/OSS-grafana-k8s-cluster.git`

open directory in terminal or VS Code

## Features

1) Variables for zone, project, machine type. Interpolation is used throughout so there is only point to enter project IDs. 
2) local exec for connecting to cluster assuming you initalized gcloud prior to deploying terraform infrastructure 
3) Local logs for the k8s and cluster config produced by terraform during runtime
4) grafana config YAML is broken into logical segments 
5) persistent disk for PV is configured. A static PV will be used. 
6) node pool machine type is moved to N2 gen for acceptable performance 

## Grafana Config Steps

1) ensure gcloud is initalized 
2) Deploy Terraform infrastructure 
3) Ensure local-exec connects to cluster (check terminal for terraform console output)

4) (optional) Verify connectivity:
   - `kubectl cluster-info`
5) Create namespace:
   - `kubectl create namespace my-grafana`
6) Verify namespace:
   - `kubectl get namespace my-grafana`

7) **Configure Grafana**
   - `kubectl apply -f grafana/ --namespace=my-grafana`
   - `kubectl get all --namespace=my-grafana`

8) await for external IP on loadbalancer service. Append port 3000 to IP to open UI in web browser. 