#!/usr/bin/env groovy

def call(String buildStatus = 'STARTED'){
 
  sh 'npm install sonarqube-scanner --save-dev'      
 
}
