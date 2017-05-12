# wildfly-ci
Dockerized WildFly with public and management interface exposed on all addresses. Starts in standalone mode.

## Configuration

Following environment variables can be used out of the box (example contains default values):

```
-e WF_ADMIN_USERNAME=wildfly-ci \
-e WF_ADMIN_PASSWORD=wildfly-ci \
-e WF_BIND=0.0.0.0 \
-e WF_MGMT_BIND=0.0.0.0 \
-e WF_CONFIG=standalone.xml \
-e WF_ARGS=''
```

`WF_ARGS` is appended at the end when calling `standalone.sh`, so you can pass anything else you might need.
