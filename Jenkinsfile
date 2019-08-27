node {
    checkout scm
    docker.image('mongo').withRun('-e "MONGO_ROOT_PASSWORD=admin"') { c ->
        docker.image('mongo').inside("--link ${c.id}:db") {
            /* Wait until mysql service is up */
            sh 'while ! mongodadmin ping -hdb --silent; do sleep 1; done'
        }
        docker.image('node').inside("--link ${c.id}:db") {
            /*
             * Run some tests which require MySQL, and assume that it is
             * available on the host name `db`
             */
            sh './node_modules/.bin/eslint  -f checkstyle --ignore-path .gitignore . > test.xml '
            sh './node_modules/.bin/mocha --recursive ./test/*.* --timeout 10000'
            
        }
    }
}
