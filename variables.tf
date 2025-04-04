variable "name" {
    type = string
    description = "The name of the metric filter"
}

variable "metric_filter" {
    type = string
    description = "The metric filter"
}

variable "metric_transformation" {
    type = string
    description = "The metric transformation"
}

variable "namespace" {
    type = string
    description = "The namespace"
}  

variable "pattern" {
    type = string
    description = "The pattern"
}

variable "alarm_name" {
    type = string
    description = "The alarm name"
}

variable "comparison_operator" {
    type = string
    description = "The comparison operator"
}

variable "evaluation_periods" {
    type = number
    description = "The evaluation periods"
}

variable "threshold" {
    type = number
    description = "The threshold"
}

variable "statistic" {
    type = string
    description = "The statistic"
}

variable "metric_name" {
    type = string
    description = "The metric name"
}
