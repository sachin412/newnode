 
pipeline {  
    agent none
       stages { 
           stage('Build') { 
            agent { 
             docker { image 'mongo' }
            }
                      steps { sh  'mongo' 
                             sh  'use admin'
                             sh 'db.createUser({user:"admin", pwd:"admin123", roles:[{role:"root", db:"admin"}]})'
                                                      
                     }
               }
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
           
       
