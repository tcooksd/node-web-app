import groovy.json.JsonOutput 

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

           withCredentials([string(credentialsId: 'newtoken', variable: 'bearer')]) {
            String morpheusUrl = 'https://demo.morpheusdata.com/api/apps'

            Map<?, ?> postBody = ["name":"tcookjenkins","description":"nodejsapp","category":"app","templateImage":"","tiers":["Web":["linkedTiers":[],"instances":[["instance":["type":"docker","name":"NodeJS"],"environments":["Demo":["groups":["VMware":["clouds":["VMwarevCenter":["instance":["allowExisting":true,"layout":["code":"docker-1.7-single","id":206],"name":"","expireDays":"1"],"volumes":[["rootVolume":true,"name":"root","size":1]],"backup":["createBackup":true],"config":["expose":8080,"dockerImageVersion":"latest","dockerRegistryId":"","dockerImage":"tcooksd858/node-web-app"],"plan":["id":68,"code":"container-128"],"ports":[["name":"web","port":"8080","lb":""]]]]]]]]]]]]]

            echo morpheusApp.buildApp(morpheusUrl, postBody, "${bearer}")
        }
    }
  }

