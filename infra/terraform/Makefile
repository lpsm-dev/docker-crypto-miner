default: apply

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade

clean:
	terraform destroy -auto-approve

connect:
	terraform init -get=false

validate:
	terraform validate

apply: fmt connect validate
	terraform apply
