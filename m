Message-ID: <033401c1ce8f$cbec7100$ebcc7d3d@gol.com>
From: "Girish Gulawani" <girishvg@yahoo.com>
Subject: PCI VGA Card Initilization (SIS6326 / PT80)
Date: Tue, 19 Mar 2002 00:15:51 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>
Message-ID: <20020318151551.0iKyAw_eQUqQ-CwHUgQaGRIlGiunnDQz1l7iS0tgVOA@z>

hello, all.
i have a PCI/VGA card PT80 with SIS6326 chipset. i am using MILO BIOS source
code. but i am not able to access the internal buffer which is typically at
0xA0000. even the BIOS ROM (0xC0000) read fails to show default value
0xA5A5. the expansion ROM is enabled in PCI by setting D0 bit to 1. however
IO seems okay because the monitor actually switches from power down mode to
normal mode. i have tried using both vgaraw1.c and vgaraw2.c files, but no
success. could anybody help me to solve this problem.
many thanks.
girish.



_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
