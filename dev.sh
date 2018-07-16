#!/bin/sh

# This is for alpine linux.
#
# Input env vars:
#   HOST_USER: user name
#   HOST_GROUP: group name
#   HOST_UID: user id
#   HOST_GID: group id


# Add user in the container
addgroup -g $HOST_GID $HOST_GROUP
adduser -h /home/$HOST_USER -G $HOST_GROUP \
    -u $HOST_UID -s /bin/sh -D $HOST_USER

# Switch to the user
su $HOST_USER
