Received: from smtp2.linux-foundation.org ([207.189.120.14]:22980 "EHLO
	smtp2.linux-foundation.org") by ftp.linux-mips.org with ESMTP
	id S20033745AbXLED17 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 5 Dec 2007 03:27:59 +0000
Date: Tue, 4 Dec 2007 19:27:38 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] SC26XX: New serial driver for SC2681 uarts
Message-ID: <20071204192738.54e79a97.akpm@linux-foundation.org>
In-Reply-To: <20071204234112.GA12352@alpha.franken.de>
References: <20071202194346.36E3FDE4C4@solo.franken.de>
	<20071203155317.772231f9.akpm@linux-foundation.org>
	<20071204234112.GA12352@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <akpm@linux-foundation.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Andy Whitcroft <apw@shadowen.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Message-ID: <20071205032738.eDzj-1K3Q95tqgZ-PfoOKSt-5GC-61R7CAXK3H0JeTk@z>

On Wed, 5 Dec 2007 00:41:12 +0100 tsbogend@alpha.franken.de (Thomas Bogendoerfer) wrote:

> On Mon, Dec 03, 2007 at 03:53:17PM -0800, Andrew Morton wrote:
> > On Sun,  2 Dec 2007 20:43:46 +0100 (CET)
> > Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:
> > 
> > > New serial driver for SC2681/SC2691 uarts. Older SNI RM400 machines are
> > > using these chips for onboard serial ports.
> > > 
> > 
> > Little things...
> 
> here is an updated version.
> 
> Changes:
>    - use container_of
>    - remove not needed locking
>    - remove inlines
>    - fix macros with double argument reference
> 
> Thomas.
> --
> 
> New serial driver for SC2681/SC2691 uarts. Older SNI RM400 machines are
> using these chips for onboard serial ports.
> 

grumble.

These:

> +#define READ_SC(p, r)        readb((p)->membase + RD_##r)
> +#define WRITE_SC(p, r, v)    writeb((v), (p)->membase + WR_##r)

and these:

> +#define READ_SC_PORT(p, r)     read_sc_port(p, RD_PORT_##r)
> +#define WRITE_SC_PORT(p, r, v) write_sc_port(p, WR_PORT_##r, v)

really don't need to exist.  All they do is make the code harder to read.

Think of the poor reader who sees this:

		status = READ_SC_PORT(port, SR);

and then goes madly searching for "SR".  After a while, our confused reader
might think to go look at the definition of READ_SC_PORT, after which our
reader will emulate a C preprocessor in wetware and will eventually construct
then hunt down RD_PORT_SR and will then hopefully remember what the heck he was
trying to do in the first place.

This sucks.

Code is written once and is read a thousand times.  Please optimise for
reading.
