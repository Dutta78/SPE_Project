pipeline{
    
    environment{
        
        DOCKERHUB_REGISTRY="sanandansharma/node_project"
        DOCKERHUB_CREDENTIALS=credentials('dockerhub-id')
        
    }
    agent any 
    
    stages{
        
  /*  stage('git pull'){
       
        steps{
            git url:'https://github.com/Dutta78/SPE_Project.git',
            branch:'master',
            credentialsId:'github'
        }
        }*/
        
        stage('build docker image'){
            steps{
                sh "docker build -t sanandansharma/node_project:latest ."
                
            }
        }
        stage('docker login'){
            steps{
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
			  steps {
			       withDockerRegistry([ credentialsId: "dockerhub-id", url: "" ]){
			    sh "docker push sanandansharma/node_project:latest"
			       }
			  }
			}
		stage('Removing Docker Images from Local') {
				steps {
					sh "docker rmi sanandansharma/node_project:latest"
				}
			}
	/*	stage('Ansible Deploy') {
				steps {
					ansiblePlaybook becomeUser: 'null',
					colorized: true,
					installation: 'Ansible',
					inventory: 'inventory',
					playbook: 'ansible-playbook.yml',

					sudoUser: 'null',
					vaultCredentialsId: 'fintrack-ansible-vault-password'
				}
			}*/
    }
}
