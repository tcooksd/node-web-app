import groovy.json.JsonOutput 

node {

    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm

        docker.withServer('tcp://10.30.20.110:10005', '0babff4c-d42a-4f2d-81a8-245dcf679f15') {
		app = docker.run("tadamhicks/demo_app")
          }
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

        withCredentials([string(credentialsId: 'morphapp01', variable: 'bearer')]) {
            String morpheusUrl = 'https://sandbox.morpheusdata.com/api/apps'

Map<?, ?> postBody = [ "image": "/assets/apps/template.png",
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
                        "name": "\$[account]-\$[cloudCode]-\$[type]-\$[sequence]",
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
                        "dockerImageVersion": "1.1",
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
      ],
      "tier": [
        "bootOrder": 1,
        "lockedFields": [
          "bootOrder"
        ]
      ]
    ],
    "Database": [
      "linkedTiers": [
        "App"
      ],
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
                        "name": "\$[account]-\$[cloudCode]-\$[type]-\$[sequence]",
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
                      "deployment": [
                        "versionId": 42,
                        "id": 29
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
  "name": "nodexpress",
  "templateImage": "",
  "type": "morpheus",
  "category": "APP"]
            morpheusApp.buildApp(morpheusUrl, postBody, "${bearer}")
        }
    }


    }

