
# ---ECR created manually, therefore tf create is not needed
# ----------------------------------------------------------
/* 
aws ecr create-repository \
  --repository-name flask-ecr-demo \
  --image-scanning-configuration scanOnPush=true \
  --region us-east-1
 */


# ---Create the ECR Repository with image scanning enabled
# --------------------------------------------------------
/* resource "aws_ecr_repository" "flask_ecr_demo" {
  name = "flask-ecr-demo"

  image_scanning_configuration {
    scan_on_push = true
  }

  # Optionally, you can set encryption and lifecycle policies if needed.
  encryption_configuration {
    encryption_type = "AES256" # Default is AES256 encryption, you can also use KMS.
  }

  lifecycle {
    prevent_destroy = false # Allows the resource to be destroyed
  }
}
*/
