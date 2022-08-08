resource "aws_imagebuilder_image_pipeline" "proxy-x86_64" {
  image_recipe_arn                 = aws_imagebuilder_image_recipe.example.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.example.arn
  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.example.arn
  name                             = "example"
  schedule {
    schedule_expression = "cron(0 9 * * ? 1)"
  }
}


resource "aws_imagebuilder_image" "tomcat-test" {
  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.example.arn
  image_recipe_arn                 = aws_imagebuilder_image_recipe.example.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.example.arn
}

