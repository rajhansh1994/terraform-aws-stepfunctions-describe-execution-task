module "stepfunctions_describe_execution_task" {
  dead_letter_arn = var.dead_letter_arn
  handler         = "function.handler"
  kms_key_arn     = var.kms_key_arn
  l3_object_key   = "quinovas/stepfunctions-describe-execution-task/stepfunctions-describe-execution-task-0.0.1.zip"
  name            = "${var.name_prefix}sf-describe-execution-task"

  policy_arns = [
    aws_iam_policy.stepfunctions_describe_execution_task.arn,
  ]
  runtime           = "python3.7"
  source            = "QuiNovas/lambdalambdalambda/aws"
  timeout           = 300
  version           = "3.0.1"
}

resource "aws_iam_policy" "stepfunctions_describe_execution_task" {
  name   = "${var.name_prefix}sf-describe-execution-task"
  policy = data.aws_iam_policy_document.stepfunctions_describe_execution_task.json
}

