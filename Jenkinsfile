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
            steps{
                sh """ mvn clean package
                       mv target/*.war target/maven-web.war
                """
            }
        }
        stage("Deploy to Alpine"){
            steps{
                sshagent (['vagrant-key']) {
                    sh """ scp -o StrictHostKeyChecking=no target/maven-web.war vagrant@172.28.128.4:/home/vagrant/tomcat/webapps/
                           ssh -o StrictHostKeyChecking=no vagrant@172.28.128.4 /home/vagrant/tomcat/bin/catalina.sh stop
                           ssh -o StrictHostKeyChecking=no vagrant@172.28.128.4 /home/vagrant/tomcat/bin/catalina.sh start
                    """
                }
                 
            }
        }
    }
}
