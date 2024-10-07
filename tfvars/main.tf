resource "aws_instance" "expense" {
    for_each =  var.instance_names
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh-1.id]
    instance_type = each.value
    tags = merge(
        var.common_tags,
        {
            Name = "${each.key}.${var.environment}"
            Module = "${each.key}.${var.environment}"
            Environment = var.environment
        }
    )
}

resource "aws_security_group" "allow_ssh-1" {
    name = var.sg_name
    description = var.sg_description

    # this is block
    ingress {
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.protocol
        cidr_blocks      = var.allowed_cidr
    }

    egress {
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = var.allowed_cidr
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "Siva"
    }
}