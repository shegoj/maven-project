###################################
# JENKINS INSTANCE Security Group
####################################

resource "aws_security_group" "jenkins_sg" {
  name_prefix = "${var.ecs_cluster_name}-sg-"
  description = "Jenkins Instance Security Group"
  vpc_id      = "${data.terraform_remote_state.vpc_state.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 8090
    to_port     = 8090
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 5985
    to_port     = 5985
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 5986
    to_port     = 5986
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 50000
    to_port     = 50000
    cidr_blocks = ["10.0.0.0/8"]
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "jenkins-sg"
  }
}

/*
##########################
# JENKINS EC2 INSTANCE
##########################

resource "aws_instance" "jenkins_server" {
  ami                  = "${data.aws_ami.asg_ami.id}"
  instance_type        = "${var.instance_type}"
  subnet_id            = "${var.private_subnet_id}"
  key_name             = "${var.key_name}"
  security_groups      = ["${aws_security_group.jenkins_sg.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.jenkins_ec2_instance_profile.id}"
  user_data            = "${data.template_file.jenkins_server_def.rendered}"

  connection {
    user        = "ubuntu"
    private_key = "${file(var.private_key_path)}"
  }

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      encrypted             = true
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size           = "50"
      volume_type           = "gp2"
      delete_on_termination = true
    },
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "jenkins-backup-server"
    Terraform = true
  }
}
*/


/*
##########################
# JENKINS EC2 INSTANCE 2
##########################

resource "aws_instance" "jenkins_server2" {
  ami                  = "ami-96b6e2ef"
  instance_type        = "${var.instance_type}"
  subnet_id            = "${var.private_subnet_id}"
  key_name             = "${var.key_name}"
  security_groups      = ["${aws_security_group.jenkins_sg.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.jenkins_ec2_instance_profile.id}"
  user_data            = "${data.template_file.jenkins_server_def.rendered}"

  connection {
    user        = "ubuntu"
    private_key = "${file(var.private_key_path)}"
  }

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "22"
      encrypted             = true
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size           = "20"
      volume_type           = "gp2"
      delete_on_termination = true
    },
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "jenkins-server-2"
    Terraform = "true"
  }
}

resource "aws_instance" "jenkins_server3" {
  ami                  = "ami-07652d7e"
  instance_type        = "${var.instance_type}"
  subnet_id            = "${var.private_subnet_id}"
  key_name             = "${var.key_name}"
  security_groups      = ["${aws_security_group.jenkins_sg.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.jenkins_ec2_instance_profile.id}"
  user_data            = "${data.template_file.jenkins_server_def.rendered}"

  connection {
    user        = "ubuntu"
    private_key = "${file(var.private_key_path)}"
  }

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "22"
      encrypted             = true
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size           = "20"
      volume_type           = "gp2"
      delete_on_termination = true
    },
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "jenkins-server-3"
    Terraform = "true"
  }
}

resource "aws_instance" "jenkins_server4" {
  ami                  = "ami-bfb5fec6"
  instance_type        = "${var.instance_type}"
  subnet_id            = "${var.private_subnet_id}"
  key_name             = "${var.key_name}"
  security_groups      = ["${aws_security_group.jenkins_sg.id}"]
  iam_instance_profile = "${aws_iam_instance_profile.jenkins_ec2_instance_profile.id}"
  user_data            = "${data.template_file.jenkins_server_def.rendered}"

  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "22"
      encrypted             = true
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size           = "20"
      volume_type           = "gp2"
      delete_on_termination = true
    },
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "jenkins-server-4"
    Terraform = "true"
  }
}

/*


###################################
# JENKINS INSTANCE Security Group
####################################

resource "aws_security_group" "jenkins_sg" {
  name_prefix = "${var.ecs_cluster_name}-sg-"
  description = "Jenkins Instance Security Group"
  vpc_id      = "${data.terraform_remote_state.vpc_state.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 8090
    to_port     = 8090
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 5985
    to_port     = 5985
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 5986
    to_port     = 5986
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 50000
    to_port     = 50000
    cidr_blocks = ["10.0.0.0/8"]
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "jenkins-sg"
  }
}

##########################
# JENKINS EC2 INSTANCE
##########################

resource "aws_instance" "jenkins_server" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.public_subnet_id}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${aws_security_group.jenkins_sg.id}"]
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.jenkins_ec2_instance_profile.id}"
  user_data                   = "${data.template_file.jenkins_server_def.rendered}"
  ]

  connection {
    user        = "ubuntu"
    private_key = "${file(var.private_key_path)}"
  }

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "22"
      encrypted             = true
      delete_on_termination = true
    },

  root_block_device = [
    {
      volume_size           = "20"
      volume_type           = "gp2"
      delete_on_termination = true
    },
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name      = "jenkins-server"
    Terraform = "true"
  }
}
*/

