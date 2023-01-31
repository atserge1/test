dev:
	terraform init && terraform workspace new dev || terraform workspace select dev && terraform apply -auto-approve -var-file dev.tfvars
qa:
	terraform init && terraform workspace new qa || terraform workspace select qa && terraform apply -auto-approve -var-file qa.tfvars
prod:
	terraform init && terraform workspace new prod || terraform workspace select prod && terraform apply -auto-approve -var-file prod.tfvars

destroy_dev:
	terraform init && terraform workspace select dev && terraform destroy -auto-approve -var-file dev.tfvars
destroy_qa:
	terraform init && terraform workspace select qa && terraform destroy -auto-approve -var-file qa.tfvars
destroy_prod:
	terraform init && terraform workspace select prod && terraform destroy -auto-approve -var-file prod.tfvars
