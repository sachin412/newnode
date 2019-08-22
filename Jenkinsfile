 
pipeline {  
    agent none
       stages { 
         /*  stage('Build') { 
            agent { 
             docker { image 'mongo' }
            }
                      steps {
                       echo "hello"
                        
                                                      
                     }
               } */
            stage('test') { 
             agent {    docker { image 'davidsblog/node-mongo'}
                      }
                      steps  { 
                                         
                                          sh '''   
                       npm install  -g            
                     ./node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml 
                     ./node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000 
                     echo "hello"                                    
                '''                           
                                                
                     }
               }
           
           
           }
    }
           
       
