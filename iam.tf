resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "rds:Describe*",
          "s3:GetObject",
          "iam:Create*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
    tags = {
    Name = "example"
    managed-by = "abc"
    business-line = "cde"
    eee = "ffc"
    owner = "abcd"
  }
}


data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name               = "test-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
    tags = {
    Name = "example"
    managed-by = "abc"
    business-line = "cde"
    eee = "ffc"
    owner = "abcd"
  }
}


data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["iam:GetGroup","s3:GetObject","eks:DeleteCluster"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy-standard" {
  name        = "test-policy"
  description = "A test policy"
  policy      = data.aws_iam_policy_document.policy.json
    tags = {
    Name = "example"
    managed-by = "abc"
    business-line = "cde"
    eee = "ffc"
    owner = "abcd"
  }
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = [aws_iam_role.role.name]
  policy_arn = aws_iam_policy.policy-standard.arn
}

resource "aws_iam_policy_attachment" "test-class" {
  name       = "class-attachment"
  roles      = [aws_iam_role.role.name]
  policy_arn = aws_iam_policy.policy.arn
}


resource "aws_iam_policy" "ReadOnlyAccess" {
  name = "ReadOnlyAccess"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "config:Get*",
        "eks:DescribeFargateProfile",
        "route53:TestDNSAnswer",
        "cloudfront:Get*",
        "iam:ListServiceSpecificCredentials",
        "s3:List*",
        "iam:ListSigningCertificates",
        "logs:ListLogDeliveries",
        "codedeploy:ListApplications",
        "config:Describe*",
        "eks:DescribeAddon",
        "config:SelectAggregateResourceConfig",
        "route53:Get*",
        "cloudwatch:ListTagsForResource",
        "s3:GetBucket*",
        "route53domains:List*",
        "codebuild:ListProjects",
        "iam:ListRolePolicies",
        "ecr:GetLifecyclePolicy",
        "iam:ListPolicies",
        "iam:GetRole",
        "cloudwatch:DescribeInsightRules",
        "cloudtrail:LookupEvents",
        "lambda:ListFunctions",
        "support:SearchForCases",
        "iam:ListSAMLProviders",
        "lambda:GetEventSourceMapping",
        "lambda:ListAliases",
        "logs:Unmask",
        "cloudformation:GetResource",
        "cloudwatch:DescribeAlarms",
        "secretsmanager:ListSecrets",
        "secretsmanager:GetSecretValue",
        "tag:GetResources",
        "codecommit:ListRepositories",
        "ses:ListEmailIdentities",
        "ecs:ListServices",
        "iam:ListInstanceProfilesForRole",
        "ses:ListIdentities",
        "dlm:GetLifecyclePolicy",
        "sns:GetTopicAttributes",
        "iam:ListRoles",
        "config:BatchGetAggregateResourceConfig",
        "cloudwatch:ListManagedInsightRules",
        "ec2:Describe*",
        "s3:GetAccountPublicAccessBlock",
        "rds:ListTagsForResource",
        "cloudwatch:ListMetricStreams",
        "elasticloadbalancing:DescribeTargetGroups",
        "iam:ListGroups",
        "iam:GetPolicyVersion",
        "iam:ListServerCertificates",
        "elasticloadbalancing:DescribeLoadBalancerPolicyTypes",
        "iam:ListVirtualMFADevices",
        "elasticloadbalancing:DescribeLoadBalancers",
        "eks:DescribeNodegroup",
        "kms:GetKeyRotationStatus",
        "codepipeline:ListPipelines",
        "codepipeline:GetPipeline",
        "route53:List*",
        "ses:ListReceiptRuleSets",
        "trustedadvisor:DownloadRisk",
        "apigateway:GET",
        "trustedadvisor:Describe*",
        "sns:ListTagsForResource",
        "cloudwatch:GetInsightRuleReport",
        "iam:GetAccessKeyLastUsed",
        "sqs:List*",
        "cloudfront:DescribeFunction",
        "lambda:ListEventSourceMappings",
        "eks:DescribeCluster",
        "elasticloadbalancing:DescribeRules",
        "support:Describe*",
        "dlm:GetLifecyclePolicies",
        "iam:GetAccountSummary",
        "autoscaling:Describe*",
        "kafka:ListClusters",
        "cloudwatch:GetMetricData",
        "route53resolver:List*",
        "s3:GetAccelerateConfiguration",
        "iam:ListMFADevices",
        "lambda:GetLayerVersionPolicy",
        "iam:Generate*",
        "timestream:SelectValues",
        "cloudwatch:DescribeAnomalyDetectors",
        "s3:GetEncryptionConfiguration",
        "ses:ListConfigurationSets",
        "backup:List*",
        "eks:ListUpdates",
        "ecr:DescribeRepositories",
        "pi:*",
        "ecs:ListClusters",
        "codebuild:BatchGetProjects",
        "cloudformation:ListStacks",
        "application-autoscaling:Describe*",
        "iam:GetInstanceProfile",
        "iam:ListUserPolicies",
        "cloudformation:ListResources",
        "backup:Get*",
        "cloudformation:ListStackSets",
        "iam:ListOpenIDConnectProviders",
        "elasticloadbalancing:DescribeTargetHealth",
        "iam:ListUsers",
        "iam:GetAccountPasswordPolicy",
        "health:Describe*",
        "logs:StartQuery",
        "trustedadvisor:List*",
        "kinesis:ListStreams",
        "route53domains:CheckDomainAvailability",
        "rds:Describe*",
        "acm:GetCertificate",
        "lambda:ListLayers",
        "logs:FilterLogEvents",
        "lambda:GetAlias",
        "ecs:ListTaskDefinitions",
        "cloudfront:List*",
        "timestream:Describe*",
        "codepipeline:ListWebhooks",
        "sns:ListSubscriptionsByTopic",
        "iam:GetPolicy",
        "cloudformation:ListResourceRequests",
        "kafka:DescribeCluster",
        "logs:Get*",
        "cloudwatch:GetMetricStatistics",
        "es:ESCrossClusterGet",
        "cloudwatch:GetMetricStream",
        "eks:ListClusters",
        "iam:GetRolePolicy",
        "config:SelectResourceConfig",
        "eks:ListAddons",
        "sns:ListTopics",
        "route53domains:Get*",
        "ecr:ListTagsForResource",
        "iam:GetServiceLastAccessedDetails",
        "cloudwatch:ListMetrics",
        "cloudwatch:DescribeAlarmHistory",
        "elasticloadbalancing:DescribeListenerCertificates",
        "codedeploy:GetApplication",
        "cloudwatch:GetMetricWidgetImage",
        "iam:ListAccessKeys",
        "organizations:ListTagsForResource",
        "es:Get*",
        "iam:ListGroupPolicies",
        "es:ESHttpGet",
        "cloudformation:GetResourceRequestStatus",
        "kms:GetKeyPolicy",
        "timestream:PrepareQuery",
        "logs:TestMetricFilter",
        "sns:ListSubscriptions",
        "elasticache:Describe*",
        "sqs:Get*",
        "access-analyzer:List*",
        "trustedadvisor:Get*",
        "organizations:ListParents",
        "iam:ListAccountAliases",
        "iam:GetUser",
        "cloudtrail:Get*",
        "sns:ListPlatformApplications",
        "iam:GetLoginProfile",
        "kms:List*",
        "eks:ListTagsForResource",
        "logs:Describe*",
        "codepipeline:ListTagsForResource",
        "kafka:GetBootstrapBrokers",
        "kms:DescribeCustomKeyStores",
        "es:ESHttpHead",
        "cloudwatch:DescribeAlarmsForMetric",
        "cloudwatch:ListDashboards",
        "elasticloadbalancing:DescribeLoadBalancerPolicies",
        "lambda:ListLayerVersions",
        "elasticloadbalancing:DescribeInstanceHealth",
        "iam:GetAccountAuthorizationDetails",
        "es:Describe*",
        "ec2:Get*",
        "eks:ListNodegroups",
        "cloudwatch:GetDashboard",
        "elasticfilesystem:Describe*",
        "timestream:Get*",
        "cloudtrail:Describe*",
        "logs:StopQuery",
        "acm:ListTagsForCertificate",
        "ecs:DescribeClusters",
        "cloudformation:DescribeStacks",
        "elasticloadbalancing:DescribeLoadBalancerAttributes",
        "lambda:ListFunctionEventInvokeConfigs",
        "elasticloadbalancing:DescribeTargetGroupAttributes",
        "acm:DescribeCertificate",
        "eks:DescribeIdentityProviderConfig",
        "codecommit:GetRepository",
        "iam:GetUserPolicy",
        "cloudformation:GetTemplate",
        "iam:ListGroupsForUser",
        "iam:GetGroupPolicy",
        "elasticache:ListTagsForResource",
        "ses:ListTemplates",
        "elasticfilesystem:ListTagsForResource",
        "lambda:ListVersionsByFunction",
        "lambda:GetLayerVersion",
        "iam:GetServiceLastAccessedDetailsWithEntities",
        "iam:ListPoliciesGrantingServiceAccess",
        "config:BatchGetResourceConfig",
        "lambda:GetAccountSettings",
        "iam:ListAttached*",
        "iam:GetGroup",
        "elasticloadbalancing:DescribeListeners",
        "acm:ListCertificates",
        "kms:DescribeKey",
        "backup:Describe*",
        "eks:DescribeAddonVersions",
        "cloudtrail:List*",
        "route53domains:CheckDomainTransferability",
        "acm:GetAccountConfiguration",
        "elasticloadbalancing:DescribeTags",
        "timestream:Select",
        "iam:ListInstanceProfiles",
        "access-analyzer:Get*",
        "config:List*",
        "timestream:List*",
        "ses:ListEmailTemplates",
        "eks:DescribeUpdate",
        "sts:GetCallerIdentity",
        "es:List*",
        "lambda:GetPolicy",
        "ecr:GetRepositoryPolicy",
        "memorydb:Describe*",
        "memorydb:List*",
        "iam:ListPolicyTags",
        "iam:ListRoleTags"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  tags = {
    business-line = "aa"
    created-by    = "cc"
    owner         = "dde"
    Name = "asas"
  }


}