//File structure is just key value pair..
//if we use dev.terraform.tfvars it will for variables values even if 
//we define it unless we explicity match the name of files or pass it down in command (terraform plan -var-file="dev.terraform.tfvars")
//incase of different set of values for different tfvars, it will cause error, which will require workspaces (later) to tackle on

//ec2_instance_type = "t2.micro" (TF_VAR in console)


ec2_instance_type = "t3.small" //(conflict as TF_VAR is  t3.micro ;   terraform plan will show t3.small!)
ec2_volume_config = {
  size = 20
  type = "gp3"
}

additional_tags = {
  ValuesFrom = "terraform.tfvars"
}
