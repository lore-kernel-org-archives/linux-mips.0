Message-ID: <006d01c29ea0$d0d15190$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <ECEPLLMMNGHMFBLHCLMACEALDGAA.giladb@riverhead.com>
Subject: Re: Prefetches in memcpy
Date: Sun, 8 Dec 2002 11:01:43 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Gilad <giladb@riverhead.com>, linux-mips@linux-mips.org
Message-ID: <20021208100143.fU3Vl_SdTJefj92Q-maEGPf3JkBRjSaG25gu35vqxM8@z>

> As someone rather new to this list, and to mips-linux in general,
> can someone explain the problem, as well as how one can avoid 
> it or limit it's effects to a minimum ?

The problem is that memcpy() uses prefetch to pre-load the
cache from the copy source, but does so very naively, such
that it continues prefetching beyond the end of the block to
be copied.  This is a Bad Idea for a couple of reasons.
The first to be commented upon was the fact that it can
result in bus hangs/bus errors if the kernel is trying to copy
from the last few hundred bytes of physical memory, but 
the really nasty one is that it screws up cache coherence
for DMA I/O.

The no-brainer solution which has been proposed as a
stopgap is simply to stop doing prefetch in memcpy()
altogether.  The "correct" solution would be to have a
slightly more complex memcpy() loop which only does
prefetch up to the end of the source block, which is
what is now done in the x86 port.
