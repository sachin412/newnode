pipeline {
    agent {
        docker { image 'ageapps/docker-node-mongo' }
    }
    stages {
        stage('Test') {
            steps {
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml '
                sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
            }
        }
    }
}
