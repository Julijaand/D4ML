# D4ML
Hands on Linux

#TASK
A client wants to have a list of commands which they can execute at their side to achieve the next things:
create archive from /etc/nginx/* directory
move this archive to /opt/archive/ directory
owner of /opt/archive directory and all files inside must be user director and group maintainer

Commands:

cd /etc/nginx/ - go to nginx directory
tar -czf compressed.tar.gz /etc/nginx/ - create archive from /etc/nginx/* directory
tar -tf compressed.tar.gz - shows what in compressed folder
cd /opt – move to opt directory
mkdir archive – create archive directory
cd /etc/nginx/ - move to nginx directory
mv compressed.tar.gz  opt/archive - moves archives folder to opt/archive
