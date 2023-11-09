#!/bin/bash

VOLT_NODES="-1"  # Value less than 0 means no volt VMs will be started. 
VOLT_MACHINE_TYPE="c5.9xlarge"
TEST_CLIENT="-2" 
TEST_CLIENT_TYPE="c5.xlarge"
MONITOR_SERVER="fasle"
USER_TAG="kajal"
GET_IPs="true"
if [[ $VOLT_NODES -gt 0 ]]; then
    echo "Starting $VOLT_NODES Volt Nodes"

    for ((i = 1; i <= VOLT_NODES; i++)); do
        aws ec2 run-instances \
            --image-id ami-0c99fa4f13bd55e59 \
            --instance-type $VOLT_MACHINE_TYPE \
            --key-name kj-mac \
            --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"Iops":3000,"VolumeSize":100,"VolumeType":"gp3","Throughput":500}}]' \
            --network-interfaces '[
              {"AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-24416645"]}
            ]' \
            --tag-specifications '[
              {"ResourceType":"instance","Tags":[{"Key":"User","Value":"'$USER_TAG'"},{"Key":"Name","Value":"volt-'$i'"}]}
            ]' \
            --placement GroupId=pg-03f273642e53541a3 \
            --private-dns-name-options HostnameType=ip-name,EnableResourceNameDnsARecord=true,EnableResourceNameDnsAAAARecord=false
        echo "Creating Volt Node $i"
    done

else 
    echo "Not Starting Volt Nodes" 
fi

if [[ $TEST_CLIENT -gt 0 ]]; then
    echo "Starting $TEST_CLIENT test client nodes."

    for ((i = 1; i <= TEST_CLIENT; i++)); do
        aws ec2 run-instances \
             --image-id ami-03832dc9fc520fc0a \
             --instance-type $TEST_CLIENT_TYPE \
             --key-name kj-mac \
             --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"Iops":3000,"VolumeSize":50,"VolumeType":"gp3","Throughput":500}}]' \
             --network-interfaces '[{"AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-24416645"]}]' \
             --tag-specifications '[
               {"ResourceType":"instance","Tags":[{"Key":"Name","Value":"test-'$i'"},{"Key":"user","Value":"'$USER_TAG'"}]}
             ]' \
             --private-dns-name-options HostnameType=ip-name,EnableResourceNameDnsARecord=true,EnableResourceNameDnsAAAARecord=false
        echo "Creating Test Client $i"
    done

else 
    echo "Not Starting Test Client Nodes" 
fi

MONITOR_SERVER_LOWER=$(echo "$MONITOR_SERVER" | tr '[:upper:]' '[:lower:]')

if [[ $MONITOR_SERVER_LOWER == "true" ]]; then
    echo "Starting Monitoring Server Node"
    aws ec2 run-instances \
  --image-id ami-046c9ce4b2015d5ac \
  --instance-type t3.medium \
  --key-name kj-mac \
  --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"Iops":3000,"SnapshotId":"snap-0a157782d9d57550b","VolumeSize":20,"VolumeType":"gp3","Throughput":500}}]' \
  --network-interfaces '[{"AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-24416645"]}]' \
  --tag-specifications '[
    {"ResourceType":"instance","Tags":[{"Key":"Name","Value":"monitoring-server"},{"Key":"User","Value":"'$USER_TAG'"}]}
  ]' \
  --private-dns-name-options HostnameType=ip-name,EnableResourceNameDnsARecord=true,EnableResourceNameDnsAAAARecord=false
else
  echo "Not starting monitoring node"
fi

GET_IPs_LOWER=$(echo "$GET_IPs" | tr '[:upper:]' '[:lower:]')
if [[ $GET_IPs_LOWER == "true" ]]; then

