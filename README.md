# volt-ChargIT-AWS
Running Volt ChargIT APP on AWS

This repo helps you start and execute a Volt environment with a non-trivial load simulator for performance testing or benchmarking. Its a growing repo, following is the initial scaffolding and execution details, this will be upgraded over the time with more utilities and eventually will be availabe in our inhouse automation frameworks. 

The use-case for simulation is a telecom rating and charging application. Full details and code for the same is available [here](https://github.com/srmadscience/voltdb-charglt)

---

### Pre-requisites

- [x] Have proper access setup to AWS ENG Organisation.
- [x] Install aws CLI on your local terminal

### Getting Started

[startVMs.sh](startVMs.sh) file has the commands to start required number of Volt nodes and Test client nodes. It lets the user define this number, and select the type of machine you want to test on. 
This file contains details about enabling the monitoring server node, which has Grafana and Prometheus pre-installed on it. 

These commands use custom AMIs defined in AWS, in future work there will be a Packer & Ansible script to create an image with any version binaries the user provides. 

Change variables in the file as per requirements and execute the file. This will create the required VMs for you. 

Note: replace the `--key-name` in create commands with values of your AWS key name, or reach out to me for the same key defined in the command. 

Now with the VMs started, you can use the [getIP.sh](getIP.sh) file to get the various addresses of the machines, privateDNS, publicDNS and IP for grafana and volt VMC. 

### Setting up the config

There is a sample [deployment.xml](config/deployment.xml) and [prometheus.yml](config/deployment.xml) for your reference. 

Add the host addresses for Volt and test client nodes in prometheus config file for collecting metrics. 
Each AMI has node-exporter agent installed on it. We just need to update the relevant node address in the prometheus config. Ensure to restart the service upon any change in config in order for it to be taken into effect.

After changing volt config in deployment file, use scp and aws key to copy this file to your newly started volt nodes. 

### Let's start the test client

first, Schema, depending on whether you want to enable topics and/or/nor import/export make changes to the schema ddl present on any of the test client nodes at `~/voltdb-charglt/ddl/create_db.sql`