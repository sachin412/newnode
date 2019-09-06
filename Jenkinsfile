 node {
    checkout scm

    docker.withRegistry('http://localhost:5000') {

        docker.image('localhost:5000/image1').inside {
            sh 'ls -la'
            sh 'apt install npm -y'
            sh 'npm install'             
            sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . --fix > test.xml'
            sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000 > testfile.xml'
        }
    }
}

node {
    stage 'after build'    
          checkstyle pattern: 'test.xml'
          junit  'testfile.xml'
          withSonarQubeEnv('sonarqube') {                                  
                        sh 'node sonar-project.js'                        
        }

}
