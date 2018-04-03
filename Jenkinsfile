import groovy.json.JsonOutput 

node {

    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm

        docker.withServer('tcp://10.30.20.127:4243', '') {
		app = docker.build('tcooksd858/node-web-app')
          }
      }

}
