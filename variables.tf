variable "name" {
  type        = string
  description = "The name"
}

variable "pattern" {
  type        = string
  description = "The pattern"
}

variable "metric_name" {
  type        = string
  description = "The metric name"
}

variable "namespace" {
  type        = string
  description = "The namespace"
}

variable "value" {
  type        = string
  description = "The value"
}

variable "alarm_name" {
  type        = string
  description = "The alarm name"
}

variable "comparison_operator" {
  type        = string
  description = "The comparison operator"
}

variable "evaluation_periods" {
  type        = number
  description = "The evaluation periods"
}

variable "threshold" {
  type        = number
  description = "The threshold"
}

variable "statistic" {
  type        = string
  description = "The statistic"
}

variable "instance_profile_name" {
  type        = string
  description = "The instance profile name"
}

variable "log_group_name" {
  type        = string
  description = "The log group name"
}

variable "retention_in_days" {
  type        = number
  description = "The retention in days"
}

variable "tags" {
  type        = map(string)
  description = "The tags"
}





