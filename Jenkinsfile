library identifier: 'newnode@test-lib', retriever: legacySCM(scm) 
pipeline {
    agent any

    stages {
        
        stage ('pre-build') {
            steps {
                     sh 'npm install'            
            }
        }
        stage('eslint') {
            steps {                                       
                    sh './node_modules/.bin/eslint -f checkstyle --ignore-path .gitignore . --fix > eslint.xml'
                    
                                    
            }
        }
     stage ('test') {
            steps {
                     sh './node_modules/.bin/nyc --reporter=cobertura node_modules/.bin/_mocha "test/**/*.js"'          
            }
        }
      stage ('sonarqube') {
            steps {
                     sh 'npm install sonarqube-scanner --save-dev'            
            }
        }
    
    }   

post {
   failure {
      email()
      }
   always {
       _cobertura()
       _sidebar()  
       _eslint()
       _sonar()
   } 
  }
 }
  
 
