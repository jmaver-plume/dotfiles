# awsps
#
# Retrieves and decrypts a parameter from AWS Systems Manager Parameter Store.
#
# Usage:
#   awsps <parameter_name>
#
# Parameters:
#   parameter_name: The name of the parameter to retrieve from AWS SSM.
#
# Output:
#   The decrypted value of the specified parameter.
#
# Notes:
#   - Ensure that you have the necessary AWS permissions to access the parameter and decrypt it.
#   - This function relies on the AWS CLI being installed and properly configured.
#
awsps () {
  aws ssm get-parameter --with-decryption --name ${1} --query Parameter.Value --output text
}
