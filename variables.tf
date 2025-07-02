variable "environment" {
  type        = string
  description = "Ambiente del despliegue (dev, qa, prod)"
}

variable "region" {
  type        = string
  description = "Región AWS donde se despliega la infraestructura"
}

variable "aws_profile" {
  type        = string
  description = "Perfil configurado en AWS CLI"
}

variable "vpc_cidr" {
  type        = string
  description = "Bloque CIDR para la VPC"
}

variable "prefix" {
  type        = string
  description = "Prefijo del nombre para tagging de recursos"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Lista de CIDR blocks para las subnets públicas"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Lista de CIDR blocks para las subnets privadas"
}

variable "azs" {
  type        = list(string)
  description = "Zonas de disponibilidad a utilizar"
}
