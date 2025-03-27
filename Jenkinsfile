pipeline{
    agent any
    tools{
        jdk 'jdk17'
        terraform 'terraform'
    }
    environment {
        SCANNER_HOME=tool 'sonarscanner'
    }
    stages{
        stage('clean Workspace'){
            steps{
                cleanWs()
            }
        }
        stage('checkout from Git'){
            steps{
                git branch: 'main', url: 'https://github.com/Maheshwaran-11/TERRAFORM-JENKINS-CICD'
            }
        }
        stage('Terraform version'){
             steps{
                 sh 'terraform --version'
                }
        }
        stage("Sonarqube Analysis "){
            steps{
                withSonarQubeEnv('sonarserver') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Terraform \
                    -Dsonar.projectKey=Terraform '''
                }
            }
        }
        stage("quality gate"){
           steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'Sonartoken' 
                }
            } 
        }
        stage('TRIVY FS SCAN') {
            steps {
                sh "trivy fs . > trivyfs.txt"
            }
        }
        stage('Excutable permission to userdata'){
            steps{
                sh 'chmod 777 website.sh'
            }
        }
        stage('Terraform init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform plan'){
            steps{
                sh 'terraform plan'
            }
        }
        stage('Terraform apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
