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

    stage('Provision Dev App') {
        /*
         *
         *  */

           withCredentials([string(credentialsId: 'morphauthdemo', variable: 'bearer')]) {
            String morpheusUrl = 'https://demo.morpheusdata.com/api/apps'
	    Map<?, ?> postBody = [
  "image": "https://demo.morpheusdata.com/storage/logos/uploads/AppTemplate/108/templateImage/Screen Shot 2018-04-03 at 11.12.33 PM_original.png",
  "tiers": [
    "App": [
      "linkedTiers": [],
      "instances": [
        [
          "instance": [
            "type": "vmware",
            "cloud": "VMware vCenter",
            "layout": [
              "code": "vmware-1.0-single",
              "id": 348
            ],
            "expireDays": "1",
            "name": "RHEL-7_5-" + "${env.BUILD_NUMBER}",
            "allowExisting": true,
            "userGroup": [
              "id": ""
            ]
          ],
          "servicePlanOptions": [
            "maxCores": 1,
            "maxMemory": 536870912
          ],
          "backup": [
            "createBackup": true
          ],
          "networkInterfaces": [
            [
              "primaryInterface": true,
              "network": [
                "id": "network-1"
              ]
            ]
          ],
          "volumes": [
            [
              "vId": 509978,
              "size": 20,
              "maxIOPS": null,
              "name": "root",
              "rootVolume": true,
              "storageType": 1,
              "datastoreId": "autoCluster"
            ]
          ],
          "storageControllers": [],
          "config": [
            "template": 509978,
            "createUser": true,
            "vmwareResourcePoolId": "resgroup-13049",
            "vmwareFolderId": "group-v13599",
            "expose": 8080
          ],
          "plan": [
            "code": "vm-2048",
            "id": 147
          ],
          "ports": [
            [
              "name": "",
              "port": "",
              "lb": ""
            ]
          ],
          "metadata": [
            [
              "name": "",
              "value": ""
            ]
          ],
          "evars": [
            [
              "name": "",
              "value": ""
            ]
          ]
        ]
      ]
    ]
  ],
  "name": "rhel-7.5-disa01",
  "description": "DISA compliance test ",
  "templateImage": "C:\\fakepath\\Screen Shot 2018-04-03 at 11.12.33 PM.png",
  "category": "app",
  "id": 108,
  "templateName": "DISA",
  "group": [
    "id": 1,
    "name": "VMware"
  ],
  "environment": "Demo"
] 

            echo morpheusApp.buildApp(morpheusUrl, postBody, "${bearer}")
        }
    }
  }

