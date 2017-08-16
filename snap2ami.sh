# howto-create-an-ebs-backed-amazon-ec2-ami

aws ec2 register-image \
--region=$(aws configure list | grep region | awk '{print $2}' | tr -d ' ') \
--name "Example_Image_Name" \
--description "Example Image Description" \
--architecture x86_64 \
--root-device-name "/dev/sda1" \
--block-device-mappings "[
    {
        \"DeviceName\": \"/dev/sda1\",
        \"Ebs\": {
            \"SnapshotId\": \"snap-040e4010ed7b66b25\"
        }
    }
]"

# ln -s ./snap2ami.sh /usr/local/bin/snap2ami

# see example from http://www.dowdandassociates.com/blog/content/howto-create-an-ebs-backed-amazon-ec2-ami
