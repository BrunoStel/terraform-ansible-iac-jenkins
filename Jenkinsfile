def ansibleRun(){
  try{
    sh """ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ansible/jenkins-controller-configuration/hosts ansible/jenkins-controller-configuration/deploy.yaml"""
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
                script{
                  ansibleRun()
                }
            }
        }
    }
}