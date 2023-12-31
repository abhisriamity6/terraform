variable "keyName" {
   default = "mykey_test"
}
variable "privatekeyPath" {
   default = "/home/ec2-user/terraform/tf1-ec2/mykey_test.pem"
}
variable "publickeyName" {
   default = "mykey_test.pub"
}
variable "publickeyPath" {
   default = "/home/ec2-user/terraform/tf1-ec2/mykey_test.pub"
}

variable "name_security_groups" {
   default = "SG-Nginx"
}
variable "sg_ingress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "10.0.0.0/8"
          description = "SSH"
        },
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "SSH"
        },
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "HTTP"
        },
        {
          from_port   = 1494
          to_port     = 1494
          protocol    = "tcp"
          cidr_block  = "10.0.0.0/8"
          description = "Citrix"
        },
    ]
}
variable "sg_egress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
        }))
    default     = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_block  = "0.0.0.0/0"
         },
        
                ]
}
variable "vpc_id" {
   default = "vpc-0d797bead9714b420"
}
output "private_ip" {
value = aws_instance.example1.private_ip
description = "The public IP address of the web server"
 }
