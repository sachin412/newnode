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
        
        checksPublishResults(
    tasks: true,
    pmd: [pattern: '**/target/pmd-results.xml', thresholds: [fail: [low: 100]]],
    cpd: [archive: false],
    aggregation: [thresholds: [fail: [high: 0]]],
    archive: true
            )

    }
}
