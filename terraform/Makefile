# Author: Collins Orighose - Jan 2018 \

make_image: packer build ....
	@cd jenkins/jenkins

init_jenkins: clean_jenkins
	@cd jenkins/ && \
	terraform init

plan_jenkins: init_jenkins fmt_jenkins get_jenkins
	@cd jenkins/ && \
	terraform plan -out=terraform.tfplan

plan_jenkins_download: init_jenkins clone_app_files fmt_jenkins get_jenkins
	@cd jenkins/ && \
	terraform plan -out=terraform.tfplan

jenkins: plan_jenkins
	@cd jenkins/ && \
	terraform apply terraform.tfplan

jenkins_download: clone_app_files plan_jenkins 
	@cd jenkins/ && \
	terraform apply terraform.tfplan

outputs_jenkins: init_jenkins
	@cd jenkins/ && \
	terraform output

plan_destroy_jenkins: init_jenkins
	@cd jenkins/ && \
	terraform plan -destroy

destroy_jenkins: plan_destroy_jenkins
	@cd jenkins/ && \
	terraform destroy

fmt_jenkins:
	@cd jenkins/ && \
	terraform fmt

get_jenkins:
	@cd jenkins/ && \
	terraform get

clone_app_files:
	@echo "Downloading file from repo..."
	@cd ./terraform_files/application && \
	rm -rf * && \
	git clone https://code.deloittecloud.co.uk/ITS/Project_Questionnaire.git && \
	cd Project_Questionnaire/Lambda_function && \
	zip sendmail_for_questionnaire.zip sendmail_for_questionnaire.js
	cd ../../../..


clean_jenkins:
	@echo "Cleaning up..."
	@cd jenkins/ && \
	rm -rf ./.terraform *.tfstate *.backup

version_packer:
	@echo "running packer codes"
	@cd packer/ && \
	packer -v
	@echo "error, nothing to do"


#-------------------------------------
# VPC
#-------------------------------------
# Author:
# Collins Orighose - June 2018
# 
init_vpc: clean_vpc
	@cd ./terraform/vpc/scripts && \
	./createstate_s3bucket.sh tf-state-itsnwe014-layers eu-west-1  && \
	cd .. && \
	terraform init -backend=true -backend-config="backend.config"


plan_vpc: init_vpc fmt_vpc get_vpc
	@cd terraform/vpc && \
	terraform plan -out=terraform.tfplan
	
vpc: plan_vpc
	@cd terraform/vpc && \
	terraform apply terraform.tfplan

outputs_vpc: init_vpc
	@cd terraform/vpc && \
	terraform output

plan_destroy_vpc: init_vpc
	@cd terraform/vpc && \
	terraform plan -destroy

destroy_vpc: plan_destroy_vpc
	@cd terraform/vpc && \
	terraform destroy

fmt_vpc:
	@cd terraform/vpc && \
	terraform fmt

get_vpc:
	@cd terraform/vpc && \
	terraform get

clean_vpc:
	@echo "Cleaning up..."
	@cd terraform/vpc && \
	rm -rf ./.terraform *.tfstate *.backup

#-------------------------------------
# IAM
#-------------------------------------
# Author:
# Collins Orighose - June 2018
#
init_iam: clean_iam
	@cd discover-deloitte/terraform/iam && \
	terraform init -backend=true -backend-config="backend.config"

plan_iam: init_iam fmt_iam get_iam
	@cd discover-deloitte/terraform/iam && \
	terraform plan -out=terraform.tfplan
	
iam: plan_iam
	@cd discover-deloitte/terraform/iam && \
	terraform apply terraform.tfplan

outputs_iam: init_iam
	@cd discover-deloitte/terraform/iam && \
	terraform output

plan_destroy_iam: init_iam
	@cd discover-deloitte/terraform/iam && \
	terraform plan -destroy

destroy_iam: plan_destroy_iam
	@cd discover-deloitte/terraform/iam && \
	terraform destroy

fmt_iam:
	@cd discover-deloitte/terraform/iam && \
	terraform fmt

get_iam:
	@cd discover-deloitte/terraform/iam && \
	terraform get

clean_iam:
	@echo "Cleaning up..."
	@cd discover-deloitte/terraform/iam && \
	rm -rf ./.terraform *.tfstate *.backup


#-------------------------------------
# elb 014
#-------------------------------------
# Author:
# Collins Orighose - June 2018
# 
init_elb: clean_elb
	@cd discover-deloitte/terraform/elb && \
	terraform init -backend=true -backend-config="backend.config"

plan_elb: init_elb fmt_elb get_elb
	@cd discover-deloitte/terraform/elb && \
	terraform plan -out=terraform.tfplan
	
elb: plan_elb
	@cd discover-deloitte/terraform/elb && \
	terraform apply terraform.tfplan

outputs_elb: init_elb
	@cd discover-deloitte/terraform/elb && \
	terraform output

plan_destroy_elb: init_elb
	@cd discover-deloitte/terraform/elb && \
	terraform plan -destroy

destroy_elb: plan_destroy_elb
	@cd discover-deloitte/terraform/elb && \
	terraform destroy

fmt_elb:
	@cd discover-deloitte/terraform/elb && \
	terraform fmt

get_elb:
	@cd discover-deloitte/terraform/elb && \
	terraform get

clean_elb:
	@echo "Cleaning up..."
	@cd discover-deloitte/terraform/elb && \
	rm -rf ./.terraform *.tfstate *.backup


#-------------------------------------
# asg
#-------------------------------------
# Author:
# Collins Orighose - June 2018
# 
init_asg: clean_asg
	@cd discover-deloitte/terraform/asg && \
	terraform init -backend=true -backend-config="backend.config"

plan_asg: init_asg fmt_asg get_asg
	@cd discover-deloitte/terraform/asg && \
	terraform plan -out=terraform.tfplan
	
asg: plan_asg
	@cd discover-deloitte/terraform/asg && \
	terraform apply terraform.tfplan

outputs_asg: init_asg
	@cd discover-deloitte/terraform/asg && \
	terraform output

plan_destroy_asg: init_asg
	@cd discover-deloitte/terraform/asg && \
	terraform plan -destroy

destroy_asg: plan_destroy_asg
	@cd discover-deloitte/terraform/asg && \
	terraform destroy

fmt_asg:
	@cd discover-deloitte/terraform/asg && \
	terraform fmt

get_asg:
	@cd discover-deloitte/terraform/asg && \
	terraform get

clean_asg:
	@echo "Cleaning up..."
	@cd discover-deloitte/terraform/asg && \
	rm -rf ./.terraform *.tfstate *.backup


