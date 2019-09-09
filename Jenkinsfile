 pipeline {
    agent any

    stages {
        stage('Build and Test') {
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
        
        stage("Extract test results") {
            steps {
                cobertura coberturaReportFile: 'reports/cobertura-coverage.xml'
            }
        } 
       
        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                sh 'node sonar-project.js'
                   
                    }
                }
        }
     stage('build user') {
      steps {
        wrap([$class: 'BuildUser']) {
          sh 'echo "${BUILD_USER}"'
        }
      }
    }
     stage("sidebar link") {
        steps  { 
        addBadge(icon: "folder.gif", text: "scm", link: "https://github.com/sachin412/newnode.git")  
         addShortText(text: "${GIT_COMMITTER_NAME}")  

        }
    }
     
  }   
 
/*  properties {
        sidebarLinks {
            // use built-in image
            link('https://github.com/sachin412/newnode.git', 'GIT', 'notepad.png')
            // use uploaded image
           // link('https://wiki.acme.org/', 'Wiki', '/userContent/wiki.png')
        }
    } */

        environment {
            //GIT_AUTHOR_NAME = 'sachin412'
            EMAIL_TO = 'sachin.pavar@volansys.com'
        } 
     
    post {
            failure {
                emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
                        to: EMAIL_TO, 
                        subject: 'Build failed in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
            }
            unstable {
                emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
                        to: EMAIL_TO, 
                        subject: 'Unstable build in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
            }
            changed {
                emailext body: 'Check console output at $BUILD_URL to view the results.', 
                        to: EMAIL_TO, 
                        subject: 'Jenkins build is back to normal: $PROJECT_NAME - #$BUILD_NUMBER'
            }
        }   
    }
        
