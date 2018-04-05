import groovy.json.JsonOutput 
@Library('morpheusApp@1.1') _
import org.tadamhicks.JenkinsHttpClient

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

            Map<?, ?> postBody = ["name":"nodeapp","type":"docker"]

           morpheusApp.buildApp(morpheusUrl, postBody, "${bearer}")
	   morpheusApp.echo("test from tcook") 
        }
    }


    }

