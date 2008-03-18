Received: from [81.2.110.250] ([81.2.110.250]:62629 "EHLO lxorguk.ukuu.org.uk")
	by ftp.linux-mips.org with ESMTP id S28639539AbYCRORE (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 18 Mar 2008 14:17:04 +0000
Date: Tue, 18 Mar 2008 14:01:33 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH][MIPS][5/6]: AR7: serial hack
Message-ID: <20080318140133.3d41fd87@core>
In-Reply-To: <20080318133015.GA7239@alpha.franken.de>
References: <200803120221.25044.technoboy85@gmail.com>
	<200803141646.09645.technoboy85@gmail.com>
	<20080315104009.GA6533@alpha.franken.de>
	<200803161645.06364.technoboy85@gmail.com>
	<20080318133015.GA7239@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <alan@lxorguk.ukuu.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Matteo Croce <technoboy85@gmail.com>, linux-mips@linux-mips.org, Florian Fainelli <florian@openwrt.org>, Felix Fietkau <nbd@openwrt.org>, Nicolas Thill <nico@openwrt.org>, linux-serial@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20080318140133.UQTVI2KbzLl7DeyxT5LEnZBMc1RIa2yN5ZPGTtI70pc@z>

> Is there a good reason, why we don't check for BOTH_EMPTY in
> serial8250_console_putchar() ? To match the 2.6.10 behaviour we

A very good one - we have at least 1 byte of FIFO and the serial-ethernet
magic console devices also use that fifo emptying entirely to deduce when
to send a new packet.

> would need that and this would fix the AR7 case without any
> special handling.

If the AR7 is an 8250 why does it need special handling? and indeed why
does serial work on it except for console - or does that fail too.
