# terraform-aws-vpc

Example code that uses [terraform-aws-vpc](https://github.com/terraform-aws-modules/terraform-aws-vpc) module to create VPC infrastructure in AWS.

## Setup/Teardown Commands

```
terraform init -backend-config="environments/prod/prod.backend.tfvars"
terraform plan -var-file="environments/shared.tfvars" -var-file="environments/prod/prod.tfvars"
terraform apply -var-file="environments/shared.tfvars" -var-file="environments/prod/prod.tfvars"
terraform destroy -var-file="environments/shared.tfvars" -var-file="environments/prod/prod.tfvars"
```
