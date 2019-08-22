 
pipeline {  
    agent none
       stages { 
           /*stage('Build') { 
            agent { 
             docker { image 'mongo'
                      
                    }
            }
                      steps {
                       echo "hello"                      
                                                      
                     }
               } */
            stage('test') { 
             agent {    docker { image 'ageapps/docker-node-mongo'
                               
                               }
                      }
                      steps  {                                         
                             sh '''  
                       node -v
                       mongo --version
                       npm install
                       npm build
                     ./node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml 
                     ./node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000 
                     echo "hello"                                    
                '''                           
                                                
                     }
               }
           
           
           }
    }
           
       
