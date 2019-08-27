node {
    checkout scm
    /*
     * In order to communicate with the MySQL server, this Pipeline explicitly
     * maps the port (`3306`) to a known port on the host machine.
     */
    docker.image('ageapps/docker-node-mongo').withRun('-e "MYSQL_ROOT_PASSWORD=my-secret-pw" -p 3306:3306') { c ->
        /* Wait until mysql service is up */
        
        /* Run some tests which require MySQL */
        sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml '
        sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
    }
}
