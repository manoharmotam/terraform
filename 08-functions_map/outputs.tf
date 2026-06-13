output "ec2_data" {
  value = aws_instance.test_ec2
}

output "created_ips" {
  value = {for k, instance in aws_instance.test_ec2 : k => instance.public_ip}
}