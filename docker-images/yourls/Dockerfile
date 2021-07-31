FROM yourls:1.8.1 as yourls-ldap
RUN set -eux; \
    apt-get update && apt-get install -y --no-install-recommends libldap2-dev \
    && rm -rf /var/lib/apt/lists/ /usr/share/locale/*/ /usr/share/man/* /usr/share/doc/*; \
    docker-php-ext-install -j "$(nproc)" ldap;
