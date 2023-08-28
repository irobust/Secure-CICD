# Secret scanner
## Scanning secret with Trufflehog
### Using docker container
```
docker run --rm -it -v ${PWD}:/pwd trufflesecurity/trufflehog:latest git https://github.com/trufflesecurity/test_keys
```

### Install with binary file
Download binary file from [Releases page](https://github.com/trufflesecurity/trufflehog/releases)

### Command
- trufflehog git https://github.com/trufflesecurity/test_keys
- trufflehog git https://github.com/trufflesecurity/test_keys --only-verified
- trufflehog github --org=trufflesecurity
- trufflehog git https://github.com/trufflesecurity/test_keys --json
- trufflehog s3 --bucket=[bucket name]
- trufflehog s3 --role-arn=[iam role arn]
- trufflehog gcs --project-id=[project-ID] --cloud-environment
- trufflehog filesystem path/to/file1.txt path/to/file2.txt path/to/dir
- trufflehog docker --image trufflesecurity/secrets

## Gitleaks
### Using docker container
```
docker run -v ${PWD}:/path zricethezav/gitleaks:latest
```

### Command
- gitleaks detect --source . -v
- gitleaks detect --report-path gitleaks-report.json