# ==================================================================
# RESOURCE AWS EC2 - INSTANCE
# ==================================================================

resource "aws_instance" "instance" {
  count = var.aws_instance_count

  ami           = lookup(var.aws_instance_ami, var.aws_region)
  instance_type = var.aws_instance_type
  user_data = file("${path.root}/files/scripts/run.sh")

  tags = {
    Name = "instance-${count.index}"
  }
}
