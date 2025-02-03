resource "aws_cloudwatch_dashboard" "cni-helper-cw-dashboard" {
  count = var.enable_cloudwatch_dashboards ? 1 : 0
  dashboard_name = "Fleet_Management_Vpc_Cni"
  dashboard_body = replace(
    replace(file("cw-dashboard-vpc-cni.json"), "**aws_region**", local.region),
    "**default_cluster**", local.name
  )
}

resource "aws_cloudwatch_dashboard" "karpenter-cw-dashboard" {
  count = var.enable_cloudwatch_dashboards ? 1 : 0
  dashboard_name = "Fleet_Management_Karpenter"
  dashboard_body = replace(
    replace(file("cw-dashboard-karpenter.json"), "**aws_region**", local.region),
    "**default_cluster**", local.name
  )
}

resource "aws_cloudwatch_dashboard" "coredns-cw-dashboard" {
  count = var.enable_cloudwatch_dashboards ? 1 : 0
  dashboard_name = "Fleet_Management_CoreDNS"
  dashboard_body = replace(
    replace(file("cw-dashboard-coredns.json"), "**aws_region**", local.region),
    "**default_cluster**", local.name
  )
}


locals{
    scrape_interval = "30s"
    scrape_timeout  = "10s"
}

data "aws_ssm_parameter" "amp_arn" {
  count = var.enable_prometheus ? 1 : 0
  name = "${local.context_prefix}-${var.amazon_managed_prometheus_suffix}-arn"
}

resource "aws_prometheus_scraper" "fleet-scraper" {
  # only enabled this if var enable_prometheus_scraper is true
  count = var.enable_prometheus_scraper ? 1 : 0
  source {
    eks {
      cluster_arn = module.eks.cluster_arn
      subnet_ids  = module.vpc.private_subnets
      security_group_ids = [module.eks.node_security_group_id]
    }
  }
  destination {
    amp {
       workspace_arn = data.aws_ssm_parameter.amp_arn[0].value
    }
  }
  alias = "fleet-hub"
  scrape_configuration = replace(
    replace(
      replace(
        replace(
          replace(
            file("${path.module}/../common/scraper-config.yaml"),
            "{scrape_interval}",
            local.scrape_interval
          ),
          "{scrape_timeout}",
          local.scrape_timeout
        ),
        "{cluster}",
        local.name
      ),
      "{region}",
      local.region
    ),
    "{account_id}",
    data.aws_caller_identity.current.account_id
  )

}

################################################################################
# Monitoring notifications
################################################################################
resource "aws_sns_topic" "fleet-alerts" {
  count = var.enable_notifications ? 1 : 0
  name = "fleet-alerts"
}

resource "aws_sqs_queue" "fleet_alerts_queue" {
  count = var.enable_notifications ? 1 : 0
  name = "fleet_alerts"
}

resource "aws_sns_topic_subscription" "fleet_alerts_sqs_target" {
  count = var.enable_notifications ? 1 : 0
  topic_arn = aws_sns_topic.fleet-alerts[0].arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.fleet_alerts_queue[0].arn
}

################################################################################
# ADOT
################################################################################


module "adot_collector_pod_identity" {
  count = var.enable_adot ? 1 : 0
  source = "terraform-aws-modules/eks-pod-identity/aws"
  version = "~> 1.4.0"

  name = "adot-collector"

  additional_policy_arns = {
      "PrometheusReadWrite": "arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess",
      "XrayAccess": "arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess"
  }

  # Pod Identity Associations
  associations = {
    addon = {
      cluster_name = module.eks.cluster_name
      namespace       = local.adot_collector_namespace
      service_account = local.adot_collector_serviceaccount
    }
  }
  tags = local.tags
}
