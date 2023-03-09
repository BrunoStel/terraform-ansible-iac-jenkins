def ansibleRun(){
  try{
    sh """ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts deploy.yaml"""
  }catch(error){
  }
}

//--private-key=$ANSIBLE_SSH_EC2_KEY

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
                  ansibleRun()
                }
              }
            }
        }
    }
}