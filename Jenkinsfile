 
pipeline {  
    agent none
       stages { 
           stage('Build') { 
            agent { 
             docker { image 'node' }
            }
                      steps { 
                             sh '''   
                     ./node_modules/.bin/eslint --ignore-path .gitignore . > test.xml         
                     echo "hello"                                    
                '''                                      
                     }
               }
            stage('test') { 
             agent {    docker { image 'mongo'}
                      }
                      steps  { 
                             sh ''' 
                        echo "perfect" 
                     ./node_modules/.bin/mocha --recursive -f checkstyle ./test/*.* --timeout 10000                                       
                '''                                      
                     }
               }
           
           
           }
    }
           
       
