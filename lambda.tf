resource "aws_iam_role" "lambda_role" {
  name               = "sample-terraform-lambda-role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
POLICY
}

resource "aws_lambda_function" "sample_terraform_lambda" {
  filename      = "main.zip"
  role          = aws_iam_role.lambda_role.arn
  function_name = "sample_terraform_lambda"
  handler       = "handler"
  runtime       = "go1.x"
}
