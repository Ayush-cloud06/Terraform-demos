//Override the conflicting variable values from .tfvars
//incase of multiple .auto.tfvars : lexical order files which is toward ends will override the value from the file towards start -- Relatively
// 

additional_tags = {
  ValuesFrom = "prod.auto.tfvars"
}
//ec2_instance_size = "t3.micro" # Will over ride t2.micro of terraform.tfvars

//ec2_instance_type = "t3.large" //again conflict with .tfvars and TF_VAR

# will override the other two and plan will show t3.large
# in terminal -var=ec2_instance_type="" will override the audo.tfvars itself
