#!/bin/bash
echo Grabbing instances in all regions, please wait..
for region in `aws ec2 describe-regions --output text | cut -f4`
do
aws ec2 describe-instances --region $region --query 'Reservations[].Instances[].[Placement.AvailabilityZone,InstanceId,SubnetId,VpcId,InstanceType,Platform,PrivateIpAddress,PublicIpAddress,State.Name,Tags[?Key==`Name`]| [0].Value,Tags[?Key==`billing`] | [0].Value,Tags[?Key==`environment`] | [0].Value,Tags[?Key==`Backup`] | [0].Value,Tags[?Key==`project`] | [0].Value,Tags[?Key==`contact`] | [0].Value]' --output text >> kk_Tech.tsv
cat kk_Tech.tsv | tr "\\t" "," >   kk_Tech.csv
done



