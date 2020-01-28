pipeline {
    agent { dockerfile true }
    parameters {    
    choice(name: 'CHOICE', choices: ['init', 'update', 'destroy'], description: 'Pick something')
    string(name: 'environment', defaultValue: 'dev', description: 'Enviroment to deploy')
    string(name: 'region', defaultValue: 'us-west-2', description: 'region of deployment')
    string(name: 'deployment_bucket_name', defaultValue: '', description: 'give appropriate name of bucket')
    string(name: 'deployment_bucket_region', defaultValue: 'us-west-2', description: 'deployment bucket region')

    }
    stages {
        stage('Bucket create') {
            steps {
                sh 'aws s3api create-bucket --bucket  vweportal2020 --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2'  
                }
           }
        
        stage('init') { 
            when {
                // Only say hello if a "greeting" is requested
                expression { params.choise == 'init' }
            }
            steps {
                sh './init.sh ${params.environment} ${params.region} ${params.deployment_bucket_name} ${params.deployment_bucket_region}'
            }
        }
        stage('update') { 
            when {
                // Only say hello if a "greeting" is requested
                expression { params.choise == 'update' }
            }
            steps {
                sh './deploy.sh ${params.environment} ${params.region} ${params.deployment_bucket_name} ${params.deployment_bucket_region}'
            }
        }

        stage('destroy') { 
            when {
                // Only say hello if a "greeting" is requested
                expression { params.choise == 'destroy' }
            }
            steps {
                sh './destroy.sh ${params.environment} ${params.region} ${params.deployment_bucket_name} ${params.deployment_bucket_region}'
            }
        }


    }
