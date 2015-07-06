FROM ubuntu:14.04

MAINTAINER Erika Pogorelc <erika@p2pu.org>

# Install requirements
RUN apt-get update && apt-get install -y \
    git-core \
    libpq-dev \
    postgresql \
    postgresql-client \
    python \
    python-dev \
    python-distribute \
    python-pip \
    python-virtualenv \
    supervisor


# Setup application
RUN git clone https://github.com/ercchy/p2pu-sso.git /opt/sso/ && rm -Rf /opt/sso/.git/
RUN virtualenv /opt/sso-venv && /opt/sso-venv/bin/pip install -r /opt/sso/requirements.txt
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY docker-entry.sh /docker-entry.sh

EXPOSE 6666

VOLUME /opt/static/sso
VOLUME /var/logs/sso

ENTRYPOINT ["/docker-entry.sh", "--migrate", "--collectstatic", "--supervisord"]

