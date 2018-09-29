node {
stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
      checkout scm
    }
stage("Terraform install Red Hat") {
               sh 'sudo yum install wget -y'
               sh 'wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip'
               sh 'sudo yum update -y'
               sh 'sudo yum install unzip -y'
               sh 'sudo unzip terraform_0.11.1_linux_amd64.zip'
               sh 'sudo mv terraform /usr/local/bin/terraform'
               sh 'sudo rm -f  terraform_0.11.1_linux_amd64.zip'
          }


stage('terraform init') {
      sh 'terraform init'
    }
stage("Plan") {
        sh 'terraform plan -out=plan.out ''
    }
stage("Apply") {
        sh 'terraform apply -out=apply.out'
    }
}
