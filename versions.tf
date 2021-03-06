terraform {
  required_version = ">= 0.12.26"

  required_providers {
    aws       = ">= 2.48"
    template  = ">= 2.0"
    github    = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }

  backend "remote" {
    organization  = "LinkBird"

    workspaces {
      name        = "production"
    }
  }
}

provider "aws" {
  region       = "${var.region}"
}

provider "github" {
  token        = "${var.github_token}"
}