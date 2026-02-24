#!/bin/bash

# lädt sitemaps herunter und platziert sie
# funktioniert

cd ~/htmls

rm -R sitemaps
mkdir -p sitemaps

wget -O sitemaps/sitemap.xml "https://a153568.hostedsitemap.com/4067460/sitemap.xml"

sleep 2

wget -O sitemaps/sitemap_images.xml "https://a153568.hostedsitemap.com/4067460/sitemap_images.xml"

sleep 2

wget -O sitemaps/sitemap_video.xml "https://a153568.hostedsitemap.com/4067460/sitemap_video.xml"

sleep 2

wget -O sitemaps/sitemap_news.xml "https://a153568.hostedsitemap.com/4067460/sitemap_news.xml"

sleep 2

wget -O sitemaps/sitemap.html.gz "https://a153568.hostedsitemap.com/4067460/sitemap.html"

sleep 2 

wget -O sitemaps/urllist.txt.gz "https://a153568.hostedsitemap.com/4067460/urllist.txt"

cd sitemaps

gzip -d urllist.txt.gz
gzip -d sitemap.html.gz

cp -R ~/htmls/sitemaps ~/Dropbox/htmls/

HOST="host90.checkdomain.de"
USER="jawriowu"
PASSWORD="t2zaaoh8rr"
 
ftp -inv $HOST <<EOF
user $USER $PASSWORD
cd /htdocs/sitemaps
mput sitemap.xml
mput sitemap_images.xml
mput sitemap_video.xml 
mput sitemap_news.xml
mput sitemap.html
mput urllist.txt
bye
EOF

cd 

