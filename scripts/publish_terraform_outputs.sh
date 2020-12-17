#!/bin/bash

set -euo pipefail

terraform_outputs=`terraform output -json terraform_outputs`

aws ssm put-parameter --name "/terraform_dns_dhcp/$ENV/outputs" \
       --description "Terraform outputs that other pipelines or processes depend on" \
       --value "$terraform_outputs" \
       --type String \
       --overwrite
