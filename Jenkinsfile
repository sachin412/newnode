 
pipeline { 
   agent { 
        docker { 
                image 'node' 
               }
            }
       stages { 
           stage('Build') { 
                      steps { 
                             sh '''   
                     ./node_modules/.bin/eslint --ignore-path .gitignore . > test.xml         
                     ./node_modules/.bin/mocha --recursive -f checkstyle ./test/*.* --timeout 10000                                       
                '''
                     }
               }
         }
    }
