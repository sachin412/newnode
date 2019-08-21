 
pipeline {  
    agent none
       stages { 
           stage('Build') { 
            agent { 
             docker { image 'node' }
            }
                      steps { 
                             sh '''   
                     ./node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml 
                     
                     echo "hello"                                    
                '''                                      
                     }
               }
            stage('test') { 
             agent {    docker { image 'mongo'}
                      }
                      steps  { 
                             sh  'echo "perfect"' 
                             ./node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000                            
                                                
                     }
               }
           
           
           }
    }
           
       
