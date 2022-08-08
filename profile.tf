resource "aws_iam_role" "build_role" {
  name               = "imagebuild_role"
  #assume_role_policy = file("role.json")
  assume_role_policy = file("${path.module}/role.json")
}

resource "aws_iam_policy" "image_test_policy1" {
    name = "image-policy1"
    policy = "${file("ssm.json")}"
}

resource "aws_iam_policy" "image_test_policy2" {
    name = "image-policy2"
    policy = "${file("ec2profile.json")}"
}

resource "aws_iam_policy" "image_test_policy3" {
    name = "image-policy3"
    policy = "${file("s3fullaccess.json")}"
}

resource "aws_iam_policy_attachment" "image_test1" {
  name       = "image-test-attachment1"
  roles =   [aws_iam_role.build_role.name]
  policy_arn = aws_iam_policy.image_test_policy1.arn
}

resource "aws_iam_policy_attachment" "image_test2" {
  name       = "image-test-attachment2"
  roles =   [aws_iam_role.build_role.name]
  policy_arn = aws_iam_policy.image_test_policy2.arn
}

resource "aws_iam_policy_attachment" "image_test3" {
  name       = "image-test-attachment3"
  roles =   [aws_iam_role.build_role.name]
  policy_arn = aws_iam_policy.image_test_policy3.arn
}

resource "aws_iam_instance_profile" "instance" {
  name  = "test_profile"
 #role = ["${aws_iam_role.build_role.name}"]
  role = aws_iam_role.build_role.name
}

