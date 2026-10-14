output "mysg_id" {
  value       = aws_security_group.mysg.id
  description = "sg id for both alb and ec2 instance"
}