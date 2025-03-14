pipeline {
    agent any
    stages {
        stage('Checkout')
         {
                   steps {
              checkout([$class: 'GitSCM',
              ranches: [[name: '*/main']],
             userRemoteConfigs: [[url: 'https://github.com/chourabiaziz/job-pipe.git']]
                        ])

             }
        }
       
stage('Compile Stage') {
            steps {
                sh 'mvn clean compile package'
            }
        }


         stage('MVN Sonarqube') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.login=squ_03bfe3bbdc402fe989c8c1cec222f95456b6c770 -Dmaven.test.skip=true'
            }
        }

}

