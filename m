Date: Thu, 22 Jan 2004 14:44:05 -0800
From: Jun Sun <jsun@mvista.com>
Subject: Re: [PATCH 2.6] set up conswitchp when CONFIG_VT is set
Message-ID: <20040122144405.C3573@mvista.com>
References: <20040121162032.F29705@mvista.com> <Pine.GSO.4.58.0401221052100.1408@waterleaf.sonytel.be> <20040122122832.GA4482@linux-mips.org> <Pine.GSO.4.58.0401221331160.1408@waterleaf.sonytel.be> <20040122221820.GA23391@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20040122221820.GA23391@linux-mips.org>; from ralf@linux-mips.org on Thu, Jan 22, 2004 at 11:18:20PM +0100
Return-Path: <jsun@mvista.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/MIPS Development <linux-mips@linux-mips.org>, jsun@mvista.com
Message-ID: <20040122224405.rC_n5XozrD27E4QFDbwx9fgCBQfqaW6hxYyGL4Fdb-U@z>

On Thu, Jan 22, 2004 at 11:18:20PM +0100, Ralf Baechle wrote:
> On Thu, Jan 22, 2004 at 01:32:58PM +0100, Geert Uytterhoeven wrote:
> 
> > DUMMY_CONSOLE can be set in drivers/video/console/Kconfig only.
> > drivers/video/console/Kconfig is included by drivers/video/Kconfig only, and
> > its inclusion depends on VT.
> > Hence the #ifdef CONFIG_VT is superfluous, unless the above isn't true for the
> > MIPS tree (I checked plain 2.6.1).
> 
> A few systems used to hardwire CONFIG_DUMMY_CONSOLE in their Config.in /
> Kconfig.  Seem that has been fixed, good.
> 

You are both right.  

In the end conswitchp needs to be set if and only if CONFIG_VT is set.  
