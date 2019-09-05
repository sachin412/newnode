pipeline {
    agent {
        docker { image 'node'
               args '-u 0' }
    }
   stages {
        stage('Test') {
            steps {
                sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . --fix > check.xml' 
                sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000  > test1.xml'            
                  }
        }        
        stage('Checkstyle') {
           steps {   
                 checkstyle pattern: 'check.xml'
                                
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
     post {
         always {
              checkstyle pattern: 'test.xml'
              junit 'test1.xml'
          }
        } 
}
  
        
