# vim:set ft=dockerfile:

# VERSION 1.1
# AUTHOR:         Alexander Turcic <alex@zeitgeist.se>
# DESCRIPTION:    sslyze in a Docker container
# TO_BUILD:       docker build --rm -t zeitgeist/docker-sslyze .
# SOURCE:         https://github.com/alexzeitgeist/docker-sslyze

# Pull base image.
FROM python:3.6.6-stretch
MAINTAINER Alexander Turcic "alex@zeitgeist.se"

# The read me from sslyze v1.4.3 gives installation instructions using pip

# Fixing the versions of all the dependancies in the docker file
# ensures a repeatable build in spite of package updates.
# The versions reflect the latest versions on 2018-08-24

WORKDIR /usr/src/app

RUN pip install --no-cache-dir   asn1crypto==0.24.0 \
 && pip install --no-cache-dir    pycparser==2.18 \
 && pip install --no-cache-dir         cffi==1.11.5 \
 && pip install --no-cache-dir cryptography==2.2.2 \
 && pip install --no-cache-dir         idna==2.7 \
 && pip install --no-cache-dir          six==1.11.0 \
 && pip install --no-cache-dir   tls-parser==1.2.1 \
 && pip install --no-cache-dir        nassl==1.1.3 \
 && pip install --no-cache-dir       sslyze==1.4.3

ENTRYPOINT [ "python", "-m", "sslyze" ]
CMD ["-h"]