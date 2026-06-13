resource "aws_instance" "roboshop" {
  for_each = var.instances
  ami = var.ami_id
  instance_type = each.value.instance_type
  key_name = "ami2"
  vpc_security_group_ids = [aws_security_group.roboshop[each.key].id]

  tags = {
    Name = "${var.project}-${var.environment}-${each.key}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "roboshop" {
  for_each = var.instances
  name = "${var.project}-${var.environment}-${each.key}-sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "${var.project}-${var.environment}-${each.key}-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

