import groovy.json.JsonOutput 

node ('docker-slave') {

    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("tcooksd858/node-web-app")
    }


    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

    stage('Stage Dev App') {
	   
           withCredentials([string(credentialsId: 'morphauth', variable: 'bearer')]) {
           String morpheusUrl = 'https://sandbox.morpheusdata.com/api/app-templates'
  	   Map<?, ?> postBody = ["image":"/assets/apps/template.png","tiers":["App":["linkedTiers":[],"instances":[["instance":["name":"nodeapp","type":"docker"],"environments":["Dev":["groups":["VMware":["clouds":["VMware":["backup":["createBackup":true],"instance":["layout":["code":"docker-1.7-single","id":217],"name":"","allowExisting":true],"volumes":[["size":3,"name":"root","rootVolume":true]],"ports":[["port":"8080","lb":"","name":"web"]],"config":["dockerImage":"tcooksd858/node-web-app","dockerImageVersion":"latest","expose":8080,"dockerRegistryId":""],"plan":["code":"container-256","id":81]]]]]]]]]],"Database":["linkedTiers":[],"instances":[["instance":["name":"mysqlapp","type":"mysql"],"environments":["Dev":["groups":["VMware":["clouds":["VMware":["backup":["createBackup":true],"instance":["layout":["code":"mysql-5.7-single","id":90],"name":"","allowExisting":true],"volumes":[["size":1,"name":"root","rootVolume":true]],"plan":["code":"container-128","id":80],"config":["rootPassword":"************"],"deployment":["versionId":42,"id":29]]]]]]]]]]],"name":"nodexpressapp." + "${env.BUILD_NUMBER}","templateImage":"","type":"morpheus","category":"APP"] 
            echo morpheusApp.buildApp(morpheusUrl, postBody, "${bearer}")
      }
    }
    stage('Provision Dev App') {
        /*
         *
         *  */

           withCredentials([string(credentialsId: 'morphauth', variable: 'bearer')]) {
            String morpheusUrl = 'https://sandbox.morpheusdata.com/api/apps'
	    Map<?, ?> postBody = ["image":"/assets/apps/template.png","tiers":["App":["linkedTiers":[],"instances":[["instance":["type":"docker","cloud":"VMware","layout":["code":"docker-1.7-single","id":217],"name":"","allowExisting":true],"backup":["createBackup":true],"volumes":[["size":3,"name":"root","rootVolume":true]],"ports":[["port":"8080","lb":"","name":"web"]],"config":["dockerImage":"tcooksd858/node-web-app","dockerImageVersion":"${env.BUILD_NUMBER}","expose":8080,"dockerRegistryId":""],"plan":["code":"container-256","id":81],"metadata":[["name":"","value":""]],"evars":[["name":"","value":""]]]]],"Database":["linkedTiers":[],"instances":[["instance":["type":"mysql","cloud":"VMware","layout":["code":"mysql-5.7-single","id":90],"name":"","allowExisting":true],"backup":["createBackup":true],"volumes":[["size":1,"name":"root","rootVolume":true]],"plan":["code":"container-128","id":80],"config":["rootPassword":"************"],"deployment":["versionId":42,"id":29],"metadata":[["name":"","value":""]],"evars":[["name":"","value":""]]]]]],"name":"testapp." + "${env.BUILD_NUMBER}" ,"templateImage":"","type":"morpheus","category":"APP","id":33,"templateName":"nodexpress","group":["id":489,"name":"VMware"],"environment":"Dev"] 
            echo morpheusApp.buildApp(morpheusUrl, postBody, "${bearer}")
        }
    }
  }

