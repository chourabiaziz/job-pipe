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
 sh 'mvn sonar:sonar -Dsonar.host.url=http://192.168.91.128:9000 -Dsonar.token=squ_e59aab199b1a32e29c17d47545a04c49b1184dc1 -Dmaven.test.skip=true'        }

}
}

