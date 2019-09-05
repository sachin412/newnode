 node {
    checkout scm
    docker.image('mysql:5').withRun('-e "MYSQL_ROOT_PASSWORD=Devops@000!!!" -p 3307:3306') { c ->
        docker.image('mysql:5').inside("--link ${c.id}:db") {
          /* Wait until mysql service is up */
          sh 'echo "hello"'
        }
        docker.image('node').inside("--link ${c.id}:db") {
          /*
           * Run some tests which require MySQL, and assume that it is
           * available on the host name `db`
           */
          sh 'npm -v'
        }
  }
}
