# Lab 01: Your First Terraform

Create an S3 bucket, modify it, see the plan diff, and destroy it.

## Instructions

Follow the lesson at [prabhuthangavel.com → Terraform → Lab: Your First Terraform](https://www.prabhuthangavel.com/learning/devops/terraform/terraform-basics-lab)

## Quick Start

```bash
cd lab-01-your-first-terraform
```

Then follow the steps in the lesson. Everything is pre-configured — just write your `.tf` files and run `terraform init`.

## What's Pre-configured

- `provider.tf` — AWS provider pointing to LocalStack (already set up)
- Terraform + AWS CLI installed
- LocalStack running with S3 service
