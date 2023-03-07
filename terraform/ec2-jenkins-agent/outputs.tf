output "ec2_ip" {
  value = [for ec2 in aws_instance.ec2_terraform : ec2.id]
}

