pipeline{
    agent any

    stages{

        stage("Fetch code from Github"){
            steps{

                echo 'Cloning terraform scripts repo'
                git branch: 'master', url: 'https://github.com/varmaaradhula/terraform-Instance-pipeline.git'
            }
        }

        stage("Intialize terraform"){
            steps{

                echo 'Intializing terraform'
                sh """
                    terraform version
                    terraform init
                """
            }
        }

        stage("Validate terraform scripts"){
            steps{
                echo 'Validating Terraform scripts'
                sh 'terraform validate'
            }
        }

        stage("Plan infrastructure"){
            steps{
                echo 'Creating terraform plan'
                sh """
                    terraform plan -out=tfplan
                """
            }
        }
        stage("Apply infrastructure"){
            steps{
                echo 'Applying terraform plan'
                sh """
                    terraform apply -auto-approve tfplan
                """
            }
        }

    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}