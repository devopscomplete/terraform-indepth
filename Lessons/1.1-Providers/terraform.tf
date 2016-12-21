variable "region" { default = "us-east-1" }

provider "aws" {
  region = "${var.region}"
  profile = "devops"
}

data "aws_region" "current" {
  current = true
}

data "aws_ami" "ubuntu" {
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
  }

  owners = ["099720109477"]
  most_recent = true
}

output "region" {
  value = "${data.aws_region.current.name}"
}

output "ami_id" {
  value = "${data.aws_ami.ubuntu.id}"
}
