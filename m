Message-ID: <001701c0d79b$f9f10980$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.4.10.10105080959500.13343-100000@escobaria.sonytel.be>
Subject: Re: Linux on a Tektronix XP217C xterm
Date: Tue, 8 May 2001 10:50:37 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Kaj-Michael Lang <milang@tal.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010508085037.P0kMGrU4oi7eNSfeC0LDXG4yWPScBYu3SVvvUMpxzi4@z>

> On Tue, 8 May 2001, Kaj-Michael Lang wrote:
> > Any chance of getting linux running on a tektronix x-terminal ? It has
> > a LR33020 cpu, that I think is a R3000 integrated with some graphics
> > chip. I've tried searching for documentation for the chip but I didn't
> > find anything.
>
> IIRC there's a different separate graphics chip in the 217. I think the
33020
> is not a MIPS, but a RISC chip from LSI Logic.

The 33xx0 family are MIPS-compatible designs that were done
in-house at LSI logic.  At the level of the user-mode instruction
set, they are compatible with MIPS-I/R3000 - indeed, the basic
pipeline looks like it was taken directly from the R3000.  But the
system coprocessor was radically modified and simplified and in
particular there is no TLB/MMU.  Standard Linux therefore won't fly
on it, though some variant of uClinux might.

            Regards,

            Kevin K.
