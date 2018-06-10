terraform {
  backend "s3" {
    region  = "eu-west-1"
    bucket  = "tf-state-maven"
    key     = "tf_jenkins.tfstate"
    encrypt = true
  }
}
