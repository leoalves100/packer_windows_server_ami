# packer_windows_server_ami

&nbsp;

## Requirements

- Terraform: 1.\*
- Packer: 1.\*

&nbsp;

## Execution

&nbsp;

### Terraform

```tf
terraform init
terraform plan -var-file=prod.tfvars -input=false -out=output
terraform apply "output"
```

### Packer

```shell
packer validate -var-file=prod.pkrvars.hcl .
packer build -var-file=prod.pkrvars.hcl .
```
