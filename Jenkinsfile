library identifier: 'library@master', retriever: legacySCM(scm) 
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
                    
                    _eslintcommand()
                                    
            }
        }
     stage ('test') {
            steps {
                    _testrun()         
            }
        }
      stage ('sonarqube') {
            steps {
                     _sonarqube()            
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
  
 
