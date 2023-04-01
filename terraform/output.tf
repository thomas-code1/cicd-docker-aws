output "server_ip" {
  description = ""
  value       = aws_instance.app.*.public_ip
}
