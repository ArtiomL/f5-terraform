tag_name        = "F5Labs"
tag_environment = "DEV"
aws_region      = "eu-central-1"
vpc_cidr        = "10.200.0.0/16"
az_names        = ["eu-central-1a"]
mgmt_cidrs      = ["10.200.113.0/24"]
ext_cidrs       = ["10.200.115.0/24"]
int_cidrs       = ["10.200.112.0/24"]
key_path        = "/home/user/.ssh/id_rsa.pub"
mgmt_asrc       = [""]
bigip_cft       = "https://s3.amazonaws.com/f5-cft/f5-existing-stack-byol-3nic-bigip.template"
bigip_lic1      = "ABCDE-FGHIJ-KLMNO-PQRST-UVWXYZA"
tags_shared = {
  Owner        = "T.Durden"
  BusinessUnit = "R&D"
  CostCenter   = "7741"
  Project      = "Mayhem"
}
