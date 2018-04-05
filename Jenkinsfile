import groovy.json.JsonOutput 
@Library('morpheusApp@1.1') _
import org.tadamhicks.JenkinsHttpClient



        def buildApp(String morpheusUrl, Map<?, ?> postBody, String bearerToken) {
		JenkinsHttpClient http = new JenkinsHttpClient()
		http.postJson(morpheusUrl, postBody, bearerToken)
	}	

node ('docker-slave') {

    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }




    stage('Provision Dev App') {
        /*
         *
         *  */

        withCredentials([string(credentialsId: 'morphauth', variable: 'bearer')]) {
            String morpheusUrl = 'https://sandbox.morpheusdata.com/api/apps'

            Map<?, ?> postBody = ["name":"nodeapp01","type":"docker"]

           buildApp(morpheusUrl, postBody, "${bearer}")
        }
    }


    }

