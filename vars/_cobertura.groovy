#!/usr/bin/env groovy

def call(String buildStatus = 'STARTED'){
 
cobertura autoUpdateHealth: false, autoUpdateStability: false, classCoverageTargets: '80, 0, 0', coberturaReportFile: ' ', conditionalCoverageTargets: '70, 0, 0', failNoReports: false, failUnhealthy: false, failUnstable: false, fileCoverageTargets: '80, 0, 0', lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, packageCoverageTargets: '80, 0, 0', sourceEncoding: 'ASCII', zoomCoverageChart: false

}
