import groovy.json.JsonOutput 

node ('docker-slave') {

    def app

    stage('Provision Dev App') {
        /*
         *
         *  */

           withCredentials([string(credentialsId: 'sandboxauth', variable: 'bearer')]) {
            String morpheusUrl = 'https://sandbox.morpheusdata.com/api/apps'
	    Map<?, ?> postBody =  ["image": "/assets/apps/template.png",
  "tiers": [
    "App": [
      "linkedTiers": [
        "Database"
      ],
      "instances": [
        [
          "instance": [
            "type": "docker",
            "cloud": "VMware",
            "layout": [
              "code": "docker-1.7-single",
              "id": 217
            ],
            "name": "$[account]-$[cloudCode]-$[type]-$[sequence]",
            "allowExisting": true
          ],
          "backup": [
            "createBackup": true
          ],
          "volumes": [
            [
              "size": 3,
              "name": "root",
              "rootVolume": true
            ]
          ],
          "ports": [
            [
              "port": "8080",
              "lb": "",
              "name": "web"
            ]
          ],
          "config": [
            "dockerImage": "tcooksd858/node-web-app",
            "dockerImageVersion": "latest",
            "expose": 8080,
            "dockerRegistryId": ""
          ],
          "plan": [
            "code": "container-256",
            "id": 81
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
    ],
    "Database": [
      "linkedTiers": [],
      "instances": [
        [
          "instance": [
            "type": "mysql",
            "cloud": "VMware",
            "layout": [
              "code": "mysql-5.7-single",
              "id": 90
            ],
            "name": "$[account]-$[cloudCode]-$[type]-$[sequence]",
            "allowExisting": true
          ],
          "backup": [
            "createBackup": true
          ],
          "volumes": [
            [
              "size": 1,
              "name": "root",
              "rootVolume": true
            ]
          ],
          "plan": [
            "code": "container-128",
            "id": 80
          ],
          "config": [
            "rootPassword": "************"
          ],
          "deployment": [
            "versionId": 42,
            "id": 29
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
          ],
          "workflow": [
            "taskSetId": 38
          ]
        ]
      ]
    ]
  ],
  "name": "test01",
  "templateImage": "",
  "type": "morpheus",
  "category": "APP",
  "id": 49,
  "templateName": "nodexpressapp.170",
  "group": [
    "id": 489,
    "name": "VMware"
  ],
  "environment": "Dev"]


            echo morpheusApp.buildApp(morpheusUrl, postBody, "${bearer}")
        }
    }
  }

