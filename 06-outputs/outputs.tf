output "ec2_ip" {
  description = "provides the output of aws instance"
  value = aws_instance.test_ec2.public_ip
}