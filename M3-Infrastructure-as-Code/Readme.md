# Securing Infrastructure as Code
### Trivy
* trivy image python:3.4-alpine
* trivy image --reset python:3.4-alpine
* trivy image --exit-code 2 python:3.4-alpine
* trivy image --list-all-pkgs python:3.4-alpine
* trivy image --serverity CRITICAL,HIGH,MEDIUM python:3.4-alpine
* trivy image  --ignore-unfixed python:3.4-alpine
* trivy repo https://github.com/AnaisUrlichs/react-article-display
* git clone https://github.com/AnaisUrlichs/react-article-display
* trivy config ./manifest
* git clone https://github.com/nccgroup/sadcloud
* trivy config sadcloud
* trivy fs --security-checks vuln,secret,config [path to source code]
* trivy k8s --report summary cluster

### Checkov
* pip install checkov
* checkov -l
* checkov -d /path/to/tf
* checkov -s
* checkov --framework terraform
* checkov --skip-framework dockerfile
* checkov –check CKV_AWS_123
* checkov -check [LOW|MEDIUM|HIGH|CRITICAL]
* checkov -skip-check CKV_AWS_123
* checkov -skip-check [LOW|MEDIUM|HIGH|CRITICAL]
* checkov --soft-fail-on SOFT_FAIL_ON [LOW|MEDIUM|HIGH|CRITICAL]
* checkov --hard-fail-on HARD_FAIL_ON [LOW|MEDIUM|HIGH|CRITICAL]

#### Fix non-compliant terraform
CKV_AWS_144: "Ensure that S3 bucket has cross-region replication enabled"
```
replication_configuration {
    role = aws_iam_role.replication.arn
    rules {
      id     = "foobar"
      prefix = "foo"
      status = "Enabled"

      destination {
        bucket        = aws_s3_bucket.destination.arn
        storage_class = "STANDARD"
      }
    }
  }
```

CKV2_AWS_6: "Ensure that S3 bucket has a Public Access block"
```
resource "aws_s3_bucket_public_access_block" "access_good_1" {
  bucket = aws_s3_bucket.foo-bucket.id

  block_public_acls   = true
  block_public_policy = true
}
```

CKV_AWS_56: "Ensure S3 bucket has 'restrict_public_bucket' enabled"
```
restrict_public_buckets = true
```

CKV_AWS_55: "Ensure S3 bucket has ignore public ACLs enabled"
```
ignore_public_acls = true
```

### TFSec
* tfsec /path/to/source-code
* tfsec /path/to/source-code -s
* tfsec /path/to/source-code --run-statistics
* Ignore warnings (Inline)
  - #tfsec:ignore:aws-vpc-no-public-ingress-sgr
  - #tfsec:ignore:aws-s3-enable-bucket-encryption tfsec:ignore:aws-s3-enable-bucket-logging
  - #tfsec:ignore:aws-s3-enable-bucket-encryption:exp:2025-01-02
* tfsec -e ignore:aws-s3-enable-bucket-encryption,aws-s3-enable-bucket-logging
* tfsec --format [JSON|CSV|Checkstyle|Sarif|JUnit]
* create config file at .tfsec/config.json or .tfsec/config.yml
  - .tfsec/config.json
      ```
      {
        "minimum_severity": "MEDIUM",
        "severity_overrides": {
            "CUS002": "ERROR",
            "aws-s3-enable-versioning": "LOW"
        },
        "exclude": ["CUS002", "aws-s3-enable-versioning"]
      }
      ```

      - .tfsec/config.yml
      ```
      minimum_severity: MEDIUM
      severity_overrides:
        CUS002: ERROR
        aws-s3-enable-versioning: HIGH
      exclude:
        - CUS002
        - aws-s3-enable-versioning
      ```
* docker run --rm -it -v "$(pwd):/src" aquasec/tfsec /src

## Syft and Grype
### Syft
* syft [image-name]
* syft package [image-name]
* syft -o json [image-name]
* syft dir:.

### Grype
* grype dir:.
* grype [image-name]
* grype [image-name] --scope all-layers
* grype sbom:./sbom.json
* grype dir:. --exclude './out/**/*.json'
* grype [image-name] -o json
* grype [image-name] --fail-on medium

