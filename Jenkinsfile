 node {
    checkout scm

    def customImage = docker.build("myimage:${env.BUILD_ID}")

    customImage.inside {
        sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000 > testfile.xml'
        sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . --fix > test.xml'
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
