# Modular Terraform AWS Infrastructure

## 📌 Project Overview

This project demonstrates how to provision and manage AWS infrastructure using **Terraform with a modular architecture**.

Instead of defining all AWS resources in a single file, the infrastructure is organized into reusable Terraform modules to improve code organization, maintainability, and scalability.

This hands-on project demonstrates practical knowledge of Infrastructure as Code (IaC), AWS networking, compute resources, application load balancing, and cloud infrastructure automation.

## 🎯 Project Objectives

- Automate AWS infrastructure provisioning using Terraform.
- Implement reusable Terraform modules.
- Create a VPC with two public subnets across two Availability Zones.
- Configure an Internet Gateway and route tables.
- Deploy two EC2 instances running Apache HTTP Server.
- Configure an Application Load Balancer (ALB).
- Create and manage an Amazon S3 bucket.
- Organize Terraform configurations using variables and modules.
- Manage infrastructure code using Git and GitHub.

## 🏗️ AWS Architecture

The project provisions the following AWS resources:

1. **Amazon VPC** – Provides an isolated virtual network.
2. **Two Public Subnets** – Distribute EC2 instances across two Availability Zones.
3. **Internet Gateway** – Provides internet connectivity to the VPC.
4. **Route Tables** – Configure internet-bound routing for public subnets.
5. **Security Groups** – Control inbound and outbound network traffic.
6. **Two EC2 Instances** – Host web servers in separate public subnets.
7. **Apache HTTP Server** – Installed and started automatically using Terraform `user_data`.
8. **Application Load Balancer** – Distributes incoming HTTP traffic across EC2 instances.
9. **Target Group** – Registers EC2 instances and performs health checks.
10. **Amazon S3** – Provides an AWS object storage resource.

### Architecture Diagram

![Modular Terraform AWS Infrastructure Architecture](images/aws-terraform-architecture.png)

The Application Load Balancer distributes incoming HTTP requests to the EC2 instances registered in the target group. The S3 bucket is a separate storage resource.

## 🧰 Technologies Used

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| Amazon Web Services | Cloud infrastructure |
| Amazon VPC | Network isolation |
| Amazon EC2 | Virtual machine instances |
| Application Load Balancer | Traffic distribution |
| Amazon S3 | Object storage |
| Security Groups | Network traffic control |
| Git and GitHub | Version control |
| Visual Studio Code | Development environment |
| AWS CLI | AWS command-line management |
| PowerShell | Command-line execution |

## 📁 Project Structure

```text
terraform-projects/
│
├── main.tf
├── provider.tf
├── variable.tf
├── .gitignore
├── .terraform.lock.hcl
│
├── images/
│   └── aws-terraform-architecture.png
│
└── terraform_modules/
    └── modules/
        ├── vpc/
        ├── subnet/
        ├── internet_gateway/
        ├── routing_tables/
        ├── security_groups/
        ├── instance/
        ├── target_groups/
        ├── load_balancer/
        └── s3/
```

Each module manages a specific AWS component. The root `main.tf` file calls the reusable modules and passes the required variables between them.

## ⚙️ Prerequisites

Before deploying the infrastructure, ensure that you have:

- An AWS account.
- Terraform CLI installed.
- AWS CLI installed.
- Git installed.
- An AWS IAM identity with the required permissions.
- AWS credentials configured securely.

## 🚀 Setup and Deployment

### 1. Clone the repository

```bash
git clone -b testing https://github.com/Shyamcharan-007/terraform-projects.git
```

### 2. Navigate to the project directory

```bash
cd terraform-projects
```

Run all Terraform commands from this directory because the root Terraform configuration files are located here.

### 3. Configure AWS credentials

```bash
aws configure
```

Configure your AWS CLI credentials using an appropriate IAM identity.

Never hardcode AWS access keys or secret keys in Terraform files or commit them to GitHub.

### 4. Initialize Terraform

```bash
terraform init
```

Downloads the required providers and initializes the Terraform working directory.

### 5. Format the configuration

```bash
terraform fmt -recursive
```

### 6. Validate the configuration

```bash
terraform validate
```

Checks the Terraform configuration for syntax and structural errors.

### 7. Review the execution plan

```bash
terraform plan
```

Review the proposed infrastructure changes before proceeding. Provide the required SSH CIDR value when Terraform prompts for it.

### 8. Deploy the infrastructure

```bash
terraform apply
```

Review the execution plan and type `yes` when you are ready to create the resources.

## 🔍 Verification

After deployment, verify the following resources in the AWS Management Console:

| Resource | Verification |
|---|---|
| VPC | Confirm the VPC is created |
| Subnets | Confirm both public subnets exist |
| Internet Gateway | Confirm it is attached to the VPC |
| Route Tables | Check public subnet routing |
| EC2 Instances | Confirm both instances are running |
| Apache HTTP Server | Check that the web server is running |
| Target Group | Check registered target health |
| Application Load Balancer | Confirm the load balancer is active |
| S3 Bucket | Confirm the bucket is created |

### Access the Application Load Balancer

The ALB DNS name is not declared as a Terraform output in the configuration inspected for this README.

To access the load balancer:

1. Open the AWS Management Console.
2. Navigate to **EC2 → Load Balancers**.
3. Select your Application Load Balancer.
4. Copy its DNS name from the details section.
5. Open the following address in your browser, replacing the placeholder with the actual DNS name:

```text
http://myalb-1234567890.us-east-1.elb.amazonaws.com
```

If the EC2 instances are registered and healthy, and the security group rules are configured correctly, the load balancer should forward HTTP requests to the web servers.

## 🔐 Security Considerations

- Use IAM identities with only the permissions required for deployment.
- Never commit AWS credentials, Terraform state files, or sensitive variable files.
- Restrict SSH access to trusted IP addresses.
- Review security group rules before deployment.
- Keep S3 public access blocked unless public access is explicitly required.
- Review AWS resource costs and remove unused resources.
- Keep `.terraform/`, Terraform state files, and saved plan files excluded from Git.
- For production environments, use separate security groups for the load balancer and EC2 instances.
- Allow EC2 HTTP traffic only from the load balancer security group.

**Note:** This project uses a shared security group for the load balancer and EC2 instances as a learning implementation. Separate security groups are recommended for production environments.

## 🧹 Cleanup

To review the resources Terraform plans to remove:

```bash
terraform plan -destroy
```

To destroy the infrastructure:

```bash
terraform destroy
```

If the S3 bucket contains objects, empty the bucket before destroying the infrastructure.

Review the proposed destruction carefully before confirming it. AWS resources may incur charges while they are running.

## 📚 Learning Outcomes

Through this project, I gained practical experience with:

- Infrastructure as Code using Terraform.
- Creating and managing reusable Terraform modules.
- AWS networking concepts, including VPCs, subnets, and Internet Gateways.
- Provisioning EC2 instances and configuring web servers.
- Configuring Application Load Balancers and target groups.
- Managing Terraform variables and module configurations.
- Using Terraform initialization, formatting, validation, planning, and deployment commands.
- Version control and GitHub branch management.
- Resolving Git merge conflicts.

## 👨‍💻 Author

**Shyam**

GitHub: [@Shyamcharan-007](https://github.com/Shyamcharan-007)

**Project Repository:** [terraform-projects](https://github.com/Shyamcharan-007/terraform-projects)

---

*This project was developed as a hands-on learning project to demonstrate Terraform modular architecture and AWS infrastructure automation.*
