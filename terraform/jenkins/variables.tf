#########################
#VARAIABLES
#########################

variable "region" {
  default = "eu-west-1"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "private_subnet_id" {
  default = "subnet-0a67f801949444724"
}

variable "private_subnet_ids" {
  default = ["subnet-0a67f801949444724", "subnet-091a753c526f260b3"]
}

variable "subnet_count" {
  default = "2"
}

variable "subnets" {
  default = ["subnet-0a67f801949444724", "subnet-091a753c526f260b3"]
}

variable "subnet_id" {
  default = "subnet-0a67f801949444724"
}

variable "subnet_ids" {
  default = ["subnet-0a67f801949444724", "subnet-091a753c526f260b3"]
}

variable "ami_id" {
  description = "This is the Jenkins server image id"
  default     = "ami-12b1e56b"
}

variable "instance_type" {
  description = "The size of instance to launch"
  default     = "t2.medium"
}

variable "security_group_id" {
  default = ""
}

variable "create_lc" {
  description = "Whether to create launch configuration"
  default     = true
}

variable "create_asg" {
  description = "Whether to create autoscaling group"
  default     = true
}

variable "lc_name" {
  description = "Creates a unique name for launch configuration beginning with the specified prefix"
  default     = "ecs_lc"
}

variable "asg_name" {
  description = "Creates a unique name for autoscaling group beginning with the specified prefix"
  default     = "jenkins-asg"
}

variable "launch_configuration" {
  description = "The name of the launch configuration to use (if it is created outside of this module)"
  default     = "jenkins-lc"
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with launched instances"
  default     = ""
}

variable "key_name" {
  description = "The key name that should be used for the instance"
  default     = "itsnwe-014-uk-v1"
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the launch configuration"
  type        = "list"
  default     = []
}

variable "associate_public_ip_address" {
  description = "Associate a public ip address with an instance in a VPC"
  default     = false
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = ""
}

variable "enable_monitoring" {
  description = "Enables/disables detailed monitoring. This is enabled by default."
  default     = true
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance"
  type        = "list"
  default     = []
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = "list"
  default     = []
}

variable "ephemeral_block_device" {
  description = "Customize Ephemeral (also known as 'Instance Store') volumes on the instance"
  type        = "list"
  default     = []
}

variable "instance_group" {
  default     = "jenkins"
  description = "The name of the instances that you consider as a group"
}

variable "security_group" {
  default = ""
}

variable "private_key_path" {
  default = "/Users/corighose/Documents/aws/itsnwe-014-uk-v1.pem"
}

variable "file_name" {
  default = "itsnwe-014-uk-v1.pem"
}

variable "environment" {
  description = "The programming environment - poc, dev, uat, prod, etc."
  default     = "dev"
}

variable "customer_name" {
  description = "The customer unique name"
  default     = ""
}

variable "vpc_id" {
  default = ""
}

variable "jenkins_sg" {
  description = "Jenkins security group"
  default     = ""
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in"
  type        = "list"
  default     = []
}

variable "jenkins_web_port" {
  default = "8080"
}

variable "int_web_port" {
  description = "ELB port assigned for internal WEB communication"
  default     = "8080"
}

variable "ext_web_port" {
  description = "ELB port assigned for external WEB communication"
  default     = "80"
}

variable "jenkins_jnlp_port" {
  description = "Default port for Jenkins JNLP slave agents"
  default     = "50000"
}

variable "jenkins_ext_web_port" {
  description = "Default external port for Jenkins web services"
  default     = "80"
}

# ECS
variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  default     = "jenkins"
}

variable "desired_service_count" {
  default     = 1
  description = "Desired number of ECS services."
}

variable "ecs_task_image" {
  description = "The specified Docker image to use"
  default     = "943895596097.dkr.ecr.eu-west-1.amazonaws.com/jenkins-ecr"
}

variable "ecs_task_network_mode" {
  description = "The Docker networking mode to use for the containers in the task. The valid values are none, bridge, and host"
  default     = "bridge"
}

variable "ecs_task_volume_name" {
  description = "The name of the volume. This name is referenced in the sourceVolume parameter of container definition in the mountPoints section"
  default     = "jenkins-home"
}

variable "ecs_task_volume_host_path" {
  description = "The path on the host container instance that is presented to the container. If not set, ECS will create a nonpersistent data volume that starts empty and is deleted after the task has finished"
  default     = "/data/"
}

variable "ecs_task_container_path" {
  description = "The path on the container that is presented to the host container instance"
  default     = "/var/jenkins_home"
}

variable "ecs_lc_image_id" {
  description = "The AMI image ID for the ECS instance"
  default     = "ami-12b1e56b"
}

