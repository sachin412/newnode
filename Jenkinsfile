pipeline {
    agent {
        docker { image 'myimage' 
               args '-p 27017:27017'}
    }
    stages {
        stage('Test') {
            steps {
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                sh 'npm run test'
            }
        }
    }
}
