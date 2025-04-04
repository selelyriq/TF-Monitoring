terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Create the log group first
resource "aws_cloudwatch_log_group" "cost_allocation_tag_log_group" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

# Then create the metric filter with explicit dependency
resource "aws_cloudwatch_log_metric_filter" "CostAllocationTagFilter" {
  name           = var.name
  pattern        = var.pattern
  log_group_name = aws_cloudwatch_log_group.cost_allocation_tag_log_group.name  # Reference the log group resource
  
  metric_transformation {
    name      = var.metric_name
    namespace = var.namespace
    value     = var.value
  }

  depends_on = [aws_cloudwatch_log_group.cost_allocation_tag_log_group]  # Explicit dependency
}

resource "aws_cloudwatch_metric_alarm" "CostAlloactionTagAlarm" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  threshold           = var.threshold
  statistic          = var.statistic
  metric_name        = var.metric_name
  namespace          = var.namespace
  period             = var.period
}

########################################################
# EC2 to access CloudWatch Metrics
########################################################

resource "aws_cloudwatch_log_group" "cost_allocation_tag_log_group" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

