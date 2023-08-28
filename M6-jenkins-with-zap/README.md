## Step to inject zap into pipeline
1. git pull origin master
2. docker-compose up -d
3. docker exec jenkins-server cat /var/jenkins_home/secrets/initialAdminPassword
4. Install suggested plug-ins
5. create admin user
6. Install plug-ins
	- Official OWASP-ZAP 
	- Custom Tools
		* name = zap
		* Install automatically = true
		* Download URL for binary archive = https://github.com/zaproxy/zaproxy/releases/download/v2.8.1/ZAP_2.8.1_Linux.tar.gz
		* 	Subdirectory of extracted archive = ZAP_2.8.1
 
7. Create Freestyle project (owasp-zap-demo)
8. config github project 
   https://github.com/eficode/security_testing_demo_app
9. Source Code Management
  Repo URL = https://github.com/eficode/security_testing_demo_app.git
  branch = */master
10. Build
	- Execute Shell -> sh ${WORKSPACE}/start.sh
	- Execute ZAP
		* Host = localhost
		* Port = 8090
		* Select Custom Tools Installation (name = zap)
		* ZAP Home Directory = ~/.ZAP
		* Persist Session (Filename = sessionTest)
		* Context name = test${BUILD_NUMBER}
		* Include in context = \Qhttp://localhost:7272\E.*
		* Starting Point = http://localhost:7272
		* Spider
		* Generate Report (Format: xml + html)
11. Execute shell
	kill `cat server.pid`
12 Execute shell
	rm server.pid
13 Post Build
	reports/*