node {
      checkout scm

      stage('install'){
           downloadTerraform()
           env.PATH = "${env.PATH}:${env.WORKSPACE}"
           }

stage('init and Plan') {
        sh """ terraform -v """
        sh """ terraform init """

    }

}

    def downloadTerraform(){
    def statuscode = sh(
      script: "which terraform" , returnStatus:true
      )
      if (statuscode.equals(0)) {

            println("terraform already downloaded")

      } else {
        sh "sudo yum install wget -y && wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip && sudo yum update -y && sudo yum install unzip -y && sudo  unzip -o terraform_0.11.8_linux_amd64.zip  && sudo chmod 777 terraform && sudo cp terraform /usr/local/bin/terraform"
      }
    }
