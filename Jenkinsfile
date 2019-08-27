pipeline {
    agent {
        docker { image 'myimge:latest' }
    }
    stages {
        stage('Test') {
            steps {
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml '
                sh 'mongoimport --host=127.0.0.1 -d testdb -c testc --file test/index_test.js'
            }
        }
    }
} 
