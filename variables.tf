##############################
# AzureRm provider variables #
##############################

# variable "azure_client_id" {
#   description = "Service Principal Client id details"
# }

# variable "azure_client_secret" {
#   description = "Service Principal Client Secrets details"
# }

# variable "azure_tenant_id" {
#   description = "Service Principal tenant id details"
# }

# variable "azure_subscription_id" {
#   description = "Service Principal subsription id details"
# }

########################################
# Virtual Network and Subnet variables #
########################################

variable "vnet_name" {
  description = "VNet name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group for Virtual Network"
  type        = string
  default     = "app-rg"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}


#########################################
# Resource Group and Location variables #
#########################################
# variable "vm_rg_name" {
#   type        = string
#   description = "Name of Resource Group in which we want to create vm and related resources"
# }

variable "location" {
  type        = string
  description = "Location of the resources"
}


###############################
# Network Interface variables #
###############################
variable "nic_name" {
  description = "Network Interface Name"
  type        = string
}

variable "nic_ip_config_name" {
  description = "Network Interface IP Config Name"
  type        = string
}

variable "nic_ip_config_private_ip_addr_allocation" {
  description = "Network Interface IP Config Private IP Address Allocation"
  type        = string
}


#############################
# Virtual machine variables #
#############################
# variable "no_of_vm" {
#   type        = string
#   description = "Number of VMs"
# }

variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
}

variable "vm_size" {
  description = "Virtual Machine Size"
  type        = string
}

variable "vm_computer_name" {
  description = "Virtual Machine Computer Name"
  type        = string
}

variable "vm_user" {
  description = "Name of the user"
  type        = string
}

variable "vm_os_disk_name" {
  description = "Virtual Machine OS Disk Name"
  type        = string
}

variable "vm_os_disk_caching" {
  description = "Virtual Machine OS Disk Caching"
  type        = string
}

variable "vm_os_disk_storage_acc_type" {
  description = "Virtual Machine storage account type"
  type        = string
}

variable "vm_source_image_reference_sku" {
  description = "Virtual Machine Source Image Reference SKU"
  type        = string
}

variable "vm_identity_type" {
  description = "Virtual Machine identity type"
  type        = string
}

# ####################################
# # ADO AGENT REGISTRATION VARIABLES #
# ####################################
# variable "ado_organisation_url" {
#   description = "Azure DevOps server URL"
#   type        = string
# }

# variable "adotoken" {
#   description = "Azure DevOps Token to register agent"
#   type        = string
# }

# variable "ado_pool_name" {
#   description = "Agent Pool name where to register the agent"
#   type        = string
# }

# variable "ado_agent_name" {
#   description = "Agent name to register the agent"
#   type        = string
# }

# variable "ado_agent_tag" {
#   description = "value of user capabilites tag for the agent"
#   type        = string
# }
