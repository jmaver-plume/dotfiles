_aws_export_profile(){
  case ${1} in
    dev)
      echo "[Info]: Exporting Development AWS profile"
      export AWS_PROFILE=development;;
    default)
      echo "[Info]: Exporting default AWS profile"
      export AWS_PROFILE=default;;
  esac
}

_aws_session(){
  account=$1
  region=$2
  token=$3
  case "$account" in
    development)
      _aws_export_profile dev
      mfa_arn=$(aws iam list-mfa-devices | grep SerialNumber | awk '{ print $2 }' | sed 's/[","]//g')
      tokenuser="default";;
  esac
  # mfa_arn=$(aws iam list-mfa-devices | grep SerialNumber | awk '{ print $2 }' | sed 's/[","]//g')
  # generate session token & token access credentials
  echo "[Info]: Generating AWS session token"
  session_info=$(aws sts get-session-token \
                 --duration-seconds 129600 \
                 --serial-number ${mfa_arn} \
                 --token-code $token)
  # derive values from session info
  aws_accesskey=$(echo ${session_info} | jq -r .Credentials.AccessKeyId)
  aws_secretkey=$(echo ${session_info} | jq -r .Credentials.SecretAccessKey)
  aws_token=$(echo ${session_info} | jq -r .Credentials.SessionToken)
  # configure tokenuser aws profile
  echo "[Info]: Configuring AWS token user profile"
  aws configure set aws_access_key_id ${aws_accesskey} --profile ${tokenuser}
  aws configure set aws_secret_access_key ${aws_secretkey} --profile ${tokenuser}
  aws configure set aws_session_token ${aws_token} --profile ${tokenuser}
  aws configure set region ${region} --profile ${tokenuser}
  aws configure set output json --profile ${tokenuser}
  export AWS_PROFILE=${tokenuser}
}

## Aliases will call token creation function for various accounts
alias default_token="_aws_session development us-west-2 $1"

awsps () {
  aws ssm get-parameter --with-decryption --name ${1} --query Parameter.Value --output text
}
