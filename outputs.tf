output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.gu_vpc.id
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = [for s in aws_subnet.public : s.id]
}

output "public_subnet_names" {
  description = "Tags Name de las subnets públicas"
  value       = [for s in aws_subnet.public : s.tags["Name"]]
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = [for s in aws_subnet.private : s.id]
}

output "private_subnet_names" {
  description = "Tags Name de las subnets privadas"
  value       = [for s in aws_subnet.private : s.tags["Name"]]
}

output "subnet_summary" {
  description = "Resumen de subnets con nombre y AZ"
  value = {
    public  = [for s in aws_subnet.public  : "${s.tags["Name"]} → ${s.availability_zone}"]
    private = [for s in aws_subnet.private : "${s.tags["Name"]} → ${s.availability_zone}"]
  }
}
