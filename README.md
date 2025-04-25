# temp-terraform

## aws 　確認コマンド

```
which aws
```

## terraform のリソース置き場作成コマンド

```
bash create-backend-s3.sh
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
