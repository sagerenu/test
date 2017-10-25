resource "aws_db_instance" "staging"
{
  identifier = "${var.pname}-staging-rds"
  final_snapshot_identifier = "${var.pname}-staging-rds-final-snapshot"
  allocated_storage = 10
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7.17"
  instance_class = "${var.db_instance_class}"
  backup_retention_period = 7
  publicly_accessible = "true"
  username = "${var.pname}"
  password = "${var.rds_password}"
  vpc_security_group_ids = ["${aws_security_group.rds-staging.id}"]

}
output "rds_staging_endpoint"
{
  value = "${aws_db_instance.staging.endpoint}"
}
