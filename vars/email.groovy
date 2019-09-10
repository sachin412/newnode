#!/usr/bin/env groovy

def call(String buildStatus = 'STARTED'){

mail bcc: '', body: 'please check your jobs console output', cc: '', from: '', replyTo: '', subject: 'job status failed', to: 'sachin.pavar@volansys.com'

}
