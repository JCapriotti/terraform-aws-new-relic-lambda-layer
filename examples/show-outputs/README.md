# Example - Show Module Outputs

Shows the outputs that the module provides.

## Usage

To run this example you need to execute:

```commandline
terraform init
terraform plan
terraform apply
```

Example Output:
```commandline
> terraform apply --auto-approve

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

environment_variables = {
  "ANOTHER_VAR" = "bar"
  "MY_ENV_VAR" = "foo"
  "NEW_RELIC_ACCOUNT_ID" = "your_nr_account_id"
  "NEW_RELIC_LAMBDA_HANDLER" = "my_module.handler"
}
lambda_handler = "newrelic_lambda_wrapper.handler"
layer_arns = {
  "dotnetcore3.1" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension"
  "dotnetcore3.1_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtensionARM64"
  "dotnetcore3.1_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension"
  "java11" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava11"
  "java11_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava11ARM64"
  "java11_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava11"
  "java8.al2" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava8"
  "java8.al2_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava8ARM64"
  "java8.al2_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava8"
  "nodejs10.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS10X"
  "nodejs10.x_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS10X"
  "nodejs12.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS12X"
  "nodejs12.x_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS12XARM64"
  "nodejs12.x_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS12X"
  "nodejs14.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS14X"
  "nodejs14.x_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS14XARM64"
  "nodejs14.x_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS14X"
  "nodejs8.10" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS810"
  "nodejs8.10_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS810"
  "provided" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension"
  "provided.al2" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension"
  "provided.al2_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtensionARM64"
  "provided.al2_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension"
  "provided_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtensionARM64"
  "provided_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension"
  "python2.7" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython27"
  "python2.7_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython27"
  "python3.6" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython36"
  "python3.6_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython36"
  "python3.7" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython37"
  "python3.7_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython37"
  "python3.8" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython38"
  "python3.8_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython38ARM64"
  "python3.8_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython38"
  "python3.9" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython39"
  "python3.9_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython39ARM64"
  "python3.9_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython39"
}
layer_version_arns = {
  "dotnetcore3.1" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension:20"
  "dotnetcore3.1_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtensionARM64:4"
  "dotnetcore3.1_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension:20"
  "java11" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava11:22"
  "java11_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava11ARM64:7"
  "java11_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava11:22"
  "java8.al2" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava8:13"
  "java8.al2_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava8ARM64:7"
  "java8.al2_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava8:13"
  "nodejs10.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS10X:55"
  "nodejs10.x_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS10X:55"
  "nodejs12.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS12X:67"
  "nodejs12.x_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS12XARM64:12"
  "nodejs12.x_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS12X:67"
  "nodejs14.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS14X:37"
  "nodejs14.x_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS14XARM64:11"
  "nodejs14.x_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS14X:37"
  "nodejs8.10" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS810:46"
  "nodejs8.10_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS810:46"
  "provided" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension:20"
  "provided.al2" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension:20"
  "provided.al2_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtensionARM64:4"
  "provided.al2_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension:20"
  "provided_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtensionARM64:4"
  "provided_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicLambdaExtension:20"
  "python2.7" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython27:53"
  "python2.7_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython27:53"
  "python3.6" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython36:68"
  "python3.6_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython36:68"
  "python3.7" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython37:69"
  "python3.7_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython37:69"
  "python3.8" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython38:65"
  "python3.8_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython38ARM64:10"
  "python3.8_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython38:65"
  "python3.9" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython39:10"
  "python3.9_arm64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython39ARM64:9"
  "python3.9_x86_64" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython39:10"
}
policy_json = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": "secretsmanager:GetSecretValue",
      "Resource": "arn:aws:secretsmanager:us-east-1:691383652347:secret:NEW_RELIC_LICENSE_KEY-CGqrtl"
    }
  ]
}
EOT
```
