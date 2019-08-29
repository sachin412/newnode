pipeline {
    agent {
        docker { image 'node'}
    }
    stages {
        stage('Test') {
            steps {
                 
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
            }
        }
        
        stage('Checkstyle') {
            steps {
                checkstyle pattern: 'test.xml'
            }
        }        
    }
}
