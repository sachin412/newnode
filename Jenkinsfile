 node {
    checkout scm

    def customImage = docker.build("myimage:${env.BUILD_ID}")

    customImage.inside {
        sh 'npm -v'
    }
}
