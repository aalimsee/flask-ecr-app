# flask-ecr-app
3.4 Container Orchestration with ECS Part 1

# ✅ Overview
You’ll:

- Create a public GitHub repo for your sample Flask app with Dockerfile and requirements.txt.

- Create a private Amazon ECR repository.
```
aws ecr create-repository \
  --repository-name flask-ecr-demo \
  --image-scanning-configuration scanOnPush=true \
  --region us-east-1
```
Output
```
{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-1:255945442255:repository/flask-ecr-demo",
        "registryId": "255945442255",
        "repositoryName": "flask-ecr-demo",
        "repositoryUri": "255945442255.dkr.ecr.us-east-1.amazonaws.com/flask-ecr-demo",
        "createdAt": "2025-04-09T14:26:10.381000+08:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": true
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}
```
Check
```
aws ecr describe-repositories --repository-names flask-ecr-demo --region us-east-1
```

- Use GitHub Actions to build and push images to ECR.

- Tag images with both latest and github.sha.

# Here are the commands to add GitHub secrets using the GitHub CLI (gh).

- ✅ Make sure you have GitHub CLI installed and you're authenticated (gh auth login).

- 🔐 Add GitHub Secrets via CLI
Replace your-repo-name with your actual GitHub repo name (e.g., flask-ecr-app):

```
gh secret set AWS_ACCESS_KEY_ID -b XXXX -r aalimsee/flask-ecr-app
gh secret set AWS_SECRET_ACCESS_KEY -b XXXX -r aalimsee/flask-ecr-app
gh secret set AWS_REGION -b XXXX -r aalimsee/flask-ecr-app
gh secret set AWS_ACCOUNT_ID -b XXXX -r aalimsee/flask-ecr-app
gh secret set ECR_REPOSITORY -b XXXX -r aalimsee/flask-ecr-app
```

You’ll be prompted to enter the value for each secret securely in your terminal.

# Information from View Push Commands (ECR)
Make sure that you have the latest version of the AWS CLI and Docker installed. For more information, see Getting Started with Amazon ECR .
Use the following steps to authenticate and push an image to your repository. For additional registry authentication methods, including the Amazon ECR credential helper, see Registry Authentication .

## Retrieve an authentication token and authenticate your Docker client to your registry. 
Use the AWS CLI:
```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 255945442255.dkr.ecr.us-east-1.amazonaws.com
```
Note: If you receive an error using the AWS CLI, make sure that you have the latest version of the AWS CLI and Docker installed.

## Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here . You can skip this step if your image is already built:
```
docker build -t flask-ecr-demo .
```

## After the build completes, tag your image so you can push the image to this repository:
```
docker tag flask-ecr-demo:latest 255945442255.dkr.ecr.us-east-1.amazonaws.com/flask-ecr-demo:latest
```

## Run the following command to push this image to your newly created AWS repository:
```
docker push 255945442255.dkr.ecr.us-east-1.amazonaws.com/flask-ecr-demo:latest
```