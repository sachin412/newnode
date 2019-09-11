#!/usr/bin/env groovy

def call(String buildStatus = 'STARTED'){
 
sh './node_modules/.bin/nyc --reporter=cobertura node_modules/.bin/_mocha "test/**/*.js"'
 
}
