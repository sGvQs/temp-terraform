resource "aws_s3_bucket" "temp_bucket" {
  bucket = "${var.system}-${var.env}-${var.user}-bucket"
  tags = {
    Name = "${var.system}-${var.env}-${var.user}-bucket"
    Service = "${var.system}"
  }
}

resource "aws_s3_bucket_public_access_block" "temp_bucket_pab" {
  bucket = aws_s3_bucket.temp_bucket.id
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}