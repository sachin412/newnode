pipeline {
    agent {
        docker { image 'myimage1'
                args '-u 0'}
    }
    stages {
        stage('Test') {
            steps {
                sh 'service mongodb start'
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
