Message-ID: <008d01c254b5$d7398500$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3D765072.60208@Lineo.COM> <1031182461.3017.137.camel@irongate.swansea.linux.org.uk>
Subject: Re: patch to kaweth.c to align IP header
Date: Thu, 5 Sep 2002 10:23:29 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, Quinn Jensen <jensenq@lineo.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20020905082329.19ldJinTiOVwBj1plZ4IisH56k9rNrJJ1tASC_8jMpA@z>

----- Original Message ----- 
From: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
To: "Quinn Jensen" <jensenq@lineo.com>
Cc: <linux-mips@linux-mips.org>
Sent: Thursday, September 05, 2002 1:34 AM
Subject: Re: patch to kaweth.c to align IP header


> On Wed, 2002-09-04 at 19:26, Quinn Jensen wrote:
> > All,
> > 
> > The Kawasaki LSI USB Ethernet driver was causing a crash
> > in ipt_do_table() on mips because the address fields in
> > the IP header were not word aligned.  Many (all?) other
> 
> You -must- handle alignment traps in the kernel for networking. The
> network code assumes and relies on this property and there are plenty of
> other ways to get misaligned datagrams through things like ip in ip.
> 
> > ethernet drivers do an skb_reserve of 2 to word align
> > the address fields, and doing this in kaweth.c fixed
> > my crash.
> 
> Its not the crash fix, its however right in the sense its a good
> performance optimisation for most platforms

It is true that, due to the unfortunate lack of foresight in the
design of IP, no pre-alignment of buffers will *guarantee*
that the address or other fields of IP headers will be aligned.

But I note that a design which assumes, for non x86 CPUs,
that unaligned references will be handled by a kernel trap
handler had darn well better assure itself that the misaligned
case is extemely infrequent.  Otherwise, it would be a distinctly
better design to extract all multi-byte IP header values using
a macro which could map to a direct, possibly unaligned,
load for CISC architectures, and to appropriate sequences
of instructions for RISC architectures.  I haven't measured
the alignment fault path for MIPS/Linux (in any case, MIPS
isn't the only architecture affected here), but if we assume for
the sake of the argument that it's 50 instructions, and that an
unaligned halfword costs 4 inline instructions (lbu,lbu,sll,or),
then using the unaligned reference trap as a crutch is a win
only if the fields are correctly aligned roughtly 94% of the time.

If full 32-bit or 64-bit words are being extracted, a MIPS CPU
can do the unaligned accesses in only 2 in-line instructions,
which would push the breakeven point out even further.

Does anyone have any actual statistical data on the cost
and frequency of this use of the unaligned access fixup?

            Regards,

            Kevin K.
