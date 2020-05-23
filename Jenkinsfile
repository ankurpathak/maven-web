pipeline {
    agent any
    environment {
        PATH = "/usr/local/sdkman/candidates/maven/current/bin:$PATH"   
    }
    stages{
        stage("Welcome"){
            steps{
                echo "Welcome to jenkins declarative"
            }
        }
        
        stage("Git Checkout"){
            steps{
                git 'https://github.com/ankurpathak/maven-web.git'
            }
        }
        stage("Maven Build"){
            sh "mvn clean package"
        }
    }
}
