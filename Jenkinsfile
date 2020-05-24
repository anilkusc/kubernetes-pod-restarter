pipeline {
  agent {
    dockerfile {
      filename 'dockerfile'
    }

  }
  stages {
    stage('build image') {
      steps {
        sh 'docker build -t test .'
      }
    }

  }
}