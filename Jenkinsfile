pipeline {
  agent any
  stages {
    stage('build container') {
      agent any
      steps {
        sh 'docker build -t anilkuscu95/test .'
      }
    }

    stage('push container') {
      steps {
        sh 'docker push anilkuscu95/restart'
      }
    }

  }
}