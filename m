From: "Andrew Linfoot" <alinfoot@escafeldcomputing.co.uk>
Subject: RE: Passing kernel args
Date: Tue, 1 May 2001 16:31:47 +0100
Message-ID: <000001c0d253$f36e3b20$0101a8c0@derfel>
In-Reply-To: <20010424230923.A5906@bilbo.physik.uni-konstanz.de>
Sender: owner-linux-mips@oss.sgi.com
To: 'Guido Guenther' <guido.guenther@gmx.net>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010501153147.Y2whA5C6EGhw0PDa17KnYrVamE4B7iooriSa3rz_Vp4@z>

My fault i'm afraid! I had used an old kernel without the neccessary
patches.
I am now using 2.4.3 and everthing works fine.

Sorry for any hassle this has caused.

Andy

-----Original Message-----
From: owner-linux-mips@oss.sgi.com
[mailto:owner-linux-mips@oss.sgi.com]On Behalf Of Guido Guenther
Sent: 24 April 2001 22:09
To: Andrew Linfoot
Cc: linux-mips@oss.sgi.com
Subject: Re: Passing kernel args


On Tue, Apr 24, 2001 at 08:09:13PM +0100, Andrew Linfoot wrote:
> Just thought i would let you know of my experience with autobooting.
>
> I'm having the same problems as Dave in that i must specify a space in
> the OSLoadOptions " root=/dev/sda1 ro". However every time i shutdown or
> reboot it is truncated to OSLoadOptions= root=/dev/s meaning i have to
reset
> it after every reboot.
Could you please send me the kernel command line with and without using
the space (e.g.  dmesg | grep "command line") - i still don't see what
this should be good for.  BTW no need to give root= in OSLoadOptions,
you can use OSLoadPartition instead.
>
> any ideas as to what may be causing this?
> I am runnning on an Indy R5K
It seems the space in the PROM for OSLoadOptions is quiet limited. The
space available seems to differ between different PROM versions
though(see the HOWTO, it's in there).
>
> Also i am using an ELF kernel and not ECOFF as specified in Guido's howto.
Doesn't make a difference. ECOFF is just a save bet.
 -- Guido
