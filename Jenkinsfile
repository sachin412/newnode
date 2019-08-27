pipeline {
    agent {
        docker { image 'myimge:latest' }
    }
    stages {
        stage('Test') {
            steps {
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml '
                sh 'npm run test'
            }
        }
    }
}
