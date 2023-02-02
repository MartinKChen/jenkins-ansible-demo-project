pipeline {
  agent any
  
  environment {
    instancePrivateIp = ""
  }

  stages {
    stage('checkout') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/MartinKChen/jenkins-ansible-demo-project']]])
      }
    }

    stage ("terraform init") {
      steps {
        sh ('terraform init')
      }
    }

    stage ("terraform apply") {
      environment {
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
      }
      
      steps {
        sh ('terraform apply -auto-approve')
        
        script {
          instancePrivateIp = sh(returnStdout: true, script: "terraform output private_ip").trim()
        }
        
        sh ('echo ${instancePrivateIp}')
      }
    }
  }
}
