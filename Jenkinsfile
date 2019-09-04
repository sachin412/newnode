
pipeline {
    agent {
        docker { image 'node'
               args '-u 0'}
    }
    stages {
        stage('Test') {
            steps {
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . --fix > test.xml'
             //   sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'              
             }
        }        
        stage('Checkstyle') {
           steps {        
        checkstyle pattern: 'test.xml'                
             }
         }       
        stage('SonarQube analysis 1') {
            steps {
                withSonarQubeEnv('sonarqube') {                                  
                        sh 'node sonar-project.js'
                }
              }
          }
      }
   }
    
    
