Message-ID: <00f601c1cd53$9c862060$8c3684d3@gol.com>
From: "Girish Gulawani" <girishvg@yahoo.com>
Subject: Error loading shared libraries.
Date: Sun, 17 Mar 2002 10:32:30 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>
Message-ID: <20020317013230.6R4IQOOfvZeVhoa6v-90Wyc_cIAji99x-65CdT0IBsI@z>


Hello, all.
I know this is kind of weird problem at this point of time. I have a MIPS
board booted up with Linux 2.4.3 kernel. But it fails on the "init". I get
an error in the init process:

init: error in loading shared libraries
libutil.so.1: cannot map file data: Bad file descriptor ...

The compiler used is EGCS 2.91.66, downloaded from the net. Such error is
seen while loading any executable. I have a statically linked shell running.
Basically I dont know where the problem is. Please help me.
Many thanks in advance.
Girish.




_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
