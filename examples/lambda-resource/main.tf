provider "aws" {
  region = "us-east-1"
}

module "new_relic_layer" {
  source = "../../"

  lambda_handler       = "my_module.handler"
  new_relic_account_id = "your_new_relic_account_id"

  environment_variables = {
    MY_ENV_VAR  = "foo",
    ANOTHER_VAR = "bar",
  }
}

resource "aws_lambda_function" "my_lambda" {
  function_name    = "my-function"
  role             = aws_iam_role.iam_for_lambda.arn
  runtime          = "python3.8"
  filename         = "${path.module}/package.zip"
  source_code_hash = filebase64sha256("${path.module}/package.zip")

  # --> Setup for handler, layer, and environment variables
  handler               = module.new_relic_layer.lambda_handler
  layers                = [module.new_relic_layer.layer_version_arns["python3.8"]]
  environment {
    variables = module.new_relic_layer.environment_variables
  }
}

# --> Policy for New Relic secret access
resource "aws_iam_policy" "new_relic_secret" {
  name   = "new-relic-secret"
  policy = module.new_relic_layer.policy_json
}

resource "aws_iam_role_policy_attachment" "new_relic_secret" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.new_relic_secret.arn
}

# Normal lambda role
data "aws_iam_policy_document" "lambda_role" {
  statement {
    actions = [
      "sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = [
        "lambda.amazonaws.com"]
    }
  }
}
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_role.json
}
