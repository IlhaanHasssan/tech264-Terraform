# never hardcode credentials, i.e:
# aws_access_key = xxx
# aws_secret_key = xxx
# syntax often used in HCL is key = value
# create an ec2 instance
# where to create - specify provider
provider "aws" {
  region = "eu-west-1"
}
# which service/resource to create
# specify which image we wish to use and provide the ID (AMI ID - Amazon Machine Image ID)
# AMI ID = ami-0c1c30571d2dae5c9 (for ubuntu 22.04 lts)
# what size instance we wish to launch - t2.micro
# add a public IP to this instance
resource "aws_instance" "app_instance" {
  ami                         = var.app_ami_ID
  instance_type               = var.instance_type
  associate_public_ip_address = var.public_ip_address
  key_name                    = var.aws-key
  vpc_security_group_ids      = [aws_security_group.app-sg.id]
  tags = var.tags
}
#security group resource
resource "aws_security_group" "app-sg" {
  name        = "tech264-ilhaan-tf-allow-port-22-3000-80"
  description = "Allow SSH and HTTP traffic"
  #Inbound rules
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open to the world (use cautiously)
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow traffic on port 3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open to the world (use cautiously)
  }
  #Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allows all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tech264-ilhaan-tf-allow-port-22-3000-80"
  }

} 