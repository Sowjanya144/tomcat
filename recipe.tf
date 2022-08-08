#creating a recipe

resource "aws_imagebuilder_image_recipe" "tomcat" {
  block_device_mapping {
    device_name = "/dev/xvdb"

    ebs {
      delete_on_termination = true
      volume_size           = 10
      volume_type           = "gp2"
    }
  }

  component {
    component_arn = aws_imagebuilder_component.tomcat.arn
  }

  name         = "tomcat"
 #parent_image = var.ami
  parent_image = "arn:aws:imagebuilder:us-east-2:aws:image/amazon-linux-2-x86/x.x.x"
  version      = "0.0.1"
  #parent_image = "arn:aws:imagebuilder:us-east-2:aws:image/amazon-linux-x86-latest/x.x.x"
  #parent_image = "arn:aws:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  #parent_image = "ami-02d1e544b84bf7502"
  #parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
}

