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

  # Temporary calculation of environment variable output
  env_vars = merge(var.environment_variables,
    local.use_key_value ? { NEW_RELIC_LICENSE_KEY = var.license_key } : null,
    local.use_secret ? { NEW_RELIC_LICENSE_KEY_SECRET = var.license_key_secret_name } : null,
    {
      NEW_RELIC_ACCOUNT_ID     = var.new_relic_account_id,
      NEW_RELIC_LAMBDA_HANDLER = var.lambda_handler,
  })
}

output "environment_variables" {
  value = local.env_vars
}

output "lambda_handler" {
  value = "newrelic_lambda_wrapper.handler"
}

output "lambda_handler_nodejs" {
  value = "newrelic-lambda-wrapper.handler"
}

output "policy_json" {
  value = local.use_secret ? data.aws_iam_policy_document.secret[0].json : ""
}

output "layer_version_arns" {
  value = local.layer_version_arns
}

output "layer_arns" {
  value = local.layer_arns
}
