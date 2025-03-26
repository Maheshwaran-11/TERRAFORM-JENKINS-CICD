# Create S3 Bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Upload Objects to S3 without ACLs
resource "aws_s3_object" "index" {
  bucket        = aws_s3_bucket.mybucket.id
  key           = "index.html"
  source        = "index.html"
  content_type  = "text/html"
}

resource "aws_s3_object" "error" {
  bucket        = aws_s3_bucket.mybucket.id
  key           = "error.html"
  source        = "error.html"
  content_type  = "text/html"
}

resource "aws_s3_object" "style" {
  bucket        = aws_s3_bucket.mybucket.id
  key           = "style.css"
  source        = "style.css"
  content_type  = "text/css"
}

resource "aws_s3_object" "script" {
  bucket        = aws_s3_bucket.mybucket.id
  key           = "script.js"
  source        = "script.js"
  content_type  = "text/javascript"
}

# Configure S3 Website
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
