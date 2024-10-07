variable "instance_names" {
    type = map
    # default = {
    #     db-dev = "t3.small"
    #     backend-dev = "t3.micro"
    #     frontend-dev = "t3.micro"
    # }
}
variable "image_id" {
  type        = string #optional
  default     = "ami-09c813fb71547fc4f" #optional
  description = "RHEL-9 AMI ID" #optional
}

variable "environment" {
    # default = "dev"
  
}



variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Terraform = "true"
    }
}

#sg variables
variable "sg_name" {
    default = "allow_ssh"
}


variable "ssh_port" {
    default = 22
}

variable "sg_description" {
    default = "allowing port 22"
}

variable "protocol" {
    default = "tcp"
}

variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}
