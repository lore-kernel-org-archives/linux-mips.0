Date: Tue, 12 Aug 2003 01:16:35 +0200
Subject: Re: load/store address overflow on binutils 2.14
Message-ID: <20030811231635.GB23104@rembrandt.csv.ica.uni-stuttgart.de>
References: <20030810145425.GE22977@rembrandt.csv.ica.uni-stuttgart.de> <Pine.GSO.4.21.0308112257180.20421-100000@vervain.sonytel.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.21.0308112257180.20421-100000@vervain.sonytel.be>
From: Thiemo Seufer <ica2_ts@csv.ica.uni-stuttgart.de>
Return-Path: <ica2_ts@csv.ica.uni-stuttgart.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chip Coldwell <coldwell@frank.harvard.edu>, Linux/MIPS Development <linux-mips@linux-mips.org>
Message-ID: <20030811231635.xIPIyJa1jk-ZHmAs3LEBL2DHyuTKRQciGC6mF1NIT0U@z>

Geert Uytterhoeven wrote:
[snip]
> > > Strangely, this is actually "correct" behavior.  Arguments on
> > > variable-length argument lists are implicitly "promoted" to unsigned
> > > int at the widest.  See K&R 2nd ed. A6.1 and A7.3.2.
> > 
> > Ugh. Thanks for pointing this out. I wasn't aware of it.
> > 
> > 	printf("%016Lx\n", ~a);
> > 
> > Produces the expected output. So it is actually an implementation
> > bug in binutils, which isn't fixable for 2.14 and earlier, because
> > those have to remain at K&R C level. The K&R requirement was only
> > recenly loosened.
> 
> How can it print the correct output if ~a is `promoted' to unsigned int, while
> you specify %Lx in the format string?
