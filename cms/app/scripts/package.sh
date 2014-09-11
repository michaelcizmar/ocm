#!/bin/sh

if [ $# -lt 1 ] ; then
	echo "Usage: package_base.sh pkg_name"
	exit 1
fi

PRJ=danio
PKG=$1


# Update the SQL files
sh ~/Sites/$PRJ/app/scripts/freshen_sql.sh

# Update the checksum file.
cd ~/Sites/$PRJ/
php -q app/scripts/checksum.php > app/checksums/stock.txt 

cd ~/Sites/

ln -s $PRJ pika_cms-$PKG

zip -qry9 ./_new.pika.zip \
	pika_cms-$PKG/* \
	-x \*doc_storage/\*/

rm -f pika_cms-$PKG

mv -i ./_new.pika.zip ~/pika_cms-$PKG.zip

exit 1
