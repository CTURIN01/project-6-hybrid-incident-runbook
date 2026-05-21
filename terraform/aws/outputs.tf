output "vpc_id" {
  description = "AWS VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "AWS public subnet ID"
  value       = aws_subnet.public.id
}
