Subject: Re: User applications
Date: Tue, 9 Jan 2001 12:17:26 +0000 (GMT)
In-Reply-To: <3A5AFAC8.CA682600@jungo.com> from "Michael Shmulevich" at Jan 09, 2001 01:49:29 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E14FxiT-0006XP-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Michael Shmulevich <michaels@jungo.com>
Cc: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, linux-mips@oss.sgi.com
Message-ID: <20010109121726.nDBC-i8-UKG9-y5kzIeNDXsdxbAcjOEMvYmfV_9hwL8@z>

> promoted to the syscall status? What is the situation that a user in its program
> would like
> to call cacheflush() ? Unless, of course, he is doing DoS.

A cache flush is not a denial of service attack. Its no less effective than a
1Mb memcpy 

> I can understand why we need this in kernel, for context switch, for example, but
> as a syscall?...

Self modifying code, dynamic compilation, glibc trampolines
