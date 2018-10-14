#!/bin/bash

# October 2018
# Lisa Burton
# Distributed under the MIT license
#
# Packages and redploys the Lambda. Effectively executes the
# important aspects of the AWS CodePipeline to make it
# easy to debug when it isn't working as expected.

STACK_NAME='readquotes-cloudformation-stack'
SAM_INPUT_TEMPLATE='../samTemplate.yaml'
SAM_OUTPUT_TEMPLATE='../outputSamTemplate.yaml'
SAM_S3_BUCKET='getquotesdeploymentstore'

function deleteStack()
{
  printf "INFO: Deleting stack \`%s\` ..." $1
  aws cloudformation delete-stack --stack-name $1

  if [ "$?" -eq 0 ]; then
    printf "Done.   \n"
  else
    printf "\nWARN: Couldn't delete stack \`%s\`, probably because it doesn't exist.\n" $1
  fi
}

function createSamPackage()
{
  printf "INFO: Creating SAM package ...\n"
  aws cloudformation package --template-file $1 --output-template-file $2 --s3-bucket $3 

  if [ $? -eq 0 ]
  then
    printf "Done.   \n"
  else
    printf "\nFATAL: Couldn't create SAM package.\n"
    exit -1
  fi
}

function deploySamPackage()
{
  printf "INFO: Deploying SAM stack ...\n"
  aws cloudformation deploy --template-file $1 --stack-name $2 --capabilities CAPABILITY_NAMED_IAM
  
  if [ $? -eq 0 ]
  then
    printf "Done.   \n"
  else
    printf "\nFATAL: Couldn't deploy SAM package.\n"
    exit -1
  fi
}

deleteStack $STACK_NAME
createSamPackage $SAM_INPUT_TEMPLATE $SAM_OUTPUT_TEMPLATE $SAM_S3_BUCKET
deploySamPackage $SAM_OUTPUT_TEMPLATE $STACK_NAME


