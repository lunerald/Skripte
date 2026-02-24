# lädt sitemaps herunter und setzt sie an Ort und Stelle
# Download funktioniert nicht

cd C:\SD\Dropbox\htmls

$sam1="https://a153568.hostedsitemap.com/4067460/sitemap.xml"
$sam2="https://a153568.hostedsitemap.com/4067460/sitemap_images.xml"
$sam3="https://a153568.hostedsitemap.com/4067460/sitemap_video.xml"
$sam4="https://a153568.hostedsitemap.com/4067460/sitemap_news.xml"
$sam5="https://a153568.hostedsitemap.com/4067460/sitemap.html"
$sam6="https://a153568.hostedsitemap.com/4067460/urllist.txt"

Invoke-WebRequest -Uri $sam1 -outfile sitemaps/sitemap.xml 
Invoke-WebRequest -Uri $sam2 -outfile sitemaps/sitemap_images.xml
Invoke-WebRequest -Uri $sam3 -outfile sitemaps/sitemap_video.xml
Invoke-WebRequest -Uri $sam4 -outfile sitemaps/sitemap_news.xml
Invoke-WebRequest -Uri $sam5 -outfile sitemaps/sitemap.html
Invoke-WebRequest -Uri $sam6 -outfile sitemaps/urllist.txt

# Copy-Item -Path sitemaps -Destination ftp://jawriowu:t2zaaoh8rr@host90.checkdomain.de/htdocs/ -Force 




