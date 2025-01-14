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

        stage('Get Instance Public IP') {
            steps {
                echo 'Fetching public IP of the instance...'
                script {
                    // Fetch public IP from Terraform output
                    def publicIp = sh(
                        script: "terraform output -raw instance_public_ip",
                        returnStdout: true
                    ).trim()
                    echo "Public IP Address of the Instance: ${publicIp}"

                    // Write the public IP to a file
                    writeFile file: 'instance_public_ip.txt', text: publicIp
                }
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