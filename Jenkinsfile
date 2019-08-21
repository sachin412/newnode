 
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
                     ./node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000
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
                                                         
                '''                                      
                     }
               }
           
           
           }
    }
           
       
