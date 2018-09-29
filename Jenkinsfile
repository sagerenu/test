node {
      checkout scm

      stage('install'){
           downloadTerraform()
           env.PATH = "${env.PATH}:${env.WORKSPACE}"
           }

stage('init and Plan') {
        sh """ terraform -v """
        sh """ terraform init """
        sh """ terraform plan -out=plan.out """
    }
stage('Apply') {
        sh """ terraform apply -out=plan.out """
    }
}

    def downloadTerraform(){
      if (!fileExists('terraform')) {
        sh "sudo yum install wget -y && wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip && sudo yum update -y && sudo yum install unzip -y && sudo  unzip -o terraform_0.11.8_linux_amd64.zip  && sudo chmod 777 terraform " 

      } else {
        println("terraform already downloaded")
      }
    }
