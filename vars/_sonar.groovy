#!/usr/bin/env groovy

def call(String buildStatus = 'STARTED'){
 
  withSonarQubeEnv(credentialsId: '8dbd6980-2c82-4528-baef-a4b58f2c22cd') {
    node sonar-project.js
}
 
}
