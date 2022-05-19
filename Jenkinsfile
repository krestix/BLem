pipeline {
agent any
stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Build_app'){
        steps{
            dir('newapp'){
                script{
                    git 'https://github.com/krestix/BLem'
                    app = docker.build("lmi:latest")
                    docker.withRegistry( "https://registry.hub.docker.com", "dockerhub" ) {
                    app.push("latest")
                }
            }
        }
    }

}
    stage('apply_pod')
    {
        steps{
            script{
        sh 'kubectl apply -f pod.yaml'
            }
        }
    }

}
}