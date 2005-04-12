Message-ID: <00c701c53f7e$09ec56c0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <42553E49.7080004@timesys.com> <4256991C.4020601@timesys.com> <20050408161357.GB19166@linux-mips.org> <4256B524.2080509@timesys.com> <425AD440.5050600@timesys.com> <004a01c53ed4$dab12b00$10eca8c0@grendel> <Pine.LNX.4.61L.0504121610500.18606@blysk.ds.pg.gda.pl>
Subject: Re: another 4kc machine check.
Date: Tue, 12 Apr 2005 18:38:14 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Greg Weeks <greg.weeks@timesys.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20050412163814.Z01LgRK13SOmXqddx1hO45JXl08vk69dZBm0GSuOp7I@z>

> On Mon, 11 Apr 2005, Kevin D. Kissell wrote:
> 
> > If the 4KC and 4KEC need it, so does the 4KSC (and 4KSD).
> 
>  But that's weird in the first place as 4Kc implements the original 
> revision of MIPS32 so it does not implement "ehb".  Therefore it acts just 
> as an ordinary "nop", but according to the 4K manual there is no need for 
> one -- the hazard between a move to EntryLo0/EntryLo1 and tlbwi/tlbwr is 
> explicitly listed as 0 instructions.

Oops.  Maybe I misread the patch.  I thought the added NOP was between
the TLBWR and the ERET.

            Kevin K.
