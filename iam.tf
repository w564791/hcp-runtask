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
        Condition = {
                        Bool      = {
                            "aws:ViaAWSService" = "false"
                        }
                        IpAddress = {
                            "aws:SourceIp" = [
                                "103.192.133.90/32",
                                "103.197.144.34/32",
                                "103.197.155.35/32",
                                "103.197.111.36/32",
                                "103.197.233.37/32",
                                "103.24.112.170/32",
                                "111.9.132.66/32",
                                "131.41.14.230/32",
                                "132.41.14.231/32",
                                "133.41.16.220/32",
                                "134.41.16.29/32",
                                "135.41.188.95/32",
                                "136.238.208.29/32",
                                "137.238.121.54/32",
                                "134.23.29.96/32",
                                "137.85.237.141/32",
                                "137.86.237.19/32",
                                "160.37.121.226/32",
                                "160.31.121.246/32",
                                "20.20.154.33/32",
                                "20.219.121.128/32",
                                "20.229.123.190/32",
                                "20.225.121.70/32",
                                "20.216.241.193/32",
                                "203.161.182.154/32",
                                "203.236.182.178/32",
                                "221.213.139.174/32",
                                "14.113.85.253/32",
                                "65.129.217.11/32",
                                "65.139.217.193/32",
                            ]
                        }
                    }
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
resource "aws_iam_policy" "policy3" {
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
          "iam:CreateUser"
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
resource "aws_iam_policy" "policy4" {
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
