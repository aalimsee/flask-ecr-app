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
gh secret set AWS_ACCESS_KEY_ID -r aalimsee/flask-ecr-app
gh secret set AWS_SECRET_ACCESS_KEY -r aalimsee/flask-ecr-app
gh secret set AWS_REGION -r aalimsee/flask-ecr-app
gh secret set AWS_ACCOUNT_ID -r aalimsee/flask-ecr-app
gh secret set ECR_REPOSITORY -r aalimsee/flask-ecr-app
```

You’ll be prompted to enter the value for each secret securely in your terminal.