pipeline {

agent any


stages {

stage('GIT') {

           steps {

               git branch: 'main',

               url: 'https://github.com/chourabiaziz/job-pipe.git'

          }

     }

stage ('Compile Stage') {

    steps {

        sh 'mvn clean compile'

    }

}

}

}
