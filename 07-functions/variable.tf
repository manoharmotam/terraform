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

variable "instances" {
  type    = list(any)
  default = ["mongodb", "mysql", "frontend"]
}

variable "zone_id" {
  default = "Z00263282318BT9FBW1XK"
}

variable "domain_name" {
  default = "mrmotam.online"
}