resource "aws_instance" "test_ec2" {
    count = 4
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [
      aws_security_group.test_sg[count.index].id
      ]
    tags = {
      Name = "${var.project}-${var.environment}-${var.instances_name[count.index]}"
    }
}

resource "aws_security_group" "test_sg" {
  count = 4
  name = "${var.project}-${var.environment}-${var.instances_name[count.index]}-sg"
  description = "Allow SSH"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances_name[count.index]}-sg"
  }
}