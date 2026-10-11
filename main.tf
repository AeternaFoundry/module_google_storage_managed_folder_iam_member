resource "google_storage_managed_folder_iam_member" "storage_managed_folder_iam_members" {
  for_each = var.storage_managed_folder_iam_members

  bucket         = each.value.bucket
  managed_folder = each.value.managed_folder
  member         = each.value.member
  role           = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

