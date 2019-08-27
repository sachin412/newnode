 node {
    checkout scm
    /*
     * In order to communicate with the MySQL server, this Pipeline explicitly
     * maps the port (`3306`) to a known port on the host machine.
     */
    docker.image('myimage').withRun('-e "MONGO_ROOT_PASSWORD=admin" ) { c ->
        /* Wait until mysql service is up */
        sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml'
        /* Run some tests which require MySQL */
        sh 'npm run test'
    }
}
