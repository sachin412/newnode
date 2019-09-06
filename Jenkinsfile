stage('Build & eslint'){ 
 node {
    checkout scm 
     docker.image('mongo').withRun('-e "MONGO_INITDB_ROOT_USERNAME=root" -e "MONGO_INITDB_ROOT_PASSWORD=Devops@000!!!" -p 27018:27017') { c ->       
        sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . --fix > test.xml'        
        
        }
    }
}

node {
 stage 'test'  
    sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
 finally {
          checkstyle pattern: 'test.xml'
          withSonarQubeEnv('sonarqube') {                                  
                        sh 'node sonar-project.js'
        }
    }

}



  
