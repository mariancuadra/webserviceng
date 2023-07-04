FROM fedora:latest
RUN dnf -y install nginx && dnf clean all
COPY index.html /usr/share/nginx/html/
COPY nginx.conf /etc/
COPY .htpasswd /etc/apache2/
COPY cert.key /etc/nginx/conf.d
COPY certificado.crt /etc/nginx/conf.d
EXPOSE 443 
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx.conf"]
