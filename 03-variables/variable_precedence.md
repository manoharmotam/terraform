# Variable Precedence

Just like ansible, terraform gives high priority to the variables passed in the command line.

### Here's how the prority of variables work in terraform

| Variable Type         | Precedence   |
| :-----:               | :-----:      |
| Command Line Variable | 1st Priority |
| Terraform tfvars      | 2nd Priority |
| ENV variable TF_VARS  | 3rd Priority |
| Default Variables     | 1st Priority |

NOTE: Terraform prompts to provide a variable if a variable is defined and the value is not provided

---
<br>
 1. The image id provided below for the key ami is givem high precendence over the one provided in the value for that key in main.tf, variables.tf or tfvars file
 
 ```hcl
    terraform apply -var="ami=ami-0220d79f3f480ecf5"
 ```

 2. 