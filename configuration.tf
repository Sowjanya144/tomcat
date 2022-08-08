#creating configuartion for pipeline

resource "aws_imagebuilder_infrastructure_configuration" "example" {
  description                   = "created for testing"
  instance_profile_name         = aws_iam_instance_profile.instance.name
  instance_types                = ["t2.micro","t3.small"]
  name                          = "apache"
  #security_group_ids            = [aws_security_group.builder.id]
  #subnet_id                     = data.aws_subnet.default.id
  terminate_instance_on_failure = true
  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_imagebuilder_distribution_configuration" "example" {
  name = "apache"

  distribution {
    ami_distribution_configuration {
      name = "example-{{ imagebuilder:buildDate }}"

      #launch_permission {
      # user_ids = ["1234567890", "0987654321"]
      #}
      #target_account_ids = ["1234567890", "0987654321"]
    }

    region = "us-east-2"
  }
}

