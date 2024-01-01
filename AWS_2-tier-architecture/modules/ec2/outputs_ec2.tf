output "web_server1_public_IP" {
  value = aws_instance.web_server1.public_ip
}

output "web_server2_public_IP" {
  value = aws_instance.web_server2.public_ip
}