Message-ID: <00ee01c19cfa$ab8d3640$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20020113211323.A7115@momenco.com> <15426.48692.795968.819750@gladsmuir.algor.co.uk>
Subject: Re: MIPS64 status?
Date: Mon, 14 Jan 2002 13:54:42 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Dominic Sweetman <dom@algor.co.uk>, Matthew Dharm <mdharm@momenco.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020114125442.rNFTwrvI4l6cXeKhJkn_QYaWyYgkkmAFV3pA7937pBc@z>

> > As I understand it, 64-bit support is really two different things:
> > 64-bit data path (i.e. unsigned long long) and 64-bit addressing
> > (for more than 4G of RAM).
> 
> Yes: the MIPS architecture is designed so there are lots of different
> things which can be "64-bit", and you don't have to go for them all at
> once.  This kind of choice can be as much curse as blessing, of course.

Careful, Dom.  As far as user-mode programs are concerned,
older 64-bit MIPS designs (R4xxxx/R5xxxx/R7xxxx), one cannot
enable 64-bit arithmetic without enabling 64-bit addressing,
both of these functions being enabled by the Status.UX bit.
SGI's IRIX OS allowed an execution model that provided
64-bit registers and math, while *simulating* a 32-bit address
space, based on sign-extending 32-bit addresses to 64-bits.
The user was spared doubling the footprint of all his pointers,
but the OS still had to manage the larger page tables.

The official MIPS64[tm] architecture spec from MIPS 
Technologies also provides a bit (Status.PX) which enables
the 64-bit data path without affecting address generation
and translation, which removes this quirk.  Only the very
most recent 64-bit cores and CPUs implement it, however.


            Regards,

            Kevin K.
