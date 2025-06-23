output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.gu_vpc.id
}

output "public_subnets" {
  description = "Lista de subnets públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "Lista de subnets privadas"
  value       = aws_subnet.private[*].id
}
