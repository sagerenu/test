# Purpose #
The purpose of this repository is to code the infrastructure in AWS so that  i can be as lazy as much  as i want.

# What it will do ?

- Automatically find latest Ubuntu 16.04 AMI and use it for Servers.

- Create 1 EC2 Instance for Development  

- Create 2 EC2 Instances for Staging

- Create a Load Balancer[ELB] for Staging Servers

- Automatically Assign Elastic IP's to Created Instances

- Create 1 RDS for Development & 1 for Staging

- Create Security Groups allowing these ports : 80, 443, 22

- BootStrap the servers with custom Scripts via "[User Data](https://github.com/sagespidy/Apache2/blob/master/non-interactive-apache2.sh)"

  ​

# Installation

- Download [terraform](https://www.terraform.io/downloads.html)

- Clone the repository `git clone https://github.com/sagespidy/terraform-aws.git`

- Run `terraform init`

- Open `terraform.tfvars` and provide suitable values

- Check to see if there are any errror or not : `terraform plan`

- And Finally `terraform apply`

  ​

