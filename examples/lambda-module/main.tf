provider "aws" {
  region = "us-east-1"
}

module "new_relic_layer" {
  source = "../../"

  lambda_handler        = "my_module.handler"
  new_relic_account_id  = "your_new_relic_account_id"
  environment_variables = {
    MY_ENV_VAR  = "foo",
    ANOTHER_VAR = "bar",
  }
}

module "my_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-function"
  runtime       = "python3.8"
  publish       = true
  source_path   = [
    "${path.module}/my_module.py",
  ]

  layers                = [module.new_relic_layer.layer_version_arns["python3.8"]]
  handler               = module.new_relic_layer.lambda_handler
  attach_policy_json    = true
  policy_json           = module.new_relic_layer.policy_json
  environment_variables = module.new_relic_layer.environment_variables
}
