 node {
    checkout scm
    /*
     * In order to communicate with the MySQL server, this Pipeline explicitly
     * maps the port (`3306`) to a known port on the host machine.
     */
    docker.image('mongo') { c ->
        /* Wait until mysql service is up */
        sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
        /* Run some tests which require MySQL */
        sh 'echo "check"'
    }
}