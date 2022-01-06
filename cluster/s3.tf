resource "aws_s3_bucket" "eks_s3" {
  bucket = "eks-django-application-bucket"
  acl    = "public-read-write"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }

}
# CORS
# [
#     {
#         "AllowedHeaders": [
#             "*"
#         ],
#         "AllowedMethods": [
#             "PUT",
#             "POST",
#             "DELETE"
#         ],
#         "AllowedOrigins": [
#             "*"
#         ],
#         "ExposeHeaders": []
#     },
#     {
#         "AllowedHeaders": [
#             "*"
#         ],
#         "AllowedMethods": [
#             "PUT",
#             "POST",
#             "DELETE"
#         ],
#         "AllowedOrigins": [
#             "*"
#         ],
#         "ExposeHeaders": []
#     },
#     {
#         "AllowedHeaders": [],
#         "AllowedMethods": [
#             "GET"
#         ],
#         "AllowedOrigins": [
#             "*"
#         ],
#         "ExposeHeaders": []
#     }
# ]

# {
#   "Id": "Policy1641144620446",
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "Stmt1641143669439",
#       "Action": [
#         "s3:GetObject"
#       ],
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::eks-django-application-bucket",
#       "Principal": "*"
#     }
#   ]
# }

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