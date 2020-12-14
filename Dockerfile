ARG PULUMI_VERSION=v2.13.2
FROM pulumi/actions:${PULUMI_VERSION}

LABEL "com.github.actions.name"="Pulumi Stack"
LABEL "com.github.actions.description"="Deploy apps and infra to your favorite cloud!"
LABEL "com.github.actions.icon"="cloud-lightning"
LABEL "com.github.actions.color"="purple"

# Copy the entrypoint script.
COPY ./entrypoint.sh /usr/bin/pulumi-action

# The app directory should contain the Pulumi program and is the pwd for the CLI.
WORKDIR /app
VOLUME ["/app"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/usr/bin/pulumi-action", "--non-interactive"]
