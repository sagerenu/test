node {

stage("Terraform install Red Hat") {
               sh 'yum install wget -y'
               sh 'wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip'
               sh 'yum update -y'
               sh 'yum install unzip -y'
               sh 'unzip terraform_0.11.1_linux_amd64.zip'
               sh 'mv terraform /usr/local/bin/terraform'
               sh 'rm -f  terraform_0.11.1_linux_amd64.zip'
          }

stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
      checkout scm
    }
stage('terraform init') {
      sh "terraform init --get=true"
    }
stage("Plan") {
        sh "terraform plan -out=plan.out "
    }
stage("Appy") {
        sh "terraform plan -out=plan.out "
    }
}
