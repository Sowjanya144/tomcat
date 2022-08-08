resource "aws_imagebuilder_image_pipeline" "tomcat" {
  image_recipe_arn                 = aws_imagebuilder_image_recipe.tomcat.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.tomcat.arn
  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.tomcat.arn
  name                             = "example"
  schedule {
    schedule_expression = "cron(0 9 * * ? 1)"
  }
}


resource "aws_imagebuilder_image" "tomcat-test" {
  distribution_configuration_arn   = aws_imagebuilder_distribution_configuration.tomcat.arn
  image_recipe_arn                 = aws_imagebuilder_image_recipe.tomcat.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.tomcat.arn
}

