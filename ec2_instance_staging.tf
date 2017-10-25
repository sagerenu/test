
#
# Ec2 instance
resource "aws_instance" "staging"
{
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type_staging}"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.staging.name}"]
  count = "2"
  root_block_device
  {
    volume_type = "gp2"
    volume_size = "30"

  }
  volume_tags
  {
    Name = "volume for staging server"
  }
  user_data = "${file("${var.user_data}")}"
  tags
  {
    Name = "staging-${count.index} "
  }
}
  # Elastic Ip allocation
resource "aws_eip" "staging_ip"
{
  count = "2"
  instance = "${element(aws_instance.staging.*.id, count.index)}"
}


output "ec2_staging_0_ip"
{
  value = "${aws_eip.staging_ip.0.public_ip}"
}

output "ec2_staging_1_ip"
{
  value = "${aws_eip.staging_ip.1.public_ip}"
}
