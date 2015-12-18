Received: from bombadil.infradead.org ([198.137.202.9]:37136 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007139AbbLRL3OXEkoe (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Dec 2015 12:29:14 +0100
Date: Fri, 18 Dec 2015 12:29:02 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 4/4] printk/nmi: Increase the size of NMI buffer and
 make it configurable
Message-ID: <20151218112902.GO6344@twins.programming.kicks-ass.net>
References: <1449667265-17525-1-git-send-email-pmladek@suse.com>
 <1449667265-17525-5-git-send-email-pmladek@suse.com>
 <CAMuHMdXVgr58YjoePGrRbMyMncQ27f85prL7G5SpeHeNxoYrXQ@mail.gmail.com>
 <20151211124159.GB3729@pathway.suse.cz>
 <20151211145725.b0e81bb4bb18fcd72ef5f557@linux-foundation.org>
 <20151211232113.GZ8644@n2100.arm.linux.org.uk>
 <alpine.LNX.2.00.1512120024370.9922@cbobk.fhfr.pm>
 <5673DD60.7080302@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5673DD60.7080302@linaro.org>
Return-Path: <peterz@infradead.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jiri Kosina <jikos@kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, Cris <linux-cris-kernel@axis.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>
Message-ID: <20151218112902.RSbaPmcZf-1658oV81cX6nnfMlEgb_2yY2MHYtVI-MY@z>

On Fri, Dec 18, 2015 at 10:18:08AM +0000, Daniel Thompson wrote:
> I'm not entirely sure that this is an improvement.

What I do these days is delete everything in vprintk_emit() and simply
call early_printk().

Kill the useless kmsg buffer crap and locking, just pound bytes to the
UART registers without anything in between.

The other semi usable solution is redirecting to trace_printk() and
recovering the trace buffers from your kdump. But I've found that
typically kdump doesn't work anymore if you properly wedge the machine.
So this is very much a second rate solution.

But this globally locked buffer, calling out to console drivers that do
locking and even scheduling, is an unreliable unfixable trainwreck that
I've given up on.
