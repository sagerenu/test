resource "aws_elb" "staging"
{
  name = "${var.pname}-staging-elb"
  availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
instances                   = ["${aws_instance.staging.0.id}","${aws_instance.staging.1.id}"]
 cross_zone_load_balancing   = true
 idle_timeout                = 400
 connection_draining         = true
 connection_draining_timeout = 400
 tags {
     Name = "${var.pname}-staging-elb"
   }


}
output "staging-elb_endpoint"
{
  value = "${aws_elb.staging.dns_name}"
}
