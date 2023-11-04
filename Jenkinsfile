pipeline{
 agent any
 
 stages{
	stage("Clone Code"){
	 steps{
	 echo "Cloning the codde"
	 git url:"https://github.com/vidhi-git/VPC.git", branch: "main"
	 } 
	}
	 stage("build"){
	 steps{
	 echo "Building the image"
	 sh "docker build -t my-vpc-training ."
	 }
	 }
	 stage("Push to Docker Hub"){
	 steps{
	 echo "Pushing the image to docker hub"
	 withCredentials([usernamePassword(credentialsId:"DockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")])
		{
		sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
		 sh "docker tag my-vpc-training ${env.dockerHubUser}/my-vpc-training:latest"
		 sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
		 sh "docker push ${env.dockerHubUser}/my-vpc-training:latest"


		}
	 }
	 }
 
	 stage("Deploy"){
	 steps{
	 echo "Deploying"
	 //sh "docker run -itd -p 80:80 --name bcd my-vpc-training"
	 sh "docker-compose down && docker-compose up -d"
	 }
	 }
	}
	}

