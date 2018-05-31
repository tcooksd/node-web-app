import groovy.json.JsonOutput 

node ('docker-slave') {

    def app

    stage('Provision Dev App') {
        /*
         *
         *  */

           withCredentials([string(credentialsId: 'sandboxauth', variable: 'bearer')]) {
            String morpheusUrl = 'https://sandbox.morpheusdata.com/api/apps'
	    Map<?, ?> postBody =  

 ["image": "/assets/apps/template.png",
  "tiers": [
    "App": [
      "linkedTiers": [],
      "instances": [
        [
          "instance": [
            "name": "nodeapp",
            "type": "docker"
          ],
          "environments": [
            "Dev": [
              "groups": [
                "VMware": [
                  "clouds": [
                    "VMware": [
                      "backup": [
                        "createBackup": true
                      ],
                      "instance": [
                        "layout": [
                          "code": "docker-1.7-single",
                          "id": 217
                        ],
                        "name": "",
                        "allowExisting": true
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
                      ]
                    ]
                  ]
                ]
              ]
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
            "name": "mysqlapp",
            "type": "mysql"
          ],
          "environments": [
            "Dev": [
              "groups": [
                "VMware": [
                  "clouds": [
                    "VMware": [
                      "backup": [
                        "createBackup": true
                      ],
                      "instance": [
                        "layout": [
                          "code": "mysql-5.7-single",
                          "id": 90
                        ],
                        "name": "",
                        "allowExisting": true
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
                      "workflow": [
                        "taskSetId": 38
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ]
  ],
  "name": "nodexpressapp.170",
  "templateImage": "",
  "type": "morpheus",
  "category": "APP"
]





            echo morpheusApp.buildApp(morpheusUrl, postBody, "${bearer}")
        }
    }
  }

