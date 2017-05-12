#!/bin/bash

# Explode if anything goes wrong :)
set -eo pipefail

# Initialize stuff if ran for the first time
if [ -f /opt/jboss/wildfly-adduser-done ]; then
	echo "Default admin user has already been added."
else
	echo "Adding default admin user."
    /opt/jboss/wildfly/bin/add-user.sh $WF_ADMIN_USERNAME $WF_ADMIN_PASSWORD --silent
    touch /opt/jboss/wildfly-adduser-done
fi

# Fix permissions on volumes
echo "Setting ownership of data and log directories."
chown -R jboss /opt/jboss/wildfly/standalone/data /opt/jboss/wildfly/standalone/log

echo "Starting wildfly."
exec gosu jboss /opt/jboss/wildfly/bin/standalone.sh -b $WF_BIND -bmanagement $WF_MGMT_BIND -c $WF_CONFIG $WF_ARGS
