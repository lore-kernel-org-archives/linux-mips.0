Date: Mon, 5 Feb 2001 16:13:23 -0500
From: Kenneth C Barr <kbarr@MIT.EDU>
Subject: netbooting indy - update, elf2ecoff?
In-Reply-To: <20010205115026.C2487@bacchus.dhis.org>
Message-ID: <Pine.SGI.4.30L.0102051604550.234337-100000@w20-575-66.mit.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20010205211323.pFYu2H0N0n5zSmeLib-Bo-996hAMjYYd81eKOGtAtOQ@z>

Thank you very much for your help so far!  Here's an update and another
question:

Updates:
1.  Had to attach a console (we have XZ graphics not XL)
2.  An ecoff kernel image downloaded fine.  The ELF ones download halfway
and fail silently (even with the console attached)

Question: As the vmlinux-indy-2.2.1-990226.ecoff kernel begins the boot
sequence, it hangs at "unable to open initial console."  I had unpacked
the filesystem on linux as the FAQ suggests, and my device files look
right.  So, on the NFS server, I symlinked /dev/console to /dev/ttyS0.
Now the message is replaced with a cryptic: "S<<<<<"

Perhaps that kernel doesn't have console support?  Is there any other
explanation for the "S<<<<<" failure where I used to see "...initial
console?"

I'd like to try a different kernel but I can't find an elf2ecoff binary.
Does anyone have this converted or a known-good ecoff kernel?

Ken
