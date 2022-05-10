pipeline{
    
    environment{
        
        DOCKERHUB_REGISTRY="sanandansharma/spe_image"
        DOCKERHUB_CREDENTIALS=credentials('dockerhub')
        
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
                sh "docker build -t sanandansharma/spe_image:latest ."
                
            }
        }
        stage('docker login'){
            steps{
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
			  steps {
			       withDockerRegistry([ credentialsId: "dockerhub", url: "" ]){
			    sh "docker push sanandansharma/spe_image:latest"
			       }
			  }
			}
		stage('Removing Docker Images from Local') {
				steps {
					sh "docker rmi sanandansharma/spe_image:latest"
				}
			}
		stage('Deploy and Run Image'){
            steps {
                ansiblePlaybook becomeUser: null, colorized: true, disableHostKeyChecking: true, installation: 'Ansible', inventory: 'inventory', playbook: 'playbook.yml', sudoUser: null
            }
        }
    }
}
