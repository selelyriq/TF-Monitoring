terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
resource "aws_cloudwatch_log_metric_filter" "CostAllocationTagFilter" {
  name           = var.name
  pattern        = var.pattern
  log_group_name = var.log_group_name
  metric_transformation {
    name      = var.metric_name
    namespace = var.namespace
    value     = var.value
  }
}

resource "aws_cloudwatch_metric_alarm" "CostAlloactionTagAlarm" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  threshold           = var.threshold
  statistic           = var.statistic
  metric_name         = var.metric_name
  namespace           = var.namespace
}

########################################################
# EC2 to access CloudWatch Metrics
########################################################

resource "aws_iam_role" "ec2_cloudwatch_role" {
  name = "ec2_cloudwatch_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_cloudwatch_policy_attachment" {
  role       = aws_iam_role.ec2_cloudwatch_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_instance_profile" "ec2_cloudwatch_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.ec2_cloudwatch_role.name
}

resource "aws_cloudwatch_log_group" "cost_allocation_tag_log_group" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

