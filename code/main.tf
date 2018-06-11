data "template_file" "jenkins_master" {
  template      =       "${file ("jenkins.yml")}"

  vars {
    hostname        =       "JENKINS_PIPELINE"
    environment     =       "PROD"
    login_user      =       "admin"
    login_password  =       "admin"
  }
}


resource "aws_autoscaling_group" "jenkins-asg" {
  availability_zones   = ["eu-west-1a"]
  name                 = "DoxaApp_asg"
  max_size             = "0"
  min_size             = "0"
  desired_capacity     = "0"
  force_delete         = true
  launch_configuration = "${aws_launch_configuration.jenkins-lc.name}"

  #vpc_zone_identifier = ["${split(",", var.availability_zones)}"]
  tag {
    key                 = "Name"
    value               = "lagos"
    propagate_at_launch = "true"
  }
}

resource "aws_autoscaling_schedule" "jenkins-schedule" {
  scheduled_action_name  = "Jenkins"
  min_size               = 1
  max_size               = 1
  desired_capacity       = 1
  start_time           = "2018-06-07T15:00:11Z"
  end_time             = "2018-06-07T16:00:00Z"
  autoscaling_group_name = "${aws_autoscaling_group.jenkins-asg.name}"
}

resource "aws_launch_configuration" "jenkins-lc" {
  name          = "Doxa_terraform-lc"
  image_id      = "ami-ebd02392"
  instance_type = "t2.micro"

  # Security group
  security_groups = ["${aws_security_group.default.id}"]
  user_data       =  "${data.template_file.jenkins_master.rendered}"
  key_name        = "lagos"
}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "default" {
  name        = "Doxa_terraform__sg"
  description = "Used in the terraform"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
cidr_blocks = ["0.0.0.0/0"]
  }
}
