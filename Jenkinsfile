pipeline {
    agent {
        docker { image 'myimage' 
               args '-p 27018:27017'
               }
    }
    stages {
        stage('Test') {
            steps {
                sh 'npm -v'
                sh 'node -v'
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                
            }
        }
    stage('Front-end') {
            agent {
                docker { image 'mongo' }
            }
            steps {
                sh 'node -v'
                sh 'npm run test'
            }
        }
    
    }
}
