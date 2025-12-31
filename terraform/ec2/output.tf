output "public_ip" {
  value = {
    for instance in aws_instance.ec2 :
    instance.tags["Name"] => instance.public_ip
  }
}

output "private_ip" {
  value = {
    for instance in aws_instance.ec2 :
    instance.tags["Name"] => instance.private_ip
  }
}

