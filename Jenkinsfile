 
pipeline {  
    agent none
       stages { 
        /*   stage('Build') { 
            agent { 
             docker { image 'mongo' }
            }
                      steps {
                       sh  'mongo -u admin -p "admin123"'
                        
                                                      
                     }
               } */
            stage('test') { 
             agent {    docker { image 'node'}
                      }
                      steps  { 
                                         
                                          sh '''   
                     ./node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml 
                     ./node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000 
                     echo "hello"                                    
                '''                           
                                                
                     }
               }
           
           
           }
    }
           
       
