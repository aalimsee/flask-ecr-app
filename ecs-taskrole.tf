


resource "aws_iam_role" "ecs_task_role" {
  name = "ecsAppTaskRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "app_policy" {
  name = "ecsAppPolicy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "dynamodb:PutItem"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "app_policy_attach" {
  name       = "ecs-app-policy-attach"
  policy_arn = aws_iam_policy.app_policy.arn
  roles      = [aws_iam_role.ecs_task_role.name]
}

# refer to main.tf
/* 
resource "aws_ecs_task_definition" "my_task" {
  family                   = "my-task"
  execution_role_arn       = aws_iam_role.ecs_task_exec_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  # other task definition fields...
} 
*/
