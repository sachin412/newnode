 node {
    checkout scm

    docker.withRegistry('http://localhost:5000') {

        docker.image('myimage').inside {
            sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . --fix > test.xml'
            sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000 > testfile.xml'
        }
    }
}


  
