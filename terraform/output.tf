output "server_ip" {
  description = ""
  value       = aws_instance.app_server.public_ip
}
