# Changelog

All notable changes to this project will be documented in this file.

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
