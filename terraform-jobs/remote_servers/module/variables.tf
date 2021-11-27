# EC2 VARIABLES
variable ami_values {
    type = list
    default = []
}
variable server_amis {}

variable name_list_index {}

variable instance_type {} 
variable key_name {}

variable server_name_list {
   type = list
   default = ["dev","prod"]
}
variable server_name {}

variable server_role {}

variable server_environment {}   

# SECURITY_GROUP VARIABLES
variable from_port {}
variable to_port {}

variable from_port2 {
    default = []
}

variable to_port2 {
    default = []
}
variable protocol {}

# SUBNET VARIABLES
variable public_subnet_cidr_block{
    default = []
}

variable availability_zone_marker{
    default = []
}

# BACK END VARIABLE
variable backend_key {
    default = []
}




