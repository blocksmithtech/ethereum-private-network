# Ethereum private network

This repo will help you quickly provision and configure a private ethereum blockchain network on AWS.

## Requirements

The following need to be available on your machine.

- Terraform - https://www.terraform.io/
- Credentials for AWS

## First setup and config

All commands must be run against a particular environment, e.g. `staging`,
`production`, `main`, `priv123`...

You should copy the `variables-example.tfvars` file to `variables-[ENV].sh` and edit to suit your environment. 
**Keep these files outside of version control!** - they contain sensitive data.

At the very least you need to define the *key pair file* that is used for SSH'ing into the EC2 instances. This should be the only *manual* step.
Go into EC2 dashboard, generate and download the pem file.

If it's the first time running terraform: 

    $ terraform init

## Usage

To ease the common commants, start by exporting your ENV:

    $ export ENV=my-awesome-env

You can check on the infrastructure status with:

    $ terraform plan -state=$ENV.tfstate -var-file=variables-$ENV.tfvars

And then apply the changes

    $ terraform apply -state=$ENV.tfstate -var-file=variables-$ENV.tfvars

Do this command to view IP addresses, services URLs, etc.:

    $ terraform output -state=$ENV.tfstate

If you are just "messing around", you can **destroy** everything (clean up) with:

    $ terraform destroy -state=$ENV.tfstate -var-file=variables-$ENV.tfvars

Else, if you intend to use the ethereum node for an extended amount of time,  please clone this repo, and commit the *tfstate* files, so that terraform can keep track of the state.

## Resources

- https://github.com/ethereum/go-ethereum/wiki/Private-network
- https://medium.com/cybermiles/running-a-quick-ethereum-private-network-for-experimentation-and-testing-6b1c23605bce
- https://arctouch.com/blog/how-to-set-up-ethereum-blockchain/
- https://medium.com/coinmonks/ethereum-setting-up-a-private-blockchain-67bbb96cf4f1
- https://hackernoon.com/heres-how-i-built-a-private-blockchain-network-and-you-can-too-62ca7db556c0

