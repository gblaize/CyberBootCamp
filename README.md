# CyberBootCamp
Commits from the CyberSec Bootcamp

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![~/CyberBootCamp/Diagrams/Images/Network Diagram.jpg](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Filebeat-playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._
---
- name: installing and launching filebeat
  hosts: webservers
  become: yes
  tasks:

  - name: download filebeat deb
    command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.0-amd64.deb

  - name: install filebeat deb
    command: sudo dpkg -i filebeat-7.4.0-amd64.deb

  - name: drop in filebeat.yml
    copy:
      src: /etc/ansible/filebeat-config.yml
      dest: /etc/filebeat/filebeat.yml

  - name: enable and configure system module
    command: filebeat modules enable system

  - name: setup filebeat
    command: filebeat setup

  - name: start filebeat service
    command: service filebeat start

  - name: enable service filebeat on boot
    systemd:
      name: filebeat
      enabled: yes

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting an access to the network.
- _TODO: What aspect of security do load balancers protect?
They protect against DDOS attacks by shifting the traffic from the organizations corporate server to a public cloud provider.
 What is the advantage of a jump box?_ 
 It bridges two dissimilar security zones and offers controlled access between them.


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metrics
- _TODO: What does Filebeat watch for?
Filebeat monitors changes in file data in a specified location, then reports that changed data to logstash/elastic search 
- _TODO: What does Metricbeat record?_
Metricbeat records the metrics from the operating system and from services running on a
server.
The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name    | Function                          | IP address              | Operating System |
|---------|-----------------------------------|-------------------------|------------------|
| Jumpbox | Gateway \| Ansible container node | 10.0.0.4\|52.152.239.79 | Linux            |
| Elk-vm  | Elk Stack container               | 10.2.0.5\|20.98.101.26  | Linux            |
| Web1-vm | DVWA container host               | 10.0.0.5                | Linux            |
| Web2-vm | DVWA container redundant host     | 10.0.0.6                | Linux            |
| Web3-vm | DVWA container redundant host     | 10.0.0.9                | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_
198.98.112.166

Machines within the network can only be accessed by _____.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_
The Jumpbox /Ansible container - 52.152.239.79

A summary of the access policies in place can be found in the table below.

| Name    | Publicly Accessible | Allowed IP Addresses |
|---------|---------------------|----------------------|
| Jumpbox | Yes                 | 198.98.112.166       |
| Elk-vm  | No                  |                      |
| Web1-vm | No                  |                      |
| Web2-vm | No                  |                      |
| Web3-vm | No                  |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_
The same playbook that was used in configuring the ELK machine can be used to connfigure multiple machines by just adding the host's IP address to the /etc/ansible/hosts file, instead of manualyy configuring them one by one.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...Install docker.io
- ...Install python3-pip
- ...Install Docker module
- ...Increase Virtual memory
- ...download and launch a docker elk container
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![~/CyberBootCamp/Diagrams/Images/docker_ps_output.jpg](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_
#Web-vms
10.0.0.5
10.0.0.6
10.0.0.9

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_
Filebeat and metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
Filebeat monitors changes in file logs in a specified location, then ships the data of the events that occur in this specific location to logstash/elastic search. Collecting Apache logs and forwarding them to Elasticsearch or Logstash.

Metricbeat records the metrics from the operating system and from services running on a
server e.g shipping the meris collected from a MySQL server to Elastic search or Logstash.
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Filebeat configuration file /etc/ansible/filebeat-config.yml file to /etc/filebeat/filebeat.yml.
- Update the /etc/ansible/hosts file to include the Ip addresses of the web vms under the webservers section.
- Run the playbook, and navigate to http://20.98.101.26:5601/ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? filebeat-playbook.yml is the playbook file
Where do you copy it?_ The file is located in /etc/ansible/roles/ directory
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
You update the /etc/ansible/hosts file, and you do this by updating the webservser section with the Ip addresses of the hosts that Filebeat would be installed on, and updating the Elk section with the host(s) Ip address that the Elk container would be installed on.
- _Which URL do you navigate to in order to check that the ELK server is running?
http://20.98.101.26:5601/

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

  command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.0-amd64.deb
