Message-ID: <003901c1a532$d01576e0$de920dd3@gol.com>
From: "Girish Gulawani" <girishvg@yahoo.com>
References: <3C505900.9685DDE3@cotw.com>
Subject: MIPS/Linux NonSGI
Date: Fri, 25 Jan 2002 08:41:10 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>
Message-ID: <20020124234110.rt4mGXx-XHdW6e5M-6r84cFwVveBnx1jJc-6j3j3d50@z>

hello all.
i'm trying to bringup linux 2.4.[2|9] on our board based on LSI mips r4k
core.
right now the kernel compiled with gcc-3.0, boots up & can only work with
statically linked commands. hence the root file system mounted from
ramdisk,nfs, & de-dream ide-disk can show some-prompt only if ash.static is
invoked.
this is seen with 2.4.3 & ditto with 2.4.9. the kernel is in un-cached
mode,since we have page-size problem with our core in cached, write
through/back
both, modes. so question is WHY THE COMMANDS WITH SHARED LIBRARY DONOT WORK.
FAILS TO LOAD SHARED LIBRARIES.

the problem no.2 is root on ide-disk. the disk is paritioned & formatted
using a linux pentium-pc. using a master disk the above said statically
linked commands are downloaded to slave disk. the board boots up. however
the bdflush/update process corrupts file-system. the UPDATE PROCESS CORRUPTS
SUPERBLOCK AND INODES WHILE FLUSHING THE DIRTY BUFERS.

PLEASE! PLEASE!! HELP ME ON THIS. THIS NEWSGROUP IS MY LAST HOPE.

many thanks in advance with regards,
girish.



_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
