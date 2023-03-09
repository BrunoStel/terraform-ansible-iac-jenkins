def ansibleRun(){
  try{
    sh """ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts --private-key=$ANSIBLE_SSH_EC2_KEY deploy.yaml"""
  }catch(error){
  }
}

def arquivos(){
  try{
    sh """ls"""
  }catch(error){
  }
}

pipeline {
    agent any
    environment {
      ANSIBLE_SSH_EC2_KEY=credentials('ec2_ssh')
    }
    stages{
        stage("Deploy Ansible"){
            steps{
              dir('ansible/jenkins-agent-configuration'){
                script{
                  arquivos()
                }
              }
            }
        }
    }
}