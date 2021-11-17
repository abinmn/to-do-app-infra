terraform {
  backend "s3" {
    bucket         = "tf-state-bucket-todo-app"
    key            = "state/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tf-state-db"
  }
}
