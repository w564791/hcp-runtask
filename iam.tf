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
          "rds:Delete*",
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
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
}


data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["iam:UpdateGroup","s3:GetObject"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy-standard" {
  name        = "test-policy"
  description = "A test policy"
  policy      = data.aws_iam_policy_document.policy.json
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