provider "aws" {
  region = var.region
  profile = "default"
}

provider "tls" {
  # tls provider for generating a ssh key
}