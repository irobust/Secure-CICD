## Module 1 - How to Automate OWASP ZAP
### Baseline scan
* docker run -v $(pwd):/zap/wrk:rw owasp/zap2docker-stable zap-baseline.py -t http://demo.testfire.net (Powershell -> ${PWD}, Command-line -> %cd%, MaxOS -> $(pwd))
* docker run -v $(pwd):/zap/wrk:rw owasp/zap2docker-stable zap-api-scan.py -t http://demo.testfire.net (Powershell -> ${PWD}, Command-line -> %cd%, MaxOS -> $(pwd))
* docker run -v $(pwd):/zap/wrk:rw owasp/zap2docker-stable zap-full-scan.py -t http://demo.testfire.net (Powershell -> ${PWD}, Command-line -> %cd%, MaxOS -> $(pwd))

### Build custom image
* docker build -t zap .
* docker exec -it zap sh (Execute shell)

### Working with ZAP cli
* docker exec zap zap-cli -p 8090 open-url http://demo.testfire.net
* zap-cli quick-scan -s xss,sqli --spider -r http://demo.testfire.net
* zap-cli report -o ZAP_Report.html -f html

### Working with API
* Go to http://localhost:8090/ui
* CURL "http://localhost:8090/JSON/spider/action/scan/?zapapiformat=JSON&formMethod=GET&url=http://demo.testfire.net"
* curl "http://localhost:8090/JSON/core/view/alerts"
* curl "http://localhost:8090/HTML/core/view/alerts"

### Generate HTML report
* curl "http://localhost:8090/OTHER/core/other/htmlreport/?formMethod=GET" > ZAP_Report.HTML

### ZAP Plugins
* -addoninstall  openapi
* curl  "http://localhost:8090/UI/openapi/"
* curl "http://localhost:8090/JSON/openapi/action/importUrl/?zapapiformat=JSON&formMethod=GET&url=https://petstore.swagger.io/v2/swagger.json&hostOverride="


### Run basic-scan.py
* Set target at line 8
* Set proxy at line 12
* pip install python-owasp-zap-v2.4
* Read more detail at https://pypi.org/project/python-owasp-zap-v2.4/
* python basic-scan.py