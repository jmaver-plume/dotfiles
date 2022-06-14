#Usage: aws_session <mfa_token>
aws_session(){
  region="us-west-2"
  export AWS_PROFILE="development"
  region="us-west-2"
  tokenuser="devtoken"
  #get IAM user
  username=$(aws sts get-caller-identity | jq -r .Arn | cut -d/ -f2)

  #get MFA device ARN
  mfa_arn=$(aws iam list-mfa-devices --user-name ${username} | grep SerialNumber | awk '{ print $2 }' | sed 's/[","]//g')

  #generate session token & token access credentials
  echo "[Info]: Generating AWS session token"
  session_info=$(aws sts get-session-token \
                 --duration-seconds 129600 \
                 --serial-number ${mfa_arn} \
                 --token-code ${2})

  #derive values from session info
  aws_accesskey=$(echo ${session_info} | jq -r .Credentials.AccessKeyId)
  aws_secretkey=$(echo ${session_info} | jq -r .Credentials.SecretAccessKey)
  aws_token=$(echo ${session_info} | jq -r .Credentials.SessionToken)

  #configure tokenuser aws profile
  echo "[Info]: Configuring AWS token user profile"
  aws configure set aws_access_key_id ${aws_accesskey} --profile ${tokenuser}
  aws configure set aws_secret_access_key ${aws_secretkey} --profile ${tokenuser}
  aws configure set aws_session_token ${aws_token} --profile ${tokenuser}
  aws configure set region ${region} --profile ${tokenuser}
  aws configure set output json --profile ${tokenuser}

  export AWS_PROFILE=${tokenuser}
}
