pipeline {
  agent {
    docker {
      image 'docker'
    }

  }
  stages {
    stage('') {
      agent {
        docker {
          image 'docker'
        }

      }
      steps {
        sh 'docker build -t test .'
      }
    }

  }
}