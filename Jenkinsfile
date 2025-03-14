pipeline {
    agent any
    stages {
        stage('Checkout')
         {
                   steps {
              checkout([$class: 'GitSCM',
              branches: [[name: '*/main']],
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
                sh 'mvn sonar:sonar -Dsonar.login=squ_20940abd7d7ed773bdffdda162ef292f8e594582 -Dmaven.test.skip=true'
            }
        }

}
}

