Date: Thu, 11 Jan 2001 02:06:05 -0200
From: Ralf Baechle <ralf@oss.sgi.com>
Subject: Re: CPU Nevada
Message-ID: <20010111020604.A24721@bacchus.dhis.org>
References: <3A5CDC3A.FE21F363@mvista.com> <012301c07b67$19b95c40$0deca8c0@Ulysses>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <012301c07b67$19b95c40$0deca8c0@Ulysses>; from kevink@mips.com on Thu, Jan 11, 2001 at 01:40:28AM +0100
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Pete Popov <ppopov@mvista.com>, linux-mips@oss.sgi.com
Message-ID: <20010111040605.SIffIGx_Y1lvvP5wkr3YZc9JN8x-OkVqPJiuCH_37Z0@z>

On Thu, Jan 11, 2001 at 01:40:28AM +0100, Kevin D. Kissell wrote:

> C'mon Pete, it's obviously a typo!   It predates my involvement
> with the code - hell, I never even knew that "Nevada" was the
> QED code name for the R5200 family before I started hacking
> on the MIPS Linux kernel, even though I had an R5230 system
> in my lab.  The "6" is probably shifted left one position from 
> "R5260", which was, I believe, the first chip of the Nevada
> family to ship.

No idea how the 6 ended up there; I wrote the Nevada support for Cobalt's
Qube which originally using a R5230, the small brother of the 5260 with
just a 32 bit external bus.  Anyway, I fixed that buglet.

  Ralf
