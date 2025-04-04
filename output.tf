output "cost_allocation_tag_filter" {
    value = aws_cloudwatch_metric_filter.CostAllocationTagFilter.id
}

output "cost_allocation_tag_alarm" {
    value = aws_cloudwatch_metric_alarm.CostAlloactionTagAlarm.id
}

output "cost_allocation_tag_filter_arn" {
    value = aws_cloudwatch_metric_filter.CostAllocationTagFilter.arn
}

output "cost_allocation_tag_alarm_arn" {
    value = aws_cloudwatch_metric_alarm.CostAlloactionTagAlarm.arn
}

output "cost_allocation_tag_filter_name" {
    value = aws_cloudwatch_metric_filter.CostAllocationTagFilter.name
}

output "cost_allocation_tag_alarm_name" {
    value = aws_cloudwatch_metric_alarm.CostAlloactionTagAlarm.name
}