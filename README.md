# Ethereum private network

This repo will help you quickly provision and configure a private ethereum blockchain network.

## Requirements

The following need to be available on your machine.

- Terraform - https://www.terraform.io/
- Credentials for AWS

## Usage

All commands must be run against a particular environment, e.g. `staging`,
`production`, `main`, `priv123`...

You should copy the `.env.example.sh` file to `.env.[ENV].sh` and edit to suit your environment. 
**Keep these files outside of version control!** - they contain sensitive data.
Then run:

    $ source .env.[ENV].sh

You should also look at `variables.tf` and create a file named `variables-[ENV].tfvars` with the overrides you want.

If it's the first time running terraform: 

    $ terraform init

Then you can check on the infrastructure status with:

    $ terraform plan -state=$ENV.tfstate -var-file=variables-$ENV.tfvars

And then apply the changes

    $ terraform apply -state=$ENV.tfstate -var-file=variables-$ENV.tfvars

Do this command to view IP addresses, services URLs, etc.:

    $ terraform output -state=$ENV.tfstate

If you are just "messing around", you can destroy everything (clean up) with:

    $ terraform destroy -state=$ENV.tfstate -var-file=variables-$ENV.tfvars

Else, please clone this repo, and commit the *tfstate* files, so that terraform can keep track of the state.


## Resouces

- https://github.com/ethereum/go-ethereum/wiki/Private-network
- https://medium.com/cybermiles/running-a-quick-ethereum-private-network-for-experimentation-and-testing-6b1c23605bce
- 

