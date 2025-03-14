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
                sh 'docker build -t chourabiaziz1/kaddem:1.0 .'
            }
        }
stage('Deploy Image') {
    steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
            script {
                // Connecte-toi à Docker Hub
                sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USER --password-stdin"
                
                // Push de l'image Docker
                sh "docker push chourabiaziz1/kaddem:1.0"
            }
        }
    }
}

stage('Docker compose') {
    steps {
        // Assurez-vous que docker-compose est dans le bon répertoire
        sh 'docker-compose -f /chemin/vers/docker-compose.yml up -d'
    }
}





}}

