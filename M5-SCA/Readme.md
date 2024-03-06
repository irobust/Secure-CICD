# Dependency Check
```
docker run -it --rm \
    -v dependency-check:/usr/share/dependency-check/data:z
    -v ${PWD}:/src:z \
    -v ${PWD}/reports:/report:z \
    owasp/dependency-check \
    --scan /src \
    --format "ALL" \
    --out /report
```