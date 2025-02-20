## This is a parmanent fork of original Amazon EKS Fleet Management Workshop - ReInvent KUB303

## Changes from the original upstream

In this forked project we have switched off the ingerations of certain AWS services like managed prometheus, Security Hub, Cloudwatch Dashboards, Kyverno policy reporter and added new capabilities like integration of Nirmata Control Hub via cluster registrator and Enterprise Kyverno (N4K).


## Learnings:

* Fleet Provisioning: Infrastructure as Code to deploy EKS clusters
* Fleet Management: GitOps to Kubernetes resources (helm addons)
* Fleet Governance: Policy across EKS clusters
* Fleet Governance Dashboard: Nirmata Control Hub for central visibility.

## Getting Started

Please follow the instructions given in the fleet.md to use it on your own AWS account.


## Use Cases

1. Deploy EKS clusters (hub, staging, prod)
1. Deploy Namespaces
1. Deploy Applications
1. Day 2 Operations



## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.
