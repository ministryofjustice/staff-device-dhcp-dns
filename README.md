# DNS / DHCP AWS Infrastructure

## Run locally

Initialise the repo: 
```shell
  aws-vault exec moj-pttp-shared-services -- terraform init
```

Select your workspace
```shell
  aws-vault exec moj-pttp-shared-services -- terraform workspace select "your-user-name"
```

Select your workspace
```shell
  aws-vault exec moj-pttp-shared-services -- terraform apply
```
