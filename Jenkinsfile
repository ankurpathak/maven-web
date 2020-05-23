pipeline {
    agent any
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
    }
}
