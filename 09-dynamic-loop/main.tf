resource "aws_instance" "test_ec2" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.test_sg.id]

    tags = {
      Name = "${var.project}-${var.environment}"
    }
}

resource "aws_security_group" "test_sg" {
    name = "${var.project}-${var.environment}-sg"

    dynamic "ingress" {
      for_each = var.sg_rules
      iterator = rule

      content {
        from_port = rule.value.port
        to_port = rule.value.port
        protocol = "TCP"
        cidr_blocks = rule.value.cidr_blocks
      }
    }
    tags = {
        Name = "${var.project}-${var.environment}-sg"
    }
}