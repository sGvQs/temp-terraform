# temp-terraform

## aws 　確認コマンド

```
which aws
```

## init command

```
terraform init -backend-config "bucket=temp-dev-infra-tfstate"
```

## plan

```
terraform plan -var-file=env/dev.tfvars
```

## apply

```
terraform apply -var-file=env/dev.tfvars
```

## destroy

```
terraform destroy -var-file=env/dev.tfvars
```
