From: "Matthew Dharm" <mdharm@momenco.com>
Subject: RE: MIPS64 status?
Date: Mon, 14 Jan 2002 15:25:44 -0800
Message-ID: <NEBBLJGMNKKEEMNLHGAICENCCEAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020114150554.A29242@dea.linux-mips.net>
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020114232544.aCYzcJpe5uZFZY4F-o2Yqr7nkxRzcDabOdklAO5MRbI@z>

Ralf --

Thanks for the info.  Too bad "MIPS64" and "mips64" sound exactly the
same on the telephone.

But, I need to be pedantic, just to be clear on a couple of
questions...

So, the "mips64" kernel can use 64-bits of address, for RAM >4G?
But, the apps running are always 32-bit?
Does this mean that any individual application can only use 4G of
memory, tho you could have several applications in physical memory
doing this? (i.e. multiple applications using 1G of RAM each, but not
swapping to disk?)
Does this mean we could map PCI memory/IO addresses above 4G and have
it work?

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: owner-linux-mips@oss.sgi.com
> [mailto:owner-linux-mips@oss.sgi.com]On Behalf Of Ralf Baechle
> Sent: Monday, January 14, 2002 3:06 PM
> To: Matthew Dharm
> Cc: linux-mips@oss.sgi.com
> Subject: Re: MIPS64 status?
>
>
> On Sun, Jan 13, 2002 at 09:13:23PM -0800, Matthew Dharm wrote:
>
> > As I understand it, 64-bit support is really two
> different things:  64-bit
> > data path (i.e. unsigned long long) and 64-bit addressing
> (for more than 4G
> > of RAM).
>
> Right but due to the CPU architecture of pre-MIPS64 CPUs
> they always come
> together unless the software does funny attempts at
> truncating OS support
> to just 32-bit.  So the 32-bit kernel gives you none of the
> two, the mips64
> kernel both.
>
> > My understanding is that "MIPS64" generally refers to a
> kernel which
> > supports a 64-bit data path, but we're still limited to
> 32-bit addressing.
> > Is that correct?
>
> MIPS64 is MIPS's MIPS64 processor architecture, mips64 is
> the 64-bit kernel.
> That may sound like nitpicking but it's important to
> understand that both
> are not the same.
>
> > I suspect that this is very much a toolchain issue, as I
> don't think gcc
> > will generate 64-bit addressing code.
>
> Gcc is fine; the problem are binutils, that is as and ld.
> As a result of
> the gcc problems we don't have a 64-bit userspace either so
> all software
> running on 64-bit kernels is currently old 32-bit software
> running in
> compatibility mode.
>
>   Ralf
>
