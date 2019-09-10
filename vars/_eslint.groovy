#!/usr/bin/env groovy

def call(String buildStatus = 'STARTED'){
 
 checkstyle canComputeNew: false, defaultEncoding: '', healthy: '', pattern: 'eslint.xml', unHealthy: ''
 
}
