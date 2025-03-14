pipeline {

agent any


stages {

stage('GIT') {

           steps {

               git branch: 'assil',

               url: 'https://github.com/assilbelhaj/jobpipe.git'

          }

     }

stage ('Compile Stage') {

    steps {

        sh 'mvn clean compile'

    }

}

}

}
