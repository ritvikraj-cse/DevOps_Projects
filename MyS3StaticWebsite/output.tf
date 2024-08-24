output "StaticWebsiteEndpoint" {
  value = aws_s3_bucket.bucket.website_endpoint
}