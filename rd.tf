terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.50.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
  access_key = "AKIAR63XZ2KO2CK6ATVH"
  secret_key = "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"
}


# resource "aws_route_table" "publicrt" {
#   vpc_id = aws_vpc.publicvpc1.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.publicigw.id
#   }
# }

# resource "aws_route_table_association" "a" {
#     subnet_id = aws_subnet.publicsubnet1.id
#     route_table_id = aws_route_table.publicrt.id
# }

resource "aws_instance" "publicinstance1" {
  ami           = "ami-0bde1eb2c18cb2abe" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.publicsubnet1.id
  key_name      = "publicinstance1"

  tags = {
    Name = "publicinstance1"
  }
}