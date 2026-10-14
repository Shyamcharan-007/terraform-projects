
resource "aws_s3_bucket" "mys3" {
  bucket = "shyam-s3-bucket-terraform-2026"

  tags = {
    Name = "shyam-s3-bucket-terraform"
  }
}