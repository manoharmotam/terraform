variable "project" {
    default = "misc"
}

variable "environment" {
    default = "dev"
}

variable "instance_type" {
    default = "t3.micro"

    validation {
      error_message = "Only 't3.micro' type instance is allowed"
      condition = contains(["t3.micro"], var.instance_type)
    }
}

variable "sg_rules" {
    default = {
        ssh = {
            port = 22
            cidr_blocks = ["0.0.0.0/0"]
        },
        httpd = {
            port = 80
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}