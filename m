Date: Fri, 26 Jan 2001 13:00:44 -0800
From: Ralf Baechle <ralf@oss.sgi.com>
Subject: Re: MIPS/linux compatible PCI network cards
Message-ID: <20010126130044.E869@bacchus.dhis.org>
References: <3A70A356.F3CA71F1@jungo.com> <20010125141632.B2311@bacchus.dhis.org> <3A712A52.FAC574F1@mips.com> <019b01c0878d$8ac9e6c0$0deca8c0@Ulysses>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <019b01c0878d$8ac9e6c0$0deca8c0@Ulysses>; from kevink@mips.com on Fri, Jan 26, 2001 at 12:45:45PM +0100
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Carsten Langgaard <carstenl@mips.com>, Michael Shmulevich <michaels@jungo.com>, linux-mips@oss.sgi.com
Message-ID: <20010126210044.iBTI9gn1Dnqr3rz8oLAQy2vVI2M_RC9bZlHj-DIA93o@z>

On Fri, Jan 26, 2001 at 12:45:45PM +0100, Kevin D. Kissell wrote:

> Note, however, that the Tulip driver that was part of the
> standard 2.2/2.3 repository at oss.sgi.com was both
> downrev with regard to the author's own web site and
> subobtimal if not outright buggy in it's cache management.
> The AMD PCnet driver as we found it was clean and efficient
> but had no MIPS cache hooks.   I had to put those in.
> So unless Ralf or someone at SGI that the versions
> on oss.sgi.com are the versions I cleaned up for MIPS,
> I would recommend pulling them off the MIPS site.

Linux 2.4 has a new DMA API which is documented in
Documentation/DMA-mapping.txt.  So today drivers which don't work out of
the box on a MIPS system should be considered broken.

  Ralf
