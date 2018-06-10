######################
## PROVIDER
######################

provider "aws" {
  region = "eu-west-1"
}

#########################
## DATA FILES
#########################

data "terraform_remote_state" "vpc_state" {
  backend = "s3"

  config {
    bucket = "tf-state-jenkins"
    region = "eu-west-1"
    key    = "tf_vpc.tfstate"
  }
}
/*
data "template_file" "jenkins_server_def" {
  template = "${file("user_data/user_data_jenkins_server.sh")}"


data "aws_ami" "jenkins_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["jenkins-ami*"]
  }
}
*/