variable "ecs_lc_instance_type" {
  description = "The EC2 instance type for the ECS instance"
  default     = "t2.medium"
}

variable "jenkins_lc" {
  default = ""
}

variable "ecs_lc_data_block_device_name" {
  description = "The name of the EBS data block device for the ECS instance"
  default     = "/dev/xvdz"
}

variable "ecs_task_name" {
  description = "A name for ecs task definition"
  default     = "jenkins"
}

variable "availability_zones" {
  type    = "list"
  default = []
}

variable "ecs_config" {
  default = "jenkins"
}

variable "ecs_task_family" {
  description = "A unique name for your task definition"
  default     = "jenkins-master"
}

variable "ecs_user_data_efs_mountpoint" {
  description = "EFS mount point on the ECS instance"
  default     = "/data"
}

variable "ecs_user_data_efs_owner" {
  description = "EFS mount point owner on the ECS instance"
  default     = "1000"
}

variable "ecs_lc_data_block_device_type" {
  default = "gp2"
}

variable "ecs_lc_data_block_device_size" {
  default = "24"
}

variable "ecs_lc_root_device_type" {
  default = "gp2"
}

variable "ecs_lc_root_device_size" {
  default = "20"
}

### Cluster Scaling Policies

variable "asg_autoscaling_group_name" {
  default = "jenkins-ecs"
}

variable "termination_policies" {
  description = "A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default"
  type        = "list"
  default     = ["Default"]
}

variable "load_balancers" {
  description = "A list of elastic load balancer names to add to the autoscaling group names"
  default     = []
}

variable "protect_from_scale_in" {
  description = "Allows setting instance protection. The autoscaling group will not select instances with this setting for terminination during scale in events."
  default     = false
}

variable "scale_up_adjustment_type" {
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity"
  default     = "ChangeInCapacity"
}

variable "scale_up_estimated_instance_warmup" {
  description = "The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics"
  default     = "300"
}

variable "scale_up_metric_aggregation_type" {
  description = "The aggregation type for the policy's metrics"
  default     = "Average"
}

variable "scale_up_policy_type" {
  description = "The policy type, either SimpleScaling or StepScaling"
  default     = "StepScaling"
}

variable "scale_up_metric_interval_lower_bound" {
  description = " The lower bound for the difference between the alarm threshold and the CloudWatch metric"
  default     = "0"
}

variable "scale_up_scaling_adjustment" {
  description = "The number of instances by which to scale"
  default     = "2"
}

variable "scale_down_adjustment_type" {
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity"
  default     = "PercentChangeInCapacity"
}

variable "scale_down_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start"
  default     = "30"
}

variable "scale_down_scaling_adjustment" {
  description = "The percentage of instances by which to scale down"
  default     = "-50"
}

# CloudWatch Alarms
variable "scale_up_alarm_metric_name" {
  description = "The name for the alarm's associated metric"
  default     = "CPUReservation"
}

variable "scale_up_alarm_namespace" {
  description = "The namespace for the alarm's associated metric"
  default     = "ECS"
}

variable "scale_up_alarm_comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold"
  default     = "GreaterThanOrEqualToThreshold"
}

variable "scale_up_alarm_statistic" {
  description = "The statistic to apply to the alarm's associated metric"
  default     = "Maximum"
}

variable "scale_up_alarm_threshold" {
  description = "The value against which the specified statistic is compared"
  default     = "20"
}

variable "scale_up_alarm_period" {
  description = "The period in seconds over which the specified statistic is applied"
  default     = "30"
}

variable "scale_up_alarm_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  default     = "1"
}

variable "scale_up_alarm_treat_missing_data" {
  description = "Sets how this alarm is to handle missing data points"
  default     = "notBreaching"
}

variable "scale_down_alarm_metric_name" {
  description = "The name for the alarm's associated metric"
  default     = "CPUReservation"
}

variable "scale_down_alarm_namespace" {
  description = "The namespace for the alarm's associated metric"
  default     = "ECS"
}

variable "scale_down_alarm_comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold"
  default     = "LessThanThreshold"
}

variable "scale_down_alarm_statistic" {
  description = "The statistic to apply to the alarm's associated metric"
  default     = "Maximum"
}

variable "scale_down_alarm_threshold" {
  description = "The value against which the specified statistic is compared"
  default     = "50"
}

variable "scale_down_alarm_period" {
  description = "The period in seconds over which the specified statistic is applied"
  default     = "120"
}

variable "scale_down_alarm_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  default     = "1"
}

variable "scale_down_alarm_treat_missing_data" {
  description = "Sets how this alarm is to handle missing data points"
  default     = "notBreaching"
}
