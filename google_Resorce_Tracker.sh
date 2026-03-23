#!/bin/bash
#

############################
# Author: Dipak
# Date: 20/03
#
# Version: v1
#
# This script will report the google resource usage
################################
#

# aws s3
# aws ec2
# aws lambda
# aws IAM User
#
set -x

# list s3 buckets
echo "Print list of s3 buckets" 
aws s3 ls >> resorceTracker.log

#list EC2 instances
echo "Print list of ec2 buckets"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resorceTracker.log

# lsit lambda
echo "print list of lambda function"
aws lambda list-functions >> resorceTracker.log

# list IAM users
echo "print list of IAM Users"
aws iam list-users >> resorceTracker.log

date >> resorceTracker.log

