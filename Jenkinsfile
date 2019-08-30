pipeline {
    agent {
        docker { image 'node'
               args '-u 0'}
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
        sh 'test.xml --report=checkstyle --report-file=`pwd`test.xml --standard=PSR2 --extensions=php --ignore=autoload.php --ignore=vendor/ . || exit 0'
        checkstyle pattern: 'build/logs/checkstyle.xml'
            }
        }
    }
}
