Message-ID: <004b01c08c33$e7b42ee0$a3291081@mc2.chalmers.se>
From: "Erik Aderstedt" <erik@ic.chalmers.se>
Subject: OSLoadOptions
Date: Thu, 1 Feb 2001 10:46:51 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20010201094651.q9Kmd9AiZ3q-_ScDlWNJ40y9-s3V7hvrufWSBLZWrjo@z>

Hi!

I'm using kernel 2.4.0-test3 from the SimpleLinux dist on an
Indy w/ R4400SC, booting using DHCP on an x86 RedHat 6.1
box. Right now the boot is completely unattended, I just turn on the Indy
and a few seconds later I'm at the single user bash prompt. To get further
than this, I would like to pass command line options to the kernel at boot,
and have tried setting the OSLoadOptions PROM variable.

The problem is that the kernel seems to be passed the string
'OSLoadOptions=<my kernel boot options>', instead of just the
boot options. At least that is what is indicated by the line

Kernel command line: OSLoadOptions=init=/sbin/simpleinit

during boot. At the end of this mail is a clunky patch that fixes this, but
I'm not sure if this is the right way to go about it.

/Erik
erik@ic.chalmers.se

Patch to linux/arch/mips/arc/cmdline.c of 2.4.0

37c37
<       int actr, i;
---
>       int actr, i, offset;
48a49
>           offset = (!strncmp(prom_argv[actr], "OSLoadOptions=",14)?14:0;
50,51c51,52
<               strcpy(cp, prom_argv[actr]);
<               cp += strlen(prom_argv[actr]);
---
>               strcpy(cp, prom_argv[actr] + offset);
>               cp += strlen(prom_argv[actr] + offset);
