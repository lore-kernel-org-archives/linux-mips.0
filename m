From: "Yoshi-K" <ykida@yk.rim.or.jp>
Subject: MySQL
Date: Sun, 14 Oct 2001 06:02:35 +0900
Message-ID: <MBECLJKHNDHFIBCEPBGLEECJDHAA.ykida@yk.rim.or.jp>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011012225433.A10523@lucon.org>
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20011013210235.OAUnGsuRHWSENsAx-S4fV68aBR8ZeZd660LTp7vyeAk@z>

hello.
As for everybody, does MySQL operate without trouble?

OS: PS2 Linux.
CPU: R5900
gcc 2.95.2 
glibc 2.2.2
$ uname -a 
Linux speed-ps 2.2.1 #94 Thu Apr 19 12:13:01 JST 2001 mips unknown 


# cd mysql-3.23.42
# ./configure --with-charset=ujis --with-mysqld-user=mysql
# make;make install
# chown -R mysql.mysql /usr/local/var

# /usr/local/bin/mysql_install_db --user=mysql
Preparing db table
Preparing host table
Preparing user table
Preparing func table
Preparing tables_priv table
Preparing columns_priv table
Installing all prepared tables
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
ERROR: 1033 Incorrect information in file: './mysql/db.frm'
011006 21:20:23 /usr/local/libexec/mysqld: Shutdown Complete

-------------------------
Yoshikatsu Kida
E-Mail: yoshi@galaxies.jp
http://galaxies.jp/
