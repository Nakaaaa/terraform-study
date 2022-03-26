resource "aws_instance" "sample" {
  ami           = "ami-0ab0bbbd329f565e6"
  instance_type = "t2.micro"
  tags = {
    "Name" = "sample-ec2"
  }
}
