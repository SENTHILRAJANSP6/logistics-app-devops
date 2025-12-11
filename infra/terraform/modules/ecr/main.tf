resource "aws_ecr_repository" "repo" {
  name = "${var.env}-logistics-app"

  image_scanning_configuration {
    scan_on_push = true
  }
}
