Message-ID: <3BE18D69.147DEAFE@cotw.com>
Date: Thu, 01 Nov 2001 11:59:05 -0600
From: "Steven J. Hill" <sjhill@cotw.com>
Reply-To: sjhill@cotw.com
MIME-Version: 1.0
Subject: Re: Stabs and discarded functions (was Re: Old bug with 'gdb/dbxread.c'
 and screwed up MIPS symbolic debugging...)
References: <3BDF7F79.6050205@cygnus.com> <3BE02E31.3B2CA5FC@cotw.com> <20011031113208.A1882@nevyn.them.org> <3BE03ECD.5060904@cygnus.com> <20011031174749.A28985@nevyn.them.org> <3BE182FB.2B8D8F8B@cotw.com> <20011101115343.A31822@nevyn.them.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Daniel Jacobowitz <dan@debian.org>
Cc: gdb@sources.redhat.com, linux-mips@oss.sgi.com
Message-ID: <20011101175905.Ugie-fiD9tyMelgT59jOjr1ToN7RXhqJvsTXzeVrEP0@z>

Daniel Jacobowitz wrote:
> 
> >    Program received signal SIGTRAP, Trace/breakpoint trap.
> >    0x80012c88 in breakinst () at gdb-stub.c:907
> 
> ... I wonder why you get a second SIGTRAP.  Never happens to me.  Quirk
> of your hardware?
> 
My bad. I have breakpoint instructions set inside 'kernel/module.c' so that
I can single step through module insertions. I should have added a 'bt'
output in gdb so you could see that. Everything is working great.

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
