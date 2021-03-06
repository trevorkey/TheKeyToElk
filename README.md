## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](https://github.com/trevorkey/TheKeyToElk/blob/master/Diagrams/KeyToElk_Diagram.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, individual portions of the The_Key_To_Elk file are uploaded and may be used to install only certain pieces of it, such as Filebeat.

  - The_Key_To_Elk-playbook.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundent, in addition to restricting access to the network.
- Load balancers can help prevent or mitigate DDoS and DoS attacks. While the Jump Box creates an administrator single point of entry into the network. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system logs.
- Filebate monitors for log files by collecting events and forwarding them to Elasticsearch. 
- Metricbeat collects statistics and metrics such as connection locations, errors, and more where it then forwards the data to Elasticsearch. 

The configuration details of each machine may be found below.

| Name     | Function  | IP Address  | Operating System |
|----------|-----------|-------------|------------------|
| Jump Box | Gateway   | 10.0.0.4    | Linux            |
| Web-1    | DVWA      | 10.0.0.5    | Linux            |
| Web-2    | DVWA      | 10.0.0.8    | Linux            |
| Web-3    | DVWA      | 10.0.0.13   | Linux            |
| Elk      | Elkstack  | 10.1.0.4    | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 91.162.345.62

Machines within the network can only be accessed by the Jump Box Provisioner.
- 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name          | Publicly Accessible | Allowed IP Addresses |
|---------------|---------------------|----------------------|
| Jump Box      | Yes                 | 91.162.345.62        |
| ELK VM        | Yes                 | 91.162.345.62        |
| Load Balancer | Yes                 | 52.156.77.158        |
| Web-1         | No                  | 10.0.05 10.1.0.4     |
| Web-2         | No                  | 10.0.05 10.1.0.4     |
| Web-3         | No                  | 10.0.05 10.1.0.4     |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The main advantage of Ansible is automation of configuration. 

The playbook implements the following tasks:
- Install Docker.io
- Install Python 3
- Download and install Elk docker container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](https://github.com/trevorkey/TheKeyToElk/blob/master/Diagrams/Docker_PS_output.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
| Name     | IP Address |
|----------|------------|
| Web-1    | 10.0.0.5   |
| Web-2    | 10.0.0.8   |
| Web-3    | 10.0.0.13  |

We have installed the following Beats on these machines:
- MetricBeat
- FileBeat

These Beats allow us to collect the following information from each machine:
- FileBeat monitors system logs and specific locations including sudo commands, system logins, etc. 
- MetricBeat monitors the systems metrics such as connected IPs, IP locations, etc. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook.yml file(s) to the control node.
- Update the Hosts file to include network IP Addresses
- Run the playbook.yml file(s), and navigate to http://(ElkIPAddress):5601/app/kibana to check that the installation worked as expected.

### Using the Playbook Pt.2 
- Copy the multiple .yml files from /TheKeyToElk/Ansible to the jumpbox ansible continaer. 
- Update the Hosts file to include two sections [elk] [webservers] with each having their respective VM IPs directly under them. 
- Also in the Hosts file, update server IPs with Python3. 
- Navigate to http://(ElkIPAddress):5601/app/kibana to make sure the elk server is running. 

### Step by step commands

