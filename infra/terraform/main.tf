/**
 * Setup AWS instances
 */
resource "aws_instance" "instance" {
  count = var.instance_count

  ami = lookup(var.ec2_ami,var.region)
  instance_type = var.instance_type

  tags = {
    Name = "instance-${count.index}"
  }

  user_data = "${file("./scripts/run.sh")}"
}
