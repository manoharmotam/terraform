resource "aws_route53_record" "roboshop_r53" {
  count = length(var.instances)
  zone_id  = var.zone_id
  name = "${var.instances[count.index]}-${var.environment}.${var.domain_name}"
  type = "A"
  ttl = 1
  records = [aws_instance.test_ec2[count.index].private_ip]
}

resource "aws_route53_record" "roboshop_r53_frontend" {
  count = contains(var.instances, "frontend") ? 1 : 0
  zone_id  = var.zone_id
  name = "${var.project}-${var.environment}.${var.domain_name}"
  type = "A"
  ttl = 1
  records = [aws_instance.test_ec2[index(var.instances, "frontend")].public_ip]
}