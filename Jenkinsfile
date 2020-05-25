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
                       mv target/*.war maven-web.war
                """
            }
        }
        stage("Deploy to Alpine"){
            steps{
                sshagent (credentials: ['alpine']) {
                    sh """ scp -o StrictHostKeyChecking=no target/maven-web.war root@172.16.167.131://usr/local/tomcat/webapps/
                           ssh -o StrictHostKeyChecking=no root@172.16.167.131 /usr/local/tomcat/bin/catalina.sh stop
                           ssh -o StrictHostKeyChecking=no root@172.16.167.131 /usr/local/tomcat/bin/catalina.sh start

                    """
                }
                 
            }
        }
    }
}
