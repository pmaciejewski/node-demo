export s3bucket="node-ptaq"
export s3path="Dockerrun.aws.json"
export region="us-east-1"
export tag="test7"
export application="trojqa-demo"
export env="test-env"

# Copy to s3 Dockerrun - done
echo "copy to s3"
aws s3 cp ${s3path} s3://${s3bucket}/${s3path} --region=${region}

# Push container to registry
docker-compose push ptaq

# Create EB app version
echo "create app version"
aws elasticbeanstalk create-application-version \
    --application-name "${application}" \
    --version-label ${tag}  \
    --source-bundle S3Bucket=${s3bucket},S3Key=${s3path} \
    --region=${region}

# Update EB environment
echo "update eb env"
aws elasticbeanstalk update-environment \
    --environment-name ${env} \
    --version-label ${tag} \
    --region=${region}