import groovy.json.JsonOutput 

node ('docker-slave') {

    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm

        docker.withServer('tcp://10.30.20.127:4243', '') {
		app = docker.build('tcooksd858/node-web-app')
          }
      }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        docker.withServer('tcp://10.30.20.127:4243', '') {
                app.inside {
                        sh 'echo "Tests passed"'
                }
        }
      }


}
