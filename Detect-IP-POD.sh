#!/bin/bash
#### detect IP Pod In Kubernetes
kubectl get pod  -A |awk '{print $1,$2}' >all-pod
sed -i '1d' all-pod
###
while  IFS= read -r  namespace pod
do
re1=`kubectl describe pod -n $namespace $pod |grep IP`
echo "-----------" >>pods-ip.txt
echo "$re1 " >>pods-ip.txt
echo "$namespace $pod" >>pods-ip.txt
echo "-----------" >>pods-ip.txt
done < "all-pod"
