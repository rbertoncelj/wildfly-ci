FROM jboss/wildfly:9.0.2.Final
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone-full-ha.xml"]
