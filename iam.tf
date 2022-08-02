data "aws_iam_policy" "systems_manager" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ssm.name
  policy_arn = data.aws_iam_policy.systems_manager.arn
}

resource "aws_iam_instance_profile" "ssm" {
  name = "EC2_SSM"
  role = aws_iam_role.ssm.name
}

resource "aws_iam_role" "ssm" {
  name               = "ec2_ssm"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json # (not shown)
}

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}