Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <002701bebf17$cd9e4fd0$0a02030a@snafu>
From: "Andrew Linfoot" <andy@derfel99.freeserve.co.uk>
References: <19990622032859.B6955@thepuffingroup.com> <19990622152145.A1059@uni-koblenz.de> <19990623014923.A8953@thepuffingroup.com> <19990625002853.D17220@uni-koblenz.de>
Subject: Re: File corruption
Date: Fri, 25 Jun 1999 15:34:15 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: linux@cthulhu.engr.sgi.com
Message-ID: <19990625143415.lcfbBD2uf9k7HTqqdw0jXKsswy8SnARim_SQ_UsvtiQ@z>

I have been running 2.2.1 on my indy for about 3 weeks now and have
encountered problems like this,
in fact i am surprised at how stable the box is, i have been doing some
quite large builds of qt, kde and the like too. If this is reproducible then
i would be prepared to experiment on one of my boxes.

The only gripe i have is that the scsi driver breaks when i attach external
devices, any ideas?

Andy
----- Original Message -----
From: Ralf Baechle <ralf@uni-koblenz.de>
To: <linux@cthulhu.engr.sgi.com>
Sent: Thursday, June 24, 1999 11:28 PM
Subject: Re: File corruption


> On Wed, Jun 23, 1999 at 01:49:23AM +0200, Ulf Carlsson wrote:
>
> > > And under which kernel version did this start to happen?
> >
> > 2.2.1 I think.
>
> Are you shure?  The problem Alan is tracking started to hit from 2.2.7 on.
> If 2.2.1 already starts making these kind of troubles then we probably
> track two different problems.
>
> > Unfortunately I don't have IRIX.  However, I have a 133 MHz R4600 CPU
with 512 k
> > board cache.  I have two 1 Gb SCSI driver connected.
>
> Is this a low-mem configuration?  The problem Alan is tracking apparently
> seems to hit low mem systems more often.
>
>   Ralf
>
