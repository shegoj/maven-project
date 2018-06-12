##########################
#     EC2 INSTANCES      #
##########################

resource "aws_instance" "jenkins_masters" {
  ami                           =       "ami-ebd02392"
  instance_type                 =       "t2.micro"
#  subnet_id                     =       "${aws_subnet.jenkins_public.id}"
  key_name                      =       "lagos"
 # user_data                     =       "${data.template_file.jenkins_master.rendered}"
  associate_public_ip_address   =       true
  #security_groups               =       ["${aws_security_group.jenkins.id}"]
  count                         =       "1"
}

