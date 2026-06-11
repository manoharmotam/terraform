# Variable Precedence

Just like ansible, terraform gives high priority to the variables passed in the command line.

### Here's how the prority of variables work in terraform

1. `terraform apply -var="ami=ami-0220d79f3f480ecf5"`

    The image id provided above for the ami key is givem high precendence over the one provided in the value for that key in main.tf, variables.tf or tfvars file