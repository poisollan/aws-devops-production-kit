resource "aws_cloudwatch_metric_alarm" "high_cpu_monitoring" {
  alarm_name          = "${var.project_name}-high-cpu-monitoring"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Monitoring alarm when average ASG CPU is above 70%"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
}