 node {
    checkout scm

    docker.withRegistry('http://localhost:5000') {

        docker.image('localhost:5000/image1').inside { 
            sh 'npm -v'            
        }
    }
}

node {
      stage 'eslint'
        sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . --fix > test.xml
      stage 'test'
        sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
      stage 'after build'            
          checkstyle pattern: 'test.xml'
          withSonarQubeEnv('sonarqube') {                                  
             sh 'node sonar-project.js'                        
        }

}
