pipeline {
    agent {
        docker { image 'myimage' 
               args '-p 27018:27017'
               args 'tail -f /dev/null'}
    }
    stages {
        stage('Test') {
            steps {
                sh 'npm -v'
                sh 'node -v'
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                sh 'npm run test'
            }
        }
    }
}
