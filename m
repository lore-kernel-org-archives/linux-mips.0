Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0uK6ux-0005FbC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: lmbench with new checksum code...
Date: Thu, 16 May 1996 18:32:51 +0100 (BST)
In-Reply-To: <199605161603.JAA03193@neteng.engr.sgi.com> from "Larry McVoy" at May 16, 96 09:03:36 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Larry McVoy <lm@gate1-neteng.engr.sgi.com>
Cc: davem@caip.rutgers.edu, lmlinux@neteng.engr.sgi.com, torvalds@cs.Helsinki.FI, sparclinux-cvs@caipfs.rutgers.edu, alan@cymru.net
Message-ID: <19960516173251.FGnw41PaVnl8S_jLdTfCnG0oy7dvMTNLQe5evwafm_k@z>

> I think your 4.8MB/sec number is pretty studly.  That means you are 
> checksumming 9MB/sec as well as the protocol stack on a system that 

Actually the Linux kernel cheats on the receive side of loopback and doesnt
checksum. Its too expensive to fiddle around on the send side for that short
of doing the whole job and shorting the tcp layer as Solaris seems to.

> bcopies at ~20MB/sec.  You're already better than 2x the SunOS code.
> Call it a day, you won.

Na.. We can cut all the checksums, do raw copies with no protocol overhead
and possibly later on do user->user copying (with page flips to keep larry
happy ;)). I can't see any reason we cannot do about 8-9MB/sec with a bit
of extra code and some sneaky tricks.

CONFIG_TCP_BENCHMARK_TRICKS 

anyone ?
