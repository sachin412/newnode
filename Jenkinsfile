library identifier: 'newnode@testlibrary', retriever: legacySCM(scm) 
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                    sh 'echo "$GIT_AUTHOR_NAME"'
                    sh 'npm install'                  
                    sh './node_modules/.bin/eslint -f checkstyle --ignore-path .gitignore . --fix > eslint.xml'
                    sh './node_modules/.bin/nyc --reporter=cobertura node_modules/.bin/_mocha "test/**/*.js"'
                    sh 'npm install sonarqube-scanner --save-dev' 
                   
                  
            }
        }
        
        stage('Checkstyle') {
           steps {        
        checkstyle pattern: 'eslint.xml'
           }
        }
        
       /* stage("Extract") {
            steps {
                cobertura coberturaReportFile: 'reports/cobertura-coverage.xml'
            }
        } */ 
       
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                sh 'node sonar-project.js'
                   
                    }
                }
        }
  
     stage("sidebar link") {
        steps  { 
        addBadge(icon: "folder.gif", text: "scm", link: "https://github.com/sachin412/newnode.git")  
         addShortText(text: "${GIT_AUTHOR_NAME}")  

        }
    }
     
  }   
 
 /* properties {
        sidebarLinks {
            // use built-in image
            link('https://github.com/sachin412/newnode.git', 'GIT', 'notepad.png')
            // use uploaded image
           // link('https://wiki.acme.org/', 'Wiki', '/userContent/wiki.png')
        }
    } */

        environment {
            GIT_AUTHOR_NAME = 'sachin412'            
        } 
  post {
   failure {
      email()
      }
   always {
       _cobertura()
      } 
  }
 }
  
