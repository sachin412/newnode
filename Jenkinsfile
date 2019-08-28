pipeline {
    agent none    
    
    stages {
        stage('Test') {
               agent {
                docker { image 'mongdb'
                       args '-p 27017:27017'
                        }
               }
            steps {
                sh 'npm -v'
                sh 'node -v'
                sh 'chmod 777 /var/run/mongodb/mongodb.pid'                
                sh 'service mongodb start'
                sh 'service mongodb status'
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
                
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
