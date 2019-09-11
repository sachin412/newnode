library identifier: 'library@master', retriever: modernSCM(
  [$class: 'GitSCMSource',
   remote: 'https://github.com/sachin412/library.git',
   ]) 
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
