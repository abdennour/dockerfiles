ARG HTTPD_VERSION
FROM httpd:${HTTPD_VERSION}-alpine as radius-auth-proxy


RUN apk --update --no-cache add apache-mod-auth-radius

# sudo a2enmod proxy
RUN sed -i \
        -e 's/^#\(LoadModule .*mod_proxy.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy_http.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy_balancer.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_lbmethod_byrequests.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_slotmem_shm.so\)/\1/' \
        conf/httpd.conf
RUN echo "LoadModule radius_auth_module /usr/lib/apache2/mod_auth_radius.so" >> conf/httpd.conf

COPY vhost-basicauth.conf.template vhost-formauth.conf.template login.html /opt/
COPY fry /bin/radius-auth-proxy
RUN chmod a+x /bin/radius-auth-proxy
EXPOSE 8998
ENTRYPOINT [ "radius-auth-proxy" ]
CMD ["httpd", "-DFOREGROUND"]
