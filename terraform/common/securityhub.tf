resource "aws_securityhub_insight" "kyverno" {
  count = var.exclude_security_hub ? 0 : 1
  group_by_attribute = "ProductName"
  name               = "Kyverno Findings"
  filters {
    company_name {
      comparison = "EQUALS"
      value      = "Kyverno"
    }
    record_state {
      comparison = "EQUALS"
      value      = "ACTIVE"
    }
    workflow_status {
      comparison = "EQUALS"
      value      = "NEW"
    }
    workflow_status {
      comparison = "EQUALS"
      value      = "NOTIFIED"
    }
  }
}

resource "aws_securityhub_insight" "kyverno_disallow_privileged" {
  count = var.exclude_security_hub ? 0 : 1
  group_by_attribute = "ProductName"
  name               = "Kyverno: Disallow Privilege Escalation"
  filters {
    company_name {
      comparison = "EQUALS"
      value      = "Kyverno"
    }
    record_state {
      comparison = "EQUALS"
      value      = "ACTIVE"
    }
    resource_details_other {
      comparison = "EQUALS"
      key        = "Policy"
      value      = "disallow-privilege-escalation"
    }
    workflow_status {
      comparison = "EQUALS"
      value      = "NEW"
    }
    workflow_status {
      comparison = "EQUALS"
      value      = "NOTIFIED"
    }
  }
}

resource "aws_securityhub_insight" "kyverno_restrict-image-registries" {
  count = var.exclude_security_hub ? 0 : 1
  group_by_attribute = "ProductName"
  name               = "Kyverno: Restrict Image Registries"
  filters {
    company_name {
      comparison = "EQUALS"
      value      = "Kyverno"
    }
    record_state {
      comparison = "EQUALS"
      value      = "ACTIVE"
    }
    resource_details_other {
      comparison = "EQUALS"
      key        = "Policy"
      value      = "restrict-image-registries"
    }
    workflow_status {
      comparison = "EQUALS"
      value      = "NEW"
    }
    workflow_status {
      comparison = "EQUALS"
      value      = "NOTIFIED"
    }
  }
}

resource "aws_securityhub_insight" "kyverno_require-run-as-nonroot" {
  count = var.exclude_security_hub ? 0 : 1
  group_by_attribute = "ProductName"
  name               = "Kyverno: Require Run As Non Root"
  filters {
    company_name {
      comparison = "EQUALS"
      value      = "Kyverno"
    }
    record_state {
      comparison = "EQUALS"
      value      = "ACTIVE"
    }
    resource_details_other {
      comparison = "EQUALS"
      key        = "Policy"
      value      = "require-run-as-nonroot"
    }
    workflow_status {
      comparison = "EQUALS"
      value      = "NEW"
    }
    workflow_status {
      comparison = "EQUALS"
      value      = "NOTIFIED"
    }
  }
}
