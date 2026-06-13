variable "ami_id" {
  type    = string
  default = "ami-02dfbd4ff395f2a1b"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

# declaring the instances as map
variable "instances" {
  type    = map(any)
  default = {
    mongodb = {
      instance_type = "t3.micro"
    },
    redis = {
      instance_type = "t3.micro"
    },
    mysql = {
      instance_type = "t3.micro"
    },
    rabbitmq = {
      instance_type = "t3.micro"
    },
    frontend = {
      instance_type = "t3.micro"
    }
  }
}

variable "zone_id" {
  default = "Z00263282318BT9FBW1XK"
}

variable "domain_name" {
  default = "mrmotam.online"
}