How to run:

1. Copy all folder facturex_host_docker
2. Go to Nginx.conf file comment all other serve. leave only 80
3. Run command
     docker compose up -d --build
4. Run this command
     docker compose run --rm --entrypoint "\
  certbot certonly --webroot -w /var/www/certbot \
  --email simone.fcome@gmail --agree-tos --no-eff-email \
  -d mozzapp.online -d www.mozzapp.online" faturex-certbot
5. Go to Nginx.conf remove commented lines leave SSL and 80 serve.
6. Run this command
     docker compose exec faturex-web nginx -s reload
7. Restore data.sql backup
8. Run this command
   docker restart faturex-tomcat
9. DONE
