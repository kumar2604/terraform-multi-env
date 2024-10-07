resource "aws_instance" "demo" {

    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = ["sg-0f674b765aee763af"]
    instance_type = lookup(var.instance_type,terraform.workspace)

    tags = {
        Name = "db"
    }
}

