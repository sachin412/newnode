const sonarqubeScanner = require('sonarqube-scanner')
sonarqubeScanner({
        serverUrl: 'http://192.168.3.244:9000',   
           options : {
                   'sonar.sources': '.',
                   'sonar.inclusions' : 'src/**' // Entry point of your code
       }  
     }, () => {});
