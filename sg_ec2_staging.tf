resource "aws_security_group" "staging"
{
  tags
  {
    Name = "${var.pname}-ec2-staging"
  }
  name = "${var.pname}-ec2-staging"
  description = "Created by Shailender Choudhary"

  ingress
  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["111.93.125.26/32","182.74.105.34/32"]

  }
  ingress
  {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress{
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress
  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
