output "loadbalancerdns" {
  value = aws_lb.myalb.dns_name
}