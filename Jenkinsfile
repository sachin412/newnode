pipeline {
    agent {
        docker { image 'myimage:1' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'service mongodb status  && sleep 100'
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
            }
        }
    }
}
