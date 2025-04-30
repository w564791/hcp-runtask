resource "aws_s3_bucket_lifecycle_configuration" "file-query" {
  bucket = "ccc"

  rule {
    id     = "file-clean"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }

   
   expiration {
    days                         = 30
    expired_object_delete_marker = false
    }
  }

  rule {
    id     = "firewall-log-three-months-to-archive"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "DEEP_ARCHIVE"
    }

    expiration {
      days = 180
    }
  }
} 