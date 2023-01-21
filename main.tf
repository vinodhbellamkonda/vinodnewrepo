provider "aws" {
  region  = "us-east-1"
  alias   = "prod"
}

provider "aws" {
  region  = "us-east-2"
  alias   = "prod-dr"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"
  provider = aws.prod

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "app_server1" {
  ami           = "ami-0a606d8395a538502"
  instance_type = "t2.micro"
  provider = aws.prod-dr

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

