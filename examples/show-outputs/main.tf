provider "aws" {
  region = "us-east-1"
}

module "new_relic_layer" {
  source = "../../"

  lambda_handler       = "my_module.handler"
  new_relic_account_id = "your_nr_account_id"

  environment_variables = {
    MY_ENV_VAR  = "foo",
    ANOTHER_VAR = "bar",
  }
}

output "layer_version_arns" {
  value = module.new_relic_layer.layer_version_arns
}

output "layer_arns" {
  value = module.new_relic_layer.layer_arns
}

output "lambda_handler" {
  value = module.new_relic_layer.lambda_handler
}

output "environment_variables" {
  value = module.new_relic_layer.environment_variables
}

output "policy_json" {
  value = module.new_relic_layer.policy_json
}
