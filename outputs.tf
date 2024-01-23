locals {
  layers = jsondecode(data.http.layers.response_body).Layers

  //noinspection HILUnresolvedReference
  versions_with_runtimes = transpose({
    for layer in local.layers :
      layer.LatestMatchingVersion.LayerVersionArn =>
        [
          for x in setproduct(layer.LatestMatchingVersion.CompatibleRuntimes, lookup(layer.LatestMatchingVersion, "CompatibleArchitectures", ["x86_64"])) :
                "${x[0]}_${x[1]}"
        ]
  })

  //noinspection HILUnresolvedReference
  layers_with_runtimes = transpose({
    for layer in local.layers :
      layer.LayerArn =>
        [
          for x in setproduct(layer.LatestMatchingVersion.CompatibleRuntimes, lookup(layer.LatestMatchingVersion, "CompatibleArchitectures", ["x86_64"])) :
                "${x[0]}_${x[1]}"
        ]
  })

  # The next two sections make this backwards compatible, by adding a key without an architecture
  layer_version_arns = merge({
    for k, v in local.versions_with_runtimes : k => v[0]
  }, {
    for k, v in local.versions_with_runtimes : replace(k, "_x86_64", "") => v[0] if replace(k, "_x86_64", "") != k
  })

  layer_arns = merge({
    for k, v in local.layers_with_runtimes : k => v[0]
  }, {
    for k, v in local.layers_with_runtimes : replace(k, "_x86_64", "") => v[0] if replace(k, "_x86_64", "") != k
  })
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

output "lambda_handler_nodejs" {
  value = "newrelic-lambda-wrapper.handler"
}

output "policy_json" {
  value = data.aws_iam_policy_document.secret.json
}

output "layer_version_arns" {
  value = local.layer_version_arns
}

output "layer_arns" {
  value = local.layer_arns
}

