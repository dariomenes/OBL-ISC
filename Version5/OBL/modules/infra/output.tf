###########################################
#### Extraer el LabRole de esta cuenta ####
###########################################
data "aws_iam_role" "labrole" {
  name = "Labrole"
}