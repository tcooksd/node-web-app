import groovy.json.JsonOutput 
def morpheusApp =  new org.tadamhicks.JenkinsHttpClient();

node ('docker-slave') {


    stage('Provision Dev App') {
        /*
         *
         *  */

        withCredentials([string(credentialsId: 'morphauth', variable: 'bearer')]) {
            String morpheusUrl = 'https://sandbox.morpheusdata.com/api/apps' 
	    Map<?, ?> postBody = [ "image": "/assets/apps/template.png"]

   	    morpheusApp.buildApp(morpheusUrl, postBody, "${bearer}")
        }
    }
}

