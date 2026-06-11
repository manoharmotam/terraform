variable "ami_id" {
  type = string
  description = "Default ami id if nothing is provided"
  default = "ami-02dfbd4ff395f2a1b"
}

variable "instance_type" {
  type = string
  description = "Default instance_type if nothing is provided"
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name = "test-ec2"
    Environment = "dev"
  }
}

variable "sg_tags" {
  type = map(any)
  default = {
    Name = "test-sg"
    Environment = "dev"
  }
}

