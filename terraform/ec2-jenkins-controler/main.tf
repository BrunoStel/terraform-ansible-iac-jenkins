terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      version = "4.12.1"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "brunostel-tf-state"
    key    = "aws-ec2-kubernetes-cluster/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.location

  default_tags {
    tags = local.common_tags
  }
}

module "network" {
  source = "./network"

  #Valor das variaveis do m├│dulo (que j├í est├úo criadas dentro do m├│dulo sem valor default)
  cidr_vpc          = "10.0.0.0/16"
  cidr_subnet       = "10.0.1.0/24"
  environment       = "terraform-kubernetes"
  availability_zone = var.availability_zone
}
