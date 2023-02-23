/**
 * Setup AWS instances
 */
resource "aws_instance" "instance" {
  count = var.aws_instance_count

  ami           = lookup(var.aws_instance_ami, var.aws_region)
  instance_type = var.aws_instance_type

  tags = {
    Name = "instance-${count.index}"
  }

  user_data = file("./scripts/run.sh")
}
