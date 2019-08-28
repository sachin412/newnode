pipeline {
    agent none    
    
    stages {
        stage('Test') {
               agent {
                docker { image 'mongdb'
                       args '-p 27018:27017'
                        }
               }
            steps {
                sh 'npm -v'
                sh 'node -v'
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                sh 'npm run test'
                
            }
        }
    stage('Front-end') {
            agent {
                docker { image 'mongo' }
            }
            steps {
                
                sh 'npm run test'
            }
        }
    
    }
}
