library identifier: "pipeline-library@v1.5",
retriever: modernSCM(
  [
    $class: "GitSCMSource",
    remote: "https://github.com/redhat-cop/pipeline-library.git" 
  ]
)

 

appName = "backend-buildconfig"

 

pipeline {
    agent any
    stages {
//         stage("Checkout") {
//             steps {
//                 checkout scm
//             }
//         }

        stage("Docker build backend"){
            steps {
                binaryBuild(buildConfigName: appName, buildFromPath: ".")
            }
        }

       stage("Tag image") {
       steps{
    tagImage([
            sourceImagePath: "amisha-jenkins",
            sourceImageName: "expense-tracker-backend-trial",
            sourceImageTag : "latest",
            toImagePath: "amisha-jenkins",
            toImageName    : "expense-tracker-backend-trial",
            toImageTag     : "${env.BUILD_NUMBER}"

    ])
       }
       }
      stage("deploy backend") {
        steps {
            script {
                openshift.withCluster() {
                    openshift.withProject("$PROJECT_NAME") {
                        echo "Using project: ${openshift.project()}"
                         sh 'sh -x $WORKSPACE/backend-deployment.sh'
                    }
                 }
            }
        } 
    }  
   }   
}   
