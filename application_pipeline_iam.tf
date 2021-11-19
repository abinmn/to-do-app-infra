resource "aws_iam_user" "pipeline_user" {
  name = "app-pipeline-user-team-2"
}

resource "aws_iam_policy" "ecr_pipeline_policy" {
  name = "ecr-access-policy-todo-app"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "ecr-attach" {
  name       = "test-attachment"
  users      = [aws_iam_user.pipeline_user.name]
  policy_arn = aws_iam_policy.ecr_pipeline_policy.arn
}