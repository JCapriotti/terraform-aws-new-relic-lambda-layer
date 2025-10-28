# Changelog

All notable changes to this project will be documented in this file.

## [2.1.0](https://github.com/JCapriotti/terraform-aws-new-relic-lambda-layer/tree/v2.1.0) (2025-10-28)

* Added support for specifying the license key directly as an input.

## [2.0.1](https://github.com/JCapriotti/terraform-aws-new-relic-lambda-layer/tree/v2.0.1) (2025-10-27)

* I hadn't properly supported using license keys stored in non-standard secret locations 
  (things other than `NEW_RELIC_LICENSE_KEY`) (#5). 
  Resolved by outputing the secret key name as an environment variable named `NEW_RELIC_LICENSE_KEY_SECRET`.

## [2.0.0](https://github.com/JCapriotti/terraform-aws-new-relic-lambda-layer/tree/v2.0.0) (2025-10-24)

### Breaking Change

* Terraform `aws` provider minimum version is 6.0.0
  * In the `aws_region` data source, now using `region` instead of the deprecated `name` output; suggested via #3.
* Terraform minimum version is 1.0.0

### Updates

* Added output named `lambda_handler_nodejs` via #2.

## [1.1.0](https://github.com/JCapriotti/terraform-aws-new-relic-lambda-layer/tree/v1.1.0) (2022-09-27)

### Updates

* Updated to Terraform `http` provider version 3.1.0, 
  and is using the `response_body` output instead of the deprecated `body` output. 

## [1.0.1](https://github.com/JCapriotti/terraform-aws-new-relic-lambda-layer/tree/v1.0.1) (2022-02-01)

### Features

* Added missing runtimes (Python 3.9, .NET Core)
* Added support for ARM64 architecture by changing the keys used by output variables.
  * Backwards compatible with 1.0.0 by defaulting old keys to use x86-64 architecture.
* New runtimes should be automatically added with refactoring of how New Relic JSON is translated into outputs.

## [1.0.0](https://github.com/JCapriotti/terraform-aws-new-relic-lambda-layer/tree/v1.0.0) (2021-07-02)

This was the original release.
