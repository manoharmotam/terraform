data "aws_ami" "ami2" {
    owners = ["973714476881"]

    filter {
      name = "name"
      values = ["Redhat-9-DevOps*"]
    }

    filter {
      name = "root-device-name"
      values = ["/dev/sda1"]
    }
}

data "http" "get_ip" {
  url = "https://checkip.amazonaws.com"
}

output "ec2_data" {
  value = data.aws_ami.ami2.id
}

output "http" {
  value = local.ssh
}