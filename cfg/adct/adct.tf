# AMI
data "aws_ami" "ubuntu" {
	most_recent = true
	filter {
		name = "name"
		values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
	}
	filter {
		name = "virtualization-type"
		values = ["hvm"]
	}
	owners = ["099720109477"] #Canonical
}

# Instance
resource "aws_instance" "adct" {
	ami = "${data.aws_ami.ubuntu.id}"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.main.id}"
	subnet_id = "${aws_subnet.int.id}"
	vpc_security_group_ids = ["${aws_security_group.int.id}"]
	associate_public_ip_address = true
	source_dest_check = false
	user_data = "${file("install.sh")}"
	tags {
		Name = "inADCT${count.index}"
	}
	count = 3
}
