variable "storage_managed_folder_iam_members" {
  description = <<EOT
Map of storage_managed_folder_iam_members, attributes below
Required:
    - bucket
    - managed_folder
    - member
    - role
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    bucket         = string
    managed_folder = string
    member         = string
    role           = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

