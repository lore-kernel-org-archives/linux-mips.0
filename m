Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <001901bebf2d$e1951530$0a02030a@snafu>
From: "Andrew Linfoot" <andy@derfel99.freeserve.co.uk>
References: <19990622032859.B6955@thepuffingroup.com> <19990622152145.A1059@uni-koblenz.de> <19990623014923.A8953@thepuffingroup.com> <19990625002853.D17220@uni-koblenz.de> <002701bebf17$cd9e4fd0$0a02030a@snafu> <19990625185906.A9050@thepuffingroup.com>
Subject: Re: File corruption
Date: Fri, 25 Jun 1999 18:11:52 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ulf Carlsson <ulfc@thepuffingroup.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19990625171152.8svB7aqz_xMrhICu3mh8oy5O9YN99uiqOOrGoLjo6r8@z>



On a couple of occasions i have lost entire directories but this was some
time ago
----- Original Message -----
From: Ulf Carlsson <ulfc@thepuffingroup.com>
To: Andrew Linfoot <andy@derfel99.freeserve.co.uk>
Cc: <linux@cthulhu.engr.sgi.com>
Sent: Friday, June 25, 1999 5:59 PM
Subject: Re: File corruption


> On Fri, Jun 25, 1999 at 03:34:15PM +0100, Andrew Linfoot wrote:
> > I have been running 2.2.1 on my indy for about 3 weeks now and have
> > encountered problems like this, in fact i am surprised at how stable the
box
> > is, i have been doing some quite large builds of qt, kde and the like
too. If
> > this is reproducible then i would be prepared to experiment on one of my
> > boxes.
I have had a couple of instances where i lost complete directories, but this
was during the first few days of running Linux on my box, i simply put it
down to operator error!
>
> It doesn't crash, only file corruption..
>
> > The only gripe i have is that the scsi driver breaks when i attach
external
> > devices, any ideas?
>
> I have file corruption without any external devices.  It looks like the
problems
> appear when more than one SCSI devices are present.  You only have one
internal
> SCSI drive, right?
2 drives - see below
If i attempt to attach an external device the system just hangs during scsi
initialisation. I think this is fixed in later kernels but i don't have cvs
up yet so i can't move past 2.2.1.
>
> Do you mind telling us more exactly what type of file corruption you
suffer
> from?  It would also help if you could attach an output from hinv, or just
tell
> us what hardware you have.
CPU: MIPS-R4400 FPU<MIPS-R4400FPC> ICACHE DCACHE SCACHE
Loading R4000 MMU routines.
CPU revision is: 00000450
Primary instruction cache 16kb, linesize 16 bytes)
Primary data cache 16kb, linesize 16 bytes)
Secondary cache sized at 1024K linesize 128
8-bit graphics
128MB RAM
sda 540MB with base IRIX
sdb 2GB with Linux.and swap

an interesting point here is that /proc/cpuinfo tells me i only have an
r4000!

Andy
>
> Regards,
> Ulf
>
