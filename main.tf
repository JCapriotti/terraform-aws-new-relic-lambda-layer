locals {
  use_key_value = nonsensitive(var.license_key != null)
  use_secret    = !local.use_key_value
}

data "aws_region" "current" {
}

data "aws_secretsmanager_secret" "new_relic" {
  count = local.use_secret ? 1 : 0

  name = var.license_key_secret_name
}

data "aws_iam_policy_document" "secret" {
  count = local.use_secret ? 1 : 0

  statement {
    effect    = "Allow"
    actions   = ["secretsmanager:GetSecretValue"]
    resources = [data.aws_secretsmanager_secret.new_relic[0].arn]
  }
}

data "http" "layers" {
  url = "https://${data.aws_region.current.region}.layers.newrelic-external.com/get-layers"
  request_headers = {
    Accept = "application/json"
  }
}

