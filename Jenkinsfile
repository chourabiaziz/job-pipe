pipeline {
    agent any
    stages {
        stage('GITHUB')
         {
                   steps {
              checkout([$class: 'GitSCM',
              branches: [[name: '*/main']],
             userRemoteConfigs: [[url: 'https://github.com/chourabiaziz/job-pipe.git']]
                        ])

             }
        }
       
stage('Compilation') {
            steps {
                sh 'mvn clean compile package'
            }
        }


         stage('MVN Sonarqube') {
            steps {
 sh 'mvn sonar:sonar -Dsonar.host.url=http://192.168.91.128:9000 -Dsonar.token=squ_e59aab199b1a32e29c17d47545a04c49b1184dc1 -Dmaven.test.skip=true'        }

}


stage('Deploy to Nexus') {
                    steps {
                        sh 'mvn deploy -Dmaven.test.skip=true'

                    }
          }

 stage('Building image') {
            steps { 
                sh 'docker build -t chourabiaziz1/kaddem:1.0.0 .'
            }
        }

        stage('Deploy Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push chourabiaziz1/kaddem:1.0.0
                    '''
                }
            }
        }

        stage('Docker compose') {
            steps {
                sh 'docker compose up -d'
            }
        }




}}

