From: "Matthew Dharm" <mdharm@momenco.com>
Subject: RE: MIPS64 status?
Date: Mon, 14 Jan 2002 16:27:02 -0800
Message-ID: <NEBBLJGMNKKEEMNLHGAIKENDCEAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.3.96.1020114165623.28388B-100000@wakko.deltatee.com>
Sender: owner-linux-mips@oss.sgi.com
To: Jason Gunthorpe <jgg@debian.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020115002702.-BiAy2FK8sogjTJDYGRR3slJkQev-fAupphHam65RSo@z>

Hrm...

Were you actually using 64-bit addresses on the PCI bus?

My guess is that with some creative address mappings, this could be
done.  The PCI bus itself would use only 32-bit address, but the CPU
would use a base address offset into the >4G range.

Yeah, I could see how that could get ugly...

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: owner-linux-mips@oss.sgi.com
> [mailto:owner-linux-mips@oss.sgi.com]On Behalf Of Jason Gunthorpe
> Sent: Monday, January 14, 2002 4:00 PM
> To: Matthew Dharm
> Cc: linux-mips@oss.sgi.com
> Subject: RE: MIPS64 status?
>
>
>
> On Mon, 14 Jan 2002, Matthew Dharm wrote:
>
> > Does this mean we could map PCI memory/IO addresses above
> 4G and have
> > it work?
>
> Ooh, don't go there :> We looked at that and actually did
> it then backed
> it out.
>
> The PCI spec (particuarly PCI-X) tries to make it possible, but in a
> general system with PCI sockets/etc it is just is not feasible. PCI
> bridges need to be located below 4G, as do the majority of
> devices made.
> There is also a performance hit for having device registers > 4G.
>
> You'd definately need the mips64 kernel to do that, or use
> ugly wired TLB
> entries with normal mips.
>
> Jason
>
