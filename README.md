# New Relic AWS Lambda Layer Module

A Terraform module that provides outputs which can be used to configure AWS Lambda resources with New Relic monitoring. 
Monitoring is enabled using New Relic's layer solution. See [New Relic's documentation](https://docs.newrelic.com/docs/serverless-function-monitoring/aws-lambda-monitoring/get-started/monitoring-aws-lambda-serverless-monitoring/)
for more information.

## Features

* Does not create resources, but rather encapsulates the boilerplate configuration and provides it as outputs.
* Defaults to using the latest version of a particular layer.

## Usage

### Prerequisites

* A New Relic account
* Monitoring for AWS Lambda [configured](https://docs.newrelic.com/docs/serverless-function-monitoring/aws-lambda-monitoring/enable-lambda-monitoring/)

### Example

```terraform
module "new_relic_layer" {
  source = "../../"

  # Specify your Lambda handler method, New Relic account ID, and environment variables for the lambda.
  lambda_handler        = "my_module.handler"
  new_relic_account_id  = "your_nr_account_id"
  environment_variables = {
    MY_ENV_VAR  = "foo",
    ANOTHER_VAR = "bar",
  }
}

resource "aws_lambda_function" "my_lambda" {
  function_name = "my-function"
  role          = aws_iam_role.iam_for_lambda.arn
  runtime       = "python3.8"
  filename      = "${path.module}/package.zip"

  # Use module outputs for configuring Lambda resource
  handler               = module.new_relic_layer.lambda_handler # for node js use module.new_relic_layer.lambda_handler_nodejs
  layers                = [module.new_relic_layer.layer_version_arns["python3.8"]]
  environment_variables = module.new_relic_layer.environment_variables
}

# Policy for New Relic secret access
resource "aws_iam_policy" "new_relic_secret" {
  name   = "new-relic-secret"
  policy = module.new_relic_layer.policy_json
}
```

Or to use the arm64-compatible layer:

```terraform
resource "aws_lambda_function" "my_lambda" {
  function_name = "my-function"
  role          = aws_iam_role.iam_for_lambda.arn
  runtime       = "python3.8"
  filename      = "${path.module}/package.zip"

  # Use module outputs for configuring Lambda resource
  handler               = module.new_relic_layer.lambda_handler # for node js use module.new_relic_layer.lambda_handler_nodejs
  layers                = [module.new_relic_layer.layer_version_arns["python3.8_arm64"]]
  environment_variables = module.new_relic_layer.environment_variables
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_variables"></a> [environment_variables](#input_environment_variables) | Map environment variables and values | `map(any)` | `{}` | no |
| <a name="input_lambda_handler"></a> [lambda_handler](#input_lambda_handler) | The Lambda handler method | `string` |  | yes |
| <a name="input_license_key_secret_name"></a> [license_key_secret_name](#input_license_key_secret_name) | The Secrets Manager secret name for the New Relic license key.| `string` | `NEW_RELIC_LICENSE_KEY` | no |
| <a name="input_new_relic_account_id"></a> [new_relic_account_id](#input_new_relic_account_id) | The New Relic account ID | `string` |  | yes |

## Outputs
| Name | Description |
|------|-------------|
| environment_variables | The environment variables input to the Lambda resource. Will contain the `environment_variables` merged with layer-required variables. |
| lambda_handler        | The `handler` input to the Lambda resource. Should be `newrelic_lambda_wrapper.handler`. |
| lambda_handler_nodejs | The `handler` input to the Lambda resource. Should be `newrelic-lambda-wrapper.handler` for nodejs. |
| policy_json           | The IAM policy JSON to add to the Lambda IAM role. |
| layer_version_arns    | A map of `<runtime>_<architecture>` to the **latest version** of the layer ARN for that runtime/architecture. |
| layer_arns            | A map of `<runtime>_<architecture>` to the layer ARN for that runtime/architecture. Can be used for cases where always using the latest version is not desired. |
