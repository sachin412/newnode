 
pipeline { 
   agent { 
        docker { 
                image 'node' 
               }
            }
       stages { 
           stage('Build') { 
                      steps { 
                           sh 'npm install'
                     }
               }
         }
    }
