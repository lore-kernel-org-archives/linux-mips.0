content-class: urn:content-classes:message
Subject: execve("sbin/init",argv_init,envp-init) in init() of main.c and sbin/init.
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Date: Tue, 7 Aug 2001 17:36:44 -0700
Message-ID: <84CE342693F11946B9F54B18C1AB837B0A2294@ex2k.pcs.psdc.com>
From: "Steven Liu" <stevenliu@psdc.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Cc: dankamura@mvista.com
Message-ID: <20010808003644.i6coKmoNbrsNKBaam8SwfUiRW5Ykstld5JTV2yOsOlk@z>

Hi, ALL:

I posted a message in this board regarding
execve("sbin/init",argv_init,envp-init) in init() of main.c this
morning. Pete gave some very good suggessions.Thank you very much, Pete.
I tried them but the problem has not been solved yet. My CPU is not
standard R3000 mips CPU with some registers added in and modified. For
example, ASID field in EntryHi register is of 8 bits instead of 6 bits.
This may creat some problems.

I want to investigate the "sbin/init" program but I do not know where I
can find the source code of this program. If you know any hint and let
me know, I would be very pleased.

Thank you for your help.

Regards,

Steven Liu
