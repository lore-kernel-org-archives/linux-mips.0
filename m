Message-ID: <3A712D90.3CC9EBAF@jungo.com>
Date: Fri, 26 Jan 2001 09:56:00 +0200
From: Michael Shmulevich <michaels@jungo.com>
MIME-Version: 1.0
Subject: Re: MIPS/linux compatible PCI network cards
References: <3A70A356.F3CA71F1@jungo.com> <3A70A718.F0628BBB@mvista.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
Cc: "linux-mips@oss.sgi.com" <linux-mips@oss.sgi.com>
Message-ID: <20010126075600.YUM0UJfdgSOwpkx7WyXcWjHiJz1CY6sqgABhrShWL9s@z>

Pete Popov wrote:
> 
> 
> Another one is the RTL8139.  It's quite cheap (I think less than $20).
> 
> Pete

Surprisingly enough, Realtek's driver is quite x86-oriented. It uses
some ugly outb() functtions without any ioremap()'ping.

We tried to modify it to work for MIPS, but failed. There are some
hard-to-detect situations, when driver just cannot talk to the hardware,
probably due to transmit/receive buffer synchronization. But after some
period the connection is restored (reset?). 

Michael Shmulevich
______________________________________
Software Developer
Jungo - R&D 
email: michaels@jungo.com
web: http://www.jungo.com
Phone: 1-877-514-0537(USA)  +972-9-8859365(Worldwide) ext. 233
Fax:   1-877-514-0538(USA)  +972-9-8859366(Worldwide)
