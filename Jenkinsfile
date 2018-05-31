import groovy.json.JsonOutput 

node ('docker-slave') {

    def app

    stage('Provision Dev App') {
        /*
         * 
         *  */

           withCredentials([string(credentialsId: 'sandboxauth', variable: 'bearer')]) {
            String morpheusUrl = 'https://sandbox.morpheusdata.com/api/app-templates'
	    Map<?, ?> postBody =  

[
  "image": "/assets/apps/template.png",
  "tiers": [
    "App": [
      "linkedTiers": [],
      "instances": [
        [
          "backup": [
            "createBackup": true
          ],
          "metadata": [
            [
              "name": "",
              "value": ""
            ]
          ],
          "instance": [
            "cloud": "VMware",
            "layout": [
              "code": "docker-1.7-single",
              "id": 217
            ],
            "name": "front-end01",
            "allowExisting": true,
            "type": "docker"
          ],
          "evars": [
            [
              "name": "",
              "value": ""
            ]
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
          "environments": [
            "Dev": [
              "groups": [
                "VMware": [
                  "clouds": [
                    "VMware": [
                      "instance": [
                        "allowExisting": false,
                        "layout": [
                          "code": "docker-1.7-single",
                          "id": 217
                        ],
                        "name": ""
                      ],
                      "volumes": [
                        [
                          "rootVolume": true,
                          "name": "root",
                          "maxStorage": 0,
                          "size": 1
                        ]
                      ],
                      "backup": [
                        "createBackup": false
                      ],
                      "config": [
                        "expose": 8080,
                        "dockerImageVersion": "latest",
                        "dockerRegistryId": "",
                        "dockerImage": "tcooksd858/node-web-app"
                      ],
                      "plan": [
                        "id": 80,
                        "code": "container-128"
                      ],
                      "planObj": [
                        "name": "128MB Memory, 1GB Storage",
                        "value": 80,
                        "id": 80,
                        "code": "container-128",
                        "maxStorage": 1073741824,
                        "maxMemory": 134217728,
                        "maxCpu": null,
                        "maxCores": null,
                        "customCpu": false,
                        "customMaxMemory": false,
                        "customMaxStorage": false,
                        "customMaxDataStorage": false,
                        "customCoresPerSocket": false,
                        "coresPerSocket": null,
                        "storageTypes": [
                          [
                            "id": 1,
                            "code": "standard",
                            "volumeType": "disk",
                            "minStorage": null,
                            "deletable": false,
                            "defaultType": true,
                            "resizable": false,
                            "volumeOptionSource": null,
                            "editable": false,
                            "minIOPS": null,
                            "maxIOPS": null,
                            "hasDatastore": true,
                            "optionTypes": [],
                            "customSize": true,
                            "displayOrder": 1,
                            "autoDelete": true,
                            "name": "Standard",
                            "configurableIOPS": false,
                            "customLabel": true,
                            "enabled": true,
                            "description": "Standard",
                            "externalId": null,
                            "maxStorage": null,
                            "version": null
                          ]
                        ],
                        "rootStorageTypes": [],
                        "addVolumes": false,
                        "customizeVolume": false,
                        "rootDiskCustomizable": false,
                        "noDisks": false,
                        "hasDatastore": false,
                        "minDisk": 1,
                        "maxDisk": null,
                        "lvmSupported": true,
                        "datastores": [],
                        "supportsAutoDatastore": true,
                        "autoOptions": null,
                        "cpuOptions": [],
                        "coreOptions": [],
                        "memoryOptions": [],
                        "rootCustomSizeOptions": [],
                        "customSizeOptions": [],
                        "customCores": false,
                        "maxDisks": null
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
          "backup": [
            "createBackup": true
          ],
          "metadata": [
            [
              "name": "",
              "value": ""
            ]
          ],
          "instance": [
            "cloud": "VMware",
            "layout": [
              "code": "mysql-5.7-single",
              "id": 90
            ],
            "name": "mysql-01",
            "allowExisting": true,
            "type": "mysql"
          ],
          "workflow": [
            "taskSetId": 38
          ],
          "evars": [
            [
              "name": "",
              "value": ""
            ]
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
          "environments": [
            "Dev": [
              "groups": [
                "VMware": [
                  "clouds": [
                    "VMware": [
                      "instance": [
                        "allowExisting": false,
                        "name": "",
                        "layout": [
                          "code": "mysql-5.7-single",
                          "id": 90
                        ]
                      ],
                      "volumes": [
                        [
                          "rootVolume": true,
                          "name": "root",
                          "maxStorage": 0,
                          "size": 20
                        ]
                      ],
                      "backup": [
                        "createBackup": true
                      ],
                      "plan": [
                        "id": 85,
                        "code": "container-2048"
                      ],
                      "planObj": [
                        "name": "128MB Memory, 1GB Storage",
                        "value": 80,
                        "id": 80,
                        "code": "container-128",
                        "maxStorage": 1073741824,
                        "maxMemory": 134217728,
                        "maxCpu": null,
                        "maxCores": null,
                        "customCpu": false,
                        "customMaxMemory": false,
                        "customMaxStorage": false,
                        "customMaxDataStorage": false,
                        "customCoresPerSocket": false,
                        "coresPerSocket": null,
                        "storageTypes": [
                          [
                            "id": 1,
                            "code": "standard",
                            "volumeType": "disk",
                            "minStorage": null,
                            "deletable": false,
                            "defaultType": true,
                            "resizable": false,
                            "volumeOptionSource": null,
                            "editable": false,
                            "minIOPS": null,
                            "maxIOPS": null,
                            "hasDatastore": true,
                            "optionTypes": [],
                            "customSize": true,
                            "displayOrder": 1,
                            "autoDelete": true,
                            "name": "Standard",
                            "configurableIOPS": false,
                            "customLabel": true,
                            "enabled": true,
                            "description": "Standard",
                            "externalId": null,
                            "maxStorage": null,
                            "version": null
                          ]
                        ],
                        "rootStorageTypes": [],
                        "addVolumes": false,
                        "customizeVolume": false,
                        "rootDiskCustomizable": false,
                        "noDisks": false,
                        "hasDatastore": false,
                        "minDisk": 1,
                        "maxDisk": null,
                        "lvmSupported": true,
                        "datastores": [],
                        "supportsAutoDatastore": true,
                        "autoOptions": null,
                        "cpuOptions": [],
                        "coreOptions": [],
                        "memoryOptions": [],
                        "rootCustomSizeOptions": [],
                        "customSizeOptions": [],
                        "customCores": false,
                        "maxDisks": null
                      ],
                      "deployment": [
                        "id": 29,
                        "versionId": 42
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
  "environment": "Dev",
  "templateName": "nodexpress",
  "name": "test",
  "templateImage": "",
  "type": "morpheus",
  "category": "APP",
  "group": [
    "name": "VMware",
    "id": 489
  ]
]


            echo morpheusApp.buildApp(morpheusUrl, postBody, "${bearer}")
        }
    }
  }

