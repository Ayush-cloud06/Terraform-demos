//Override the conflicting variable values from .tfvars
//incase of multiple .auto.tfvars : lexical order files which is toward ends will override the value from the file towards start -- Relatively
// 


ec2_instance_size = "t3.micro" # Will over ride t2.micro of terraform.tfvars
