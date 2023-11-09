# volt-ChargIT-AWS
Running Volt ChargIT APP on AWS

This repo helps you start and execute a Volt environment with a non-trivial load simulator for performance testing or benchmarking. Its a growing repo, following is the initial scaffolding and execution details, this will be upgraded over the time with more utilities and eventually will be availabe in our inhouse automation frameworks. 

The use-case for simulation is a telecom rating and charging application. Full details and code for the same is available [here](https://github.com/srmadscience/voltdb-charglt)

---

### Pre-requisites

- [x] Have process access setup to AWS ENG Organisation.
- [x] Install aws CLI on your local terminal

### Getting Started

[startVMs.sh](startVMs.sh) file has the commands to start required number of Volt nodes and Test client nodes. It lets the user define this number, and select the type of machine you want to test on. 
This file contains details about enabling the monitoring server node, which has Grafana and Prometheus pre-installed on it. 

These commands use custom AMIs defined in AWS, in future work there will be a Packer & Ansible script to create an image with any version binaries the user provides. 

Change variables in the file as per requirements and execute the file. This will create the required VMs for you. 

Note: replace the `--key-name` in create commands with values of your AWS key name, or reach out to me for the same key defined in the command. 

Now with the VMs started, you can use the [getIP.sh](getIP.sh) file to get the various addresses of the machines, privateDNS, publicDNS and IP for grafana and volt VMC. 

### Settinh up the config

There is a sample [deployment.xml](config/deployment.xml) and [prometheus.yml](config/deployment.xml) for your reference. 
