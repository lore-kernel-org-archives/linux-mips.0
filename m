Message-ID: <019201c32b40$2d54cf60$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20030604153930.H19122@mvista.com> <20030604231547.GA22410@linux-mips.org> <20030604164652.J19122@mvista.com>
Subject: Re: [RFC] synchronized CPU count registers on SMP machines
Date: Thu, 5 Jun 2003 10:55:10 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jun Sun <jsun@mvista.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20030605085510.mkOgBHeayCj8dMIpPxZW9t9gsw3qrSoGTbfwZNDKR8o@z>

----- Original Message ----- 
From: "Jun Sun" <jsun@mvista.com>
> On Thu, Jun 05, 2003 at 01:15:47AM +0200, Ralf Baechle wrote:
> > On Wed, Jun 04, 2003 at 03:39:30PM -0700, Jun Sun wrote:
> > 
> > > 1) clocks on different CPUs don't have the same frequency
> > > 2) clocks on different CPUs drift to each other
> > > 2) some fancy power saving feature such as frequency scaling
> > > 
> > > But I think for a foreseeable future most MIPS SMP machines
> > > don't have the above issues (true?).  And it is probably worthwile
> > > to synchronize count registers for them.
> > 
> > 1) and 2) affect most SGI systems.
> >
> 
> Assuming SGI systems represent the past of MIPS, we are still ok
> future-wise. :)

I personally think it would be foolish to assume that future MIPS 
MP systems will not be subject to one or more such constraint.

            Kevin K.
