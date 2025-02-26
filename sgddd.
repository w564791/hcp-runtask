resource "aws_security_group" "example-ff" {
  name        = "example"
  description = "example"
  vpc_id      = var.vpc_id
  tags = {
    Name = "example"
    managed-by = "abc"
    eee = "ffc"
    owner = "abcd"
    business-line = "bbc"
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