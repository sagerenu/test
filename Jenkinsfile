node {
      checkout scm
      stage('install'){
           downloadTerraform()
           env.PATH = "${env.PATH}:${env.WORKSPACE}"
           }

stage(Plan') {
        sh """ terraform plan -out=plan.out """
    }
stage('Apply') {
        sh """ terraform apply -out=apply.out """
    }
}
def downloadTerraform(){
  if (!fileExists('terraform')) {
    sh "sudo yum install wget -y && wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip && sudo yum update -y && sudo yum install unzip -y && sudo unzip -o  terraform_0.11.1_linux_amd64.zip && chmod 777 terraform"
  } else {
    println("terraform already downloaded")
  }
}
