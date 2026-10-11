data "oci_data_safe_security_policy_reports" "data_safe_security_policy_reports_lookup" {
  for_each = var.data_safe_security_policy_reports_lookup

  compartment_id            = each.value.compartment_id
  access_level              = each.value.access_level
  compartment_id_in_subtree = each.value.compartment_id_in_subtree
  display_name              = each.value.display_name
  security_policy_report_id = each.value.security_policy_report_id
  state                     = each.value.state
  target_id                 = each.value.target_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

