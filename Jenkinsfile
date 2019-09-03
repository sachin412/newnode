pipeline {
    agent {
        docker { image 'node'
               args '-u 0'}
    }
    stages {
        stage('Test') {
            steps {
                sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
               // sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
                
            }
        }        
     
        
        stage('Checkstyle') {
           steps {        
        checkstyle pattern: 'test.xml'
             }
         }
       
        stage('SonarQube analysis 1') {
            steps {
                sh 'node sonar-project.js'                
            }
        }
      }
   }
    
    
