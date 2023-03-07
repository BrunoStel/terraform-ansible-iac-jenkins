resource "aws_instance" "ec2_terraform" {
  ami                         = "ami-06878d265978313ca"
  instance_type               = "t3.large"
  key_name                    = "ec2-ssh"
  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.sg_id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 15
    volume_type = "gp2"
  }

  for_each = toset(var.ec2_names)

  tags = merge({
    Name = "${each.key}"
  }, local.common_tags)
}
