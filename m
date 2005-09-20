From: "Michael Uhler" <uhler@mips.com>
Subject: RE: [PATCH] Fix TCP/UDP checksums on the Broadcom SB-1
Date: Tue, 20 Sep 2005 07:26:54 -0700
Message-ID: <00da01c5bdef$596ee380$0502a8c0@MIPS.COM>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050920110609.GB3159@linux-mips.org>
Return-Path: <uhler@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>, 'Matej Kupljen' <matej.kupljen@ultra.si>
Cc: "'Maciej W. Rozycki'" <macro@linux-mips.org>, 'Daniel Jacobowitz' <dan@debian.org>, linux-mips@linux-mips.org
Message-ID: <20050920142654.9GRbgOxWKk277fDDxTBYiX-rWUPyAuZZWx8l_v3KX8g@z>

For what it's worth, the 64-bit architecture, both prior to and with MIPS64,
has always required that 64-bit GPRs be sign-extended when used with 32-bit
operations.  I'm surprised that this wasn't seen on more 64-bit CPUs than
just the SB1.


/gmu
---
Michael Uhler, Chief Technology Officer
MIPS Technologies, Inc.   Email: uhler at mips.com
1225 Charleston Road      Voice:  (650)567-5025
Mountain View, CA 94043

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Ralf Baechle
> Sent: Tuesday, September 20, 2005 4:06 AM
> To: Matej Kupljen
> Cc: Maciej W. Rozycki; Daniel Jacobowitz; linux-mips@linux-mips.org
> Subject: Re: [PATCH] Fix TCP/UDP checksums on the Broadcom SB-1
> 
> 
> On Tue, Sep 20, 2005 at 01:00:04PM +0200, Matej Kupljen wrote:
> 
> > > > This caused incorrect checksums in some UDP packets for 
> NFS root.  
> > > > The problem was mild when using a 10.0.1.x IP address, 
> but severe 
> > > > when using 192.168.1.x.
> > > 
> > >  Ah!  So *that* is the reason for the absolutely abysmal NFS 
> > > performance
> > > of the SWARM with 2.6!  I have had no time to track it 
> down -- thanks a 
> > > lot!
> > 
> > Is this for MIPS64 only?
> > Because, on dbau1200 we also have poor NFS performance :-(
> 
> It's for 64-bit kernels only.  Note the difference, I didn't 
> say MIPS64.
> 
> Also, since this bug did result in an operation that has 
> undefined behaviour it likely may will only have impacted 
> some 64-bit processors - such as the SB1 - but others may 
> have been unaffected.
> 
>   Ralf
> 
> 
