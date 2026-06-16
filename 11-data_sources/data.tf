data "aws_ami" "joindevops" {
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
