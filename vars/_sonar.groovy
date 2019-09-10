#!/usr/bin/env groovy

def call(String buildStatus = 'STARTED'){
 
withSonarQubeEnv('sonarqube') {
                sh 'node sonar-project.js'
                   }
 
}
