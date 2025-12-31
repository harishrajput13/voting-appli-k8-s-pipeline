
resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance-type
  associate_public_ip_address = true
  availability_zone           = data.aws_availability_zones.ec2-az.names[0]
  vpc_security_group_ids      = ["sg-0141dd89e72eaf16f"]
  key_name                    = <aws-key-name>
  count                       = 2

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update && sudo apt upgrade -y
    EOF

  tags = {
    Name = "ec2-${count.index}"
  }
}

