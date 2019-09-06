 node {
    checkout scm

    docker.withRegistry('http://localhost:5000') {

        docker.image('localhost:5000/image1'-u 0).inside {
            sh 'ls -la'
            sh ' npm install '                         
            sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . --fix > test.xml'
            sh './node_modules/.bin/nyc --reporter=cobertura node_modules/.bin/_mocha "test/**/*.js"'
        }
    }
}

node {
    stage 'after build'    
          cobertura coberturaReportFile: 'reports/cobertura-coverage.xml'
          checkstyle pattern: 'test.xml'
          junit  'testfile.xml'
          withSonarQubeEnv('sonarqube') {                                  
                        sh 'node sonar-project.js'                        
        }

}
