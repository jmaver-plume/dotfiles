awsps () {
  aws ssm get-parameter --with-decryption --name ${1} --query Parameter.Value --output text
}
