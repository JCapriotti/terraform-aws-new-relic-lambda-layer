variable "new_relic_account_id" {
  type        = string
  description = "Your New Relic account ID"
}

variable "lambda_handler" {
  type        = string
  description = "Path to your handler"
}

variable "environment_variables" {
  type        = map(string)
  description = "The environment variables used in the lambda"
  default     = {}
}

variable "license_key_secret_name" {
  type        = string
  description = "The name of the Secrets Manager secret that contains the New Relic license key"
  default     = "NEW_RELIC_LICENSE_KEY"
}

variable "license_key" {
  type        = string
  description = "The license key string"
  default     = null
  sensitive   = true
}
