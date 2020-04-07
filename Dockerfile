ARG PULUMI_VERSION=latest
FROM pulumi/actions:${PULUMI_VERSION}

LABEL "com.github.actions.name"="Pulumi Stack"

# Copy the entrypoint script.
COPY ./entrypoint.sh /usr/bin/pulumi-action

# The app directory should contain the Pulumi program and is the pwd for the CLI.
WORKDIR /app
VOLUME ["/app"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/usr/bin/pulumi-action", "--non-interactive"]