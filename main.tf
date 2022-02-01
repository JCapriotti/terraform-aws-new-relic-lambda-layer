data "aws_region" "current" {
}

data "aws_secretsmanager_secret" "new_relic" {
  name = var.license_key_secret_name
}

data "aws_iam_policy_document" "secret" {
  statement {
    effect    = "Allow"
    actions   = ["secretsmanager:GetSecretValue"]
    resources = [data.aws_secretsmanager_secret.new_relic.arn]
  }
}

data "http" "layers" {
  url = "https://${data.aws_region.current.name}.layers.newrelic-external.com/get-layers"
  request_headers = {
    Accept = "application/json"
  }
}
