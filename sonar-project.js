const sonarqubeScanner = require('sonarqube-scanner');
     sonarqubeScanner({
       options : {
       'sonar.sources': '.',
       'sonar.inclusions' : 'src/**' // Entry point of your code
       }
     }, () => {});
