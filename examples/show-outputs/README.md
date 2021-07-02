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
  "java11" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava11"
  "java8" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava8"
  "java8.al2" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava8"
  "nodejs10.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS10X"
  "nodejs12.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS12X"
  "nodejs14.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS14X"
  "nodejs8.10" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS810"
  "python2.7" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython27"
  "python3.6" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython36"
  "python3.7" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython37"
  "python3.8" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython38"
}
layer_version_arns = {
  "java11" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava11:10"
  "java8" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava8:1"
  "java8.al2" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicJava8:1"
  "nodejs10.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS10X:44"
  "nodejs12.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS12X:42"
  "nodejs14.x" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS14X:12"
  "nodejs8.10" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicNodeJS810:42"
  "python2.7" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython27:41"
  "python3.6" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython36:41"
  "python3.7" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython37:42"
  "python3.8" = "arn:aws:lambda:us-east-1:451483290750:layer:NewRelicPython38:38"
}
policy_json = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": "secretsmanager:GetSecretValue",
      "Resource": "arn:aws:secretsmanager:us-east-1:123456789012:secret:NEW_RELIC_LICENSE_KEY-CGqrtl"
    }
  ]
}
EOT
```
