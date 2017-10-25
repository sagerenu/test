resource "aws_security_group" "rds-staging"
{
  tags
  {
    Name = "${var.pname}-rds-staging"
  }
  name = "${var.pname}-rds-staging"
  description = "Created by Shailender Choudhary"
  ingress
  {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["111.93.125.26/32","182.74.105.34/32"]

  }

  ingress
  {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = ["${aws_security_group.staging.id}"]

  }
  egress
  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
