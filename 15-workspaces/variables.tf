variable "instance_type" {
  default = "t3.micro"

  validation {
    error_message = "Instance size should be either 't3.micro' or 'c7i-flex.large'"
    condition     = contains(["t3.micro", "c7i-flex.large"], var.instance_type)
  }
}

variable "common_tags" {
  default = {
    Project     = "roboshop"
    Environment = "dev"
  }
}

variable "allowed_ports" {
  type = list(any)
  default = [
    {
      port        = 80
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
