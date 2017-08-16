
# create-snapshot - modify into a series of functions

export ec2ID='i-060597d44407b2770'
export volID='vol-00b17c765830a7076'

#
  aws ec2 create-snapshot --volume-id "${volID}" \
  --description "intance ${ec2ID} volume ${volID}" | jq .
#
