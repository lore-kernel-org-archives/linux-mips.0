Message-ID: <578601bf882d$d945f650$0a00000a@decoy>
From: "Jay Carlson" <nop@nop.com>
References: <Pine.LNX.3.96.1000306220330.12659B-100000@lithium><097a01bf87eb$ebe4d4d0$b8119526@ltc.com> <200003071022.KAA00275@gladsmuir.algor.co.uk>
Subject: Re: FP emulation patch available
Date: Tue, 7 Mar 2000 07:08:23 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Dominic Sweetman <dom@algor.co.uk>, "Bradley D. LaRonde" <brad@ltc.com>
Cc: "Andrew R. Baker" <andrewb@uab.edu>, Linux SGI <linux@cthulhu.engr.sgi.com>, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000307120823.Q5F9l8fyUYl0aky-UZm3K5vUqpWr8HGi82eLJWqO_vM@z>

> Bradley D. LaRonde (brad@ltc.com) writes (re the FPA emulator out of
> Algorithmics via Kevin Kissell):
>
> > I would jump right on this but I really need it for 2.3.47+.
>
> It's good to see our donation to the Linux project being taken up
> enthusiastically , but didn't SGI have some code like this?  I mean,
> you can't have a serious MIPS run-time system without an FP emulator,
> can you?

quoting from softftp.S from 2.3.19:

 * For now it's just a crude hack good enough to run certain fp programs
like
 * Mozilla.

It's just dealing with denorms, NaNs, etc as inputs.  AFAIK NetBSD was no
better until pretty recently.

Whether Linux or NetBSD, as systems, were ever serious MIPS run-time
systems---well, you wrote the book, so I'm inclined to get out of the
argument.

From my LinuxCE perspective, a full FP emu is fairly important for getting
binary compatibility back with mainline Linux/MIPS---we've been in the
softfp ghetto.  But most of what we do with FP is, uh, keep /bin/df happy
when it tries to calculate the percentage of free disk space, and the like.
And dropping softfp means we don't *have* to maintain a forked
toolchain/libc.

(of course, getting rid of softfp makes mips16 more...interesting...)

Jay
