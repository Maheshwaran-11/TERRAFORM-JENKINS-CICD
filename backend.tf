terraform {
  backend "s3" {
    bucket         = "mkawscloud"
    key            = "my-terraform-environment/main"
    region         = "us-east-1"
    dynamodb_table = "mk-dynamo-db-table"
  }
}
