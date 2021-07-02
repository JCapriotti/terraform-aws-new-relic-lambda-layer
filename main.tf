locals {
  runtimes = [
    "java11",
    "java8",
    "java8.al2",
    "nodejs10.x",
    "nodejs12.x",
    "nodejs14.x",
    "nodejs8.10",
    "python2.7",
    "python3.6",
    "python3.7",
    "python3.8",
  ]
  layers_names = [
    "NewRelicJava11",
    "NewRelicJava8",
    "NewRelicJava8",
    "NewRelicNodeJS10X",
    "NewRelicNodeJS12X",
    "NewRelicNodeJS14X",
    "NewRelicNodeJS810",
    "NewRelicPython27",
    "NewRelicPython36",
    "NewRelicPython37",
    "NewRelicPython38",
  ]
  runtime_map = zipmap(local.runtimes, local.layers_names)
}

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
