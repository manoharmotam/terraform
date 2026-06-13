resource "aws_instance" "test_ec2" {
  for_each = var.instances
  ami             = var.ami_id
  instance_type   = each.value.instance_type
  vpc_security_group_ids  = [aws_security_group.test_sg[each.key].id]
  key_name = "ami2"

  tags = {
    Name = "${var.project}-${var.environment}-${each.key}"
  }
}

resource "aws_security_group" "test_sg" {
  for_each = var.instances
  name  = "${var.project}-${var.environment}-${each.key}-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}-${each.key}"
  }
}