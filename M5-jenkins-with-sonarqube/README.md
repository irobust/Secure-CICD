1. Install Plug-ins
	- SonarQube Scanner
	- Dependency Check
 
2. GitHub Project
	- Projet URL = https://github.com/irobust/dependencyCheckDemo
 
3. SCM
	- Git (Repo URL= https://github.com/irobust/dependencyCheckDemo.git)
 
4.Scan with Dependency check
	- Set path to scan = ${WORKSPACE}/
	- Generate html report
 
5. Create project and generate token in Sonarqube server
 
6. Set Sonarqube Server
	- Go to configuration (SonarQube Servers)
	- Name = Sonarqube
	- Server URL = http://sonarqube:9000
	- Server Authentication Token = XXXXX
 
7. Config Global Configuration Tool
	- Add sonarqube command
 
8. Add Execute Sonarqube scanner
	- Set Analysis Properties
		sonar.projectKey=my:demo
		sonar.projectName=demo-project
		sonar.projectVersion=1.0
		sonar.sources=${WORKSPACE}/
		sonar.dependencyCheck.reportPath=${WORKSPACE}/dependency-check-report.xml
		sonar.dependencyCheck.htmlReportPath=${WORKSPACE}/dependency-check-report.html
 
9. Archive
	- dependency-check-report.*