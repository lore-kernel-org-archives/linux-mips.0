Subject: Re: NON FPU cpus - way to go
Date: Wed, 7 Feb 2001 18:53:29 +0000 (GMT)
In-Reply-To: <Pine.GSO.3.96.1010207171821.1418B-100000@delta.ds2.pg.gda.pl> from "Maciej W. Rozycki" at Feb 07, 2001 05:36:33 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E14QZie-00011I-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Cc: Florian Lohoff <flo@rfc822.org>, linux-mips@oss.sgi.com, ralf@oss.sgi.com
Message-ID: <20010207185329.3Tfnf7oEwQMGI36IUlQhCDvYHgXtEWo6_XeslNHq-uk@z>

>  The i386 way seems reasonable, IMHO.  Have a configure option to enable
> an FPU emulator.  Panic upon boot if no FP hardware is available and no
> emulator is compiled in. 

Its an interesting question whether it belongs in the kernel or libc. 
Discuss ;)

Also we missed a trick on the x86 and I want to fix that one day, which is
to have an __fpu ELF segment so if you boot an FPU emu kernel on an fpu
box you regain 47K
