Message-ID: <006901c1a9e2$7c1c0a40$2ace7d3d@gol.com>
From: "Girish Gulawani" <girishvg@yahoo.com>
Subject: how to change page alignment.
Date: Thu, 31 Jan 2002 08:04:32 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>
Message-ID: <20020130230432.2JV3CaiJl-OSQ0z8kYv6v-cP7g75CLilvc9xPW7gc4g@z>

hello, all.

i am trying to bring up linux kernel 2.4.9 on LSI ez4021. our cpu core
supports page size of 16K. hence the mmu code is changed accordingly, for
kernel 2.4.9. but any command load fails giving page alignment error. seems
some problem from binfmt_elf.c file.

a command, say a shell ash, is build using egcc-2.91.66. to change the page
alignment the option given was "--n16384". this option is surely wrong,
hence could you tell me what is correct option? HOW TO CHANGE PAGE ALIGNMENT
TO 16K WHILE LINKING USER COMMANDS??

many thanks in advance & best regards,
girish.



_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
