pipeline {
  agent any
  stages {
    stage('build image') {
      agent any
      steps {
        sh 'docker build -t test .'
      }
    }

  }
}