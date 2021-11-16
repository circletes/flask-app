terraform {
  backend "gcs" {
      bucket      = "tf-for-terraform-state-python-flask-app"
      prefix      = "project/terraform.tfstate"
  }
} 
