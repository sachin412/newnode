pipeline {
    agent {
        docker { image 'node'
               args '-u 0'}
    }
    stages {
        stage('Test') {
            steps {
                sh 'npm install'
                sh 'npm install eslint'
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
            }
        }                    
    }
}
