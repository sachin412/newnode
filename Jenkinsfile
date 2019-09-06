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
    sh './node_modules/.bin/mocha --recursive ./test/index_test.js --timeout 10000 > testfile.xml'
    }

node {
    stage 'after build'    
          checkstyle pattern: 'test.xml'
          junit  'testfile.xml'
          withSonarQubeEnv('sonarqube') {                                  
                        sh 'node sonar-project.js'                        
        }
          
}



  
