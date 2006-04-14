Received: from mga03.intel.com ([143.182.124.21]:94 "EHLO
	azsmga101-1.ch.intel.com") by ftp.linux-mips.org with ESMTP
	id S8133482AbWDNWA7 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 14 Apr 2006 23:00:59 +0100
Message-ID: <4t16i2$ma94t@orsmga001.jf.intel.com>
From: "Chen, Kenneth W" <kenneth.w.chen@intel.com>
Subject: RE: [PATCH 00/05] robust per_cpu allocation for modules
Date: Fri, 14 Apr 2006 15:12:52 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1145049535.1336.128.camel@localhost.localdomain>
Return-Path: <kenneth.w.chen@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Steven Rostedt' <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>
Cc: Linus Torvalds <torvalds@osdl.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Andi Kleen <ak@suse.de>, Martin Mares <mj@atrey.karlin.mff.cuni.cz>, bjornw@axis.com, schwidefsky@de.ibm.com, benedict.gaster@superh.com, lethal@linux-sh.org, Chris Zankel <chris@zankel.net>, Marc Gauthier <marc@tensilica.com>, Joe Taylor <joe@tensilica.com>, David Mosberger-Tang <davidm@hpl.hp.com>, rth@twiddle.net, spyro@f2s.com, starvik@axis.com, "Luck, Tony" <tony.luck@intel.com>, linux-ia64@vger.kernel.org, ralf@linux-mips.org, linux-mips@linux-mips.org, grundler@parisc-linux.org, parisc-linux@parisc-linux.org, linuxppc-dev@ozlabs.org, paulus@samba.org, linux390@de.ibm.comlethal@linux-sh.org, davem@davemloft.netchris@zankel.net
Message-ID: <20060414221252.3KDWq5o6KJteDTBSBD5PFafPVMt5er6QgDvTi5ljrT4@z>

Steven Rostedt wrote on Friday, April 14, 2006 2:19 PM
> So the current solution has two flaws:
> 1. not robust. If we someday add more modules that together take up
>    more than 14K, we need to manually update the PERCPU_ENOUGH_ROOM.
> 2. waste of memory.  We have 14K of memory wasted per CPU. Remember
>    a 64 processor machine would be wasting 896K of memory!

If someone who has the money to own a 64-process machine, 896K of memory
is pocket change ;-)

- Ken
