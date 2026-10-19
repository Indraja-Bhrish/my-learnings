# 1. PROVIDER BLOCK
# Declares the provider plugin needed to interact with the local filesystem
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# 2. VARIABLE BLOCK
# Makes input values dynamic
variable "file_content" {
  type        = string
  default     = "Hello from Terraform Local Provider!"
  description = "The text to write inside our local file"
}

# 3. RESOURCE BLOCK
# Creates a local file on your filesystem
resource "local_file" "welcome_file" {
  filename = "${path.module}/welcome.txt"
  content  = var.file_content
}

# 4. OUTPUT BLOCK
# Displays generated values after applying configuration
output "file_path" {
  value       = local_file.welcome_file.filename
  description = "Path of the created file"
}

output "file_id" {
  value       = local_file.welcome_file.id
  description = "MD5 checksum of the created file"
}