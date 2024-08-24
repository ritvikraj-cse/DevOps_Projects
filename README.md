# Ansible Realtime project

## Task 1

Create three(3) EC2 instances on AWS using Ansible loops
- 2 Instances with Ubuntu Distribution
- 1 Instance with Centos Distribution

Hint: Use `connection: local` on Ansible Control node.

## Task 2

Set up passwordless authentication between Ansible control node and newly created 
instances.

## Task 3

Automate the shutdown of Ubuntu Instances only using Ansible Conditionals

Hint: Use `when` condition on ansible `gather_facts`




## Steps-

1. Create IAM User and access keys, Key-pair, vpc, subnet.
2. Install boto3, ansible and collection.
3. Setup Vault.
4. Create ec2_create.yaml and run the playbook.
5. Setup Passwordless Authentication.
6. Write ec2_shutdown.yaml and inventory.ini
7. Run the ec2_shutdown playbook.





