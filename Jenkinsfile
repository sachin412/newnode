pipeline {
    agent {
        docker { image 'node'}
    }
    stages {
        stage('Test') {
            steps {
                sh 'service mongodb start'
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
            }
        }                    
    }
}
