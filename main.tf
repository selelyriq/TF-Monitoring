terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}
resource "aws_cloudwatch_metric_filter" "CostAllocationTagFilter" {
    name = var.name
    metric_filter = var.metric_filter
    metric_transformation = var.metric_transformation
    namespace = var.namespace
    pattern = var.pattern
}

resource "aws_cloudwatch_metric_alarm" "CostAlloactionTagAlarm" {
    alarm_name = var.alarm_name
    comparison_operator = var.comparison_operator
    evaluation_periods = var.evaluation_periods
    threshold = var.threshold
    statistic = var.statistic
    metric_name = var.metric_name
    namespace = var.namespace
}

