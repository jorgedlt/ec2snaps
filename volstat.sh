# volstat - function

volstat () {
# finding volumes for a given EC2 instance
#

export ec2ID=$1

echo
#
  aws ec2 describe-instances --instance-ids ${ec2ID} \
    --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,Tags[?Key==`Name`].Value[]]' \
    | egrep -v '\[|\]' | tr -d ' |"' | tr '\012' ' ' ; echo
#
  aws ec2 describe-volumes --region us-east-1 \
    --filters Name=attachment.instance-id,Values="${ec2ID}" \
    Name=attachment.delete-on-termination,Values=true | jq .
}
#
