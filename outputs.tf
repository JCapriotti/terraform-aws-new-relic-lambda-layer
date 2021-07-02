locals {
  layers = jsondecode(data.http.layers.body).Layers
}

output "environment_variables" {
  value = merge(var.environment_variables, {
    NEW_RELIC_ACCOUNT_ID = var.new_relic_account_id,
    NEW_RELIC_LAMBDA_HANDLER = var.lambda_handler
  })
}

output "lambda_handler" {
  value = "newrelic_lambda_wrapper.handler"
}

output "policy_json" {
  value = data.aws_iam_policy_document.secret.json
}

output "layer_version_arns" {
  //noinspection HILUnresolvedReference
  value = {for runtime, layer_name in local.runtime_map : runtime => local.layers[index(local.layers.*.LayerName, layer_name)].LatestMatchingVersion.LayerVersionArn}
}

output "layer_arns" {
  //noinspection HILUnresolvedReference
  value = {for runtime, layer_name in local.runtime_map : runtime => local.layers[index(local.layers.*.LayerName, layer_name)].LayerArn}
}
