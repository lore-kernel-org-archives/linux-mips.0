Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Fri, 17 Jul 1998 11:21:18 -0700
Message-ID: <199807171821.LAA12337@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: What about...
In-Reply-To: <m0yxF1A-000aOoC@the-village.bc.nu>
References: <9807171047.ZM18720@xtp.engr.sgi.com>
	<m0yxF1A-000aOoC@the-village.bc.nu>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Greg Chesson <greg@xtp.engr.sgi.com>, adevries@engsoc.carleton.ca, anubis@BanjaLuka.NET, linux@cthulhu.engr.sgi.com
Message-ID: <19980717182118.8OzbApbdIT4QfTqh3unkkbMfXKePrRUv-reD0c42bck@z>

Alan Cox writes:
 > > many "holes"...  The idea of a simple buddy-system allocator as is
 > > ingrained in the Linux kernel falls apart completely in the face of
 > > this kind of architecture.   I suppose you could run a copy of Linux
 > > on every node, but I consider that an excuse rather than a solution.
 > 
 > Actually the Linux buddy stuff is quite happy with holes. Its still
 > completely inappropriate. From the above I deduce we'd have to do
 > mips64 before we even considerd it anyway

     Yes, the address space is very large, even in a single rack.
