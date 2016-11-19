FROM jboss/wildfly:10.0.0.Final

ENV WF_ADMIN_USERNAME=wildfly-ci \
    WF_ADMIN_PASSWORD=wildfly-ci \
    WF_BIND=0.0.0.0 \
    WF_MGMT_BIND=0.0.0.0 \
    WF_CONFIG=standalone.xml

RUN /opt/jboss/wildfly/bin/add-user.sh $WF_ADMIN_USERNAME $WF_ADMIN_PASSWORD --silent

EXPOSE 9990

CMD /opt/jboss/wildfly/bin/standalone.sh -b $WF_BIND -bmanagement $WF_MGMT_BIND -c $WF_CONFIG