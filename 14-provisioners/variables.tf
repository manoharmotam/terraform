locals {
  ami_id = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.micro"
  tags = merge(var.common_tags,
        {
            "Managed By" = "terraform"
        }
    )
  project = "roboshop"
  environment = "dev"
  ssh = [{
    port = 22
    cidr_blocks = ["${chomp(data.http.get_ip.response_body)}/32"]
  }]
}

variable "instance_type" {
  default = "t3.micro"

  validation {
    error_message = "Instance size should be either 't3.micro' or 'c7i-flex.large'"
    condition = contains(["t3.micro", "c7i-flex.large"], var.instance_type)
  }
}

variable "common_tags" {
  default = {
    Project = "roboshop"
    Environment = "dev"
  }
}

variable "allowed_ports" {
  type = list(any)
  default = [
    {
      port = 80
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
