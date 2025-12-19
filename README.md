
# ☁️ Automated AWS Infrastructure with Terraform & LocalStack

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![LocalStack](https://img.shields.io/badge/localstack-%23000000.svg?style=for-the-badge&logo=localstack&logoColor=white)

## 📌 Project Overview
This project demonstrates a complete **Infrastructure as Code (IaC)** deployment on AWS, simulated locally via **LocalStack**. It automates the provisioning of a secure, scalable, and monitored cloud environment, ensuring zero-cost development and testing.



## 🏗️ Architecture Components

### 1. Networking (VPC & Connectivity)
- Provisioned a custom **VPC** with a `10.0.0.0/16` CIDR block.
- Configured **Subnets** to ensure logical isolation of cloud resources.
- Established **Security Groups** acting as virtual firewalls to control inbound and outbound traffic.

### 2. Cloud Storage (S3)
- Created an **S3 Bucket** for centralized IT backups and logs.
- Enabled **Versioning** to provide data durability and protection against accidental deletions (Disaster Recovery).

### 3. Identity & Access Management (IAM)
- Implemented the **Principle of Least Privilege (PoLP)**.
- Defined **JSON IAM Policies** and created restricted users to enhance cloud security posture.

### 4. Serverless Database (DynamoDB)
- Deployed a **DynamoDB** table for high-performance, schema-less logging of system events.
- Configured `PAY_PER_REQUEST` billing mode for optimal cost-efficiency.

### 5. Monitoring & Observability (CloudWatch)
- Set up **CloudWatch Log Groups** for centralized system logging.
- Configured **Metric Alarms** to monitor database health and trigger alerts during high error rates.

## 🚀 Getting Started

### Prerequisites
- **Docker** installed and running.
- **Terraform** CLI.
- **LocalStack** (Community Edition).

### Deployment Steps
1. **Start LocalStack:**
   ```bash
   localstack start -d



LinkedIn: [http://www.linkedin.com/in/sohrab-jalali-625582291]

GitHub: [https://github.com/sohrabjalali30]