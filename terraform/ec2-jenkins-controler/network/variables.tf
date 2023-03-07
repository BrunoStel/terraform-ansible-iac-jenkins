variable cidr_vpc {
  type        = string
  description = "Cidr of vpc"
}

variable cidr_subnet {
  type        = string
  description = "Cidr of subnet"
}

variable environment {
  type        = string
  description = "Name of the environment given to the resources"
}

variable "availability_zone" {
  type        = string
  description = "To set the aws availability zone"
}

