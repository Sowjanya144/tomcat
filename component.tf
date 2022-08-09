#creating a httpd component

resource "aws_imagebuilder_component" "tomcat" {
  data = yamlencode({
    phases = [{
      name = "build"
      steps = [{
        name   = "Installwebserver"
        action = "ExecuteBash"
        inputs = {
          commands = [
            "sudo yum update -y",
            "sudo amazon-linux-extras install java-openjdk11 -y",
            "wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.8/bin/apache-tomcat-10.0.8.tar.gz",
            "sudo tar xvf apache-tomcat-10.0.8.tar.gz",
            "sudo mkdir /opt/tomcat/",
            "sudo mv apache-tomcat-10.0.8/* /opt/tomcat/",
            "sudo useradd tomcat",
            "sudo chown -R tomcat:tomcat /opt/tomcat/",
            "sudo chmod -R 755 /opt/tomcat/",
           # "sudo wget https://terraform-object-bucket.s3.us-east-2.amazonaws.com/terraform.txt",
           # "sudo mv terraform.txt /etc/systemd/system/tomcat.service",
           # "sudo cp main/env/tomcat.service /etc/systemd/system/",
            "sudo wget https://github.com/Sowjanya144/tomcat/blob/main/env/tomcat.service",
            "sudo mv tomcat.service /etc/systemd/system/",
            "sudo systemctl daemon-reload",
            #"sudo systemctl start tomcat",
            "sudo /opt/tomcat/bin/startup.sh"
            "sudo systemctl enable tomcat"
          ]
        }
      }]
    }]
    schemaVersion = 1.0
  })
  name     = "installtomcat"
  platform = "Linux"
  version  = "1.0.0"
}

