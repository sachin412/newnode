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
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
                 
            }
        }
    stage('Front-end') {
            agent {
                docker { image 'mongo' }
            }
            steps {
                
                sh 'echo "hello"'
            }
        }
    
    }
}
