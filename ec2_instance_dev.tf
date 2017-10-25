
# Ec2 instance
resource "aws_instance" "dev"
{
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type_dev}"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.dev.name}"]
  root_block_device
  {
    volume_type = "gp2"
    volume_size = "30"

  }
  volume_tags
  {
    Name = "volume for dev server"
  }
  user_data = "${file("${var.user_data}")}"
  tags
  {
    Name = "Dev instance "
  }
}

# Elastic Ip allocation
resource "aws_eip" "dev_ip"
{
  instance = "${aws_instance.dev.id }"
}
output "ec2_dev_ip"
{
  value = "${aws_eip.dev_ip.public_ip}"
}
output "x_SSH_UserName"
{
  value = "${var.pname}"
}
output "x_SSH_Password"
{
  value = "${var.ssh_password}"
}
