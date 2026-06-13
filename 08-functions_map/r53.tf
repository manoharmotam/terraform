resource "aws_route53_record" "roboshop_r53" {
  for_each = aws_instance.test_ec2
  zone_id  = var.zone_id
  name = "${each.key}-${var.environment}.${var.domain_name}"
  type = "A"
  ttl = 1
  records = [aws_instance.test_ec2[each.key].private_ip]
}

resource "aws_route53_record" "roboshop_r53_frontend" {
  count = contains(keys(aws_instance.test_ec2), "frontend") ? 1 : 0
  zone_id  = var.zone_id
  name = "${var.project}-${var.environment}.${var.domain_name}"
  type = "A"
  ttl = 1
  records = [lookup(aws_instance.test_ec2,"frontend").public_ip]
}