#!/bin/bash

aws s3api create-bucket --bucket temp-dev-infra-tfstate --region ap-northeast-1 --create-bucket-configuration LocationConstraint=ap-northeast-1
