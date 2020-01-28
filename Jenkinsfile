pipeline {
    agent { dockerfile true }
    parameters {    
    choice(name: 'CHOICE', choices: ['init', 'update', 'destroy'], description: 'Pick something')
    string(name: 'environment', defaultValue: 'dev', description: 'Enviroment to deploy')
    string(name: 'region', defaultValue: 'us-west-2', description: 'region of deployment')
    string(name: 'aws_access_key_id', defaultValue: '', description: 'access key to deploy')
    string(name: 'aws_secret_access_key', defaultValue: '', description: 'secret accesskey to deploy')
    string(name: 'deployment_bucket_name', defaultValue: '', description: 'give appropriate name of bucket')
    string(name: 'deployment_bucket_region', defaultValue: 'us-west-2', description: 'deployment bucket region')

    }
    stages {
        stage('Bucket create') {
            steps {
                sh 'aws s3api create-bucket --bucket  ${params.deployment_bucket_name} --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2'  
                }
           }
        stage('Bucket create') {
            steps {
                sh 'cd /root/.aws/'
                sh 'echo "[default]"' >> /root/.aws/config'
                sh 'echo "aws_access_key_id=${params.aws_access_key_id}"' >> /root/.aws/config'
                sh 'echo "aws_secret_access_key=${params.aws_secret_access_key}"' >> /root/.aws/config'
                sh 'echo "region=us-west-1" '                
                sh 'echo "output=json"' >> /root/.aws/config' 
                }
           }   
        
        stage('init') { 
            when {
                 expression { params.choise == 'init' }
            }
            steps {
                sh './init.sh ${params.environment} ${params.region} ${params.deployment_bucket_name} ${params.deployment_bucket_region}'
            }
        }
        stage('update') { 
            when {
                 expression { params.choise == 'update' }
            }
            steps {
                sh './deploy.sh ${params.environment} ${params.region} ${params.deployment_bucket_name} ${params.deployment_bucket_region}'
            }
        }

        stage('destroy') { 
            when {
                 expression { params.choise == 'destroy' }
            }
            steps {
                sh './destroy.sh ${params.environment} ${params.region} ${params.deployment_bucket_name} ${params.deployment_bucket_region}'
            }
        }


    }
}
