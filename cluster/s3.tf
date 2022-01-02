resource "aws_s3_bucket" "eks_s3" {
  bucket = "eks_django_application_bucket"
  acl    = "public-read-write"
}

# resource "aws_iam_role" "eks_role" {
#   name = "eks_role"

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "eks.amazonaws.com"
#         }
#       },
#     ]
#   })

#   tags = {
#     purpose = "For S3 access"
#   }
# }

# resource "aws_iam_policy_attachment" "eks-role-policy-attachment" {
#   role       = aws_iam_role.eks_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
# }