# azure_modules

## Using this module example

1. Log in to Azure Cli using `az login`
1. Type `az account list` and (if you have more than one subscription) note the `id:` value, then
   1. Type `az account set --subscription="SUBSCRIPTION ID"`
1. Run `terraform init` to install providers and any required modules
1. Run `terraform plan -out=tfplan` to compare current state of Azure to tfstate
1. Run `terraform apply "tfplan"` to commit changes to Azure - confirming with `yes` when prompted
1. Run `terraform destroy` to tear down the created Azure resources - confirming with `yes` when prompted

## Tasks

1. Create an Azure VNet Module which can accept multiple subnets
