content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: do_IRQ query
Date: Thu, 12 Jun 2003 15:15:04 -0700
Message-ID: <D9F6B9DABA4CAE4B92850252C52383AB07968331@ex-eng-corp.efi.com>
From: "Ranjan Parthasarathy" <ranjanp@efi.com>
Return-Path: <ranjanp@efi.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jun Sun <jsun@mvista.com>, Ranjan Parthasarathy <ranjanp@efi.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030612221504.QidJLvZRMBRsgNSyPC4WfvS7ode5oOdn6eUu9BdT8mo@z>

Thank you for the information. I do not have a crash log at this minute. I will send something when I see the crashes again.

Ranjan

-----Original Message-----
From: Jun Sun [mailto:jsun@mvista.com]
Sent: Thursday, June 12, 2003 2:13 PM
To: Ranjan Parthasarathy
Cc: linux-mips@linux-mips.org; jsun@mvista.com
Subject: Re: do_IRQ query


On Thu, Jun 12, 2003 at 01:16:51PM -0700, Ranjan Parthasarathy wrote:
> Is it safe to call do_IRQ directly inside interrupt handlers without doing a irq_enter. I have seen ksoftirqd_CPUX crashes when I call the do_IRQ routines directly instead of the following sequence.
> 
> irq_enter()
> do_IRQ
> irq_exit()
>

This is not right.  irq_enter()/irq_exit() is already called in 
handle_IRQ_event(), which in turn is called by do_IRQ().  YOu 
don't need this yourself.  

The rest of do_IRQ() code is protected by closing interrupts.

Something must be wrong in your system.  If you show the crash message,
we might be able to tell more.

> Some code use it while some do not. The timer code in arch/mips/kernel/time.c uses it in ll_timer_interrupt. Some ports call this function directly in their interrupt handlers.

Those ll_timer_xxx functions are alternative routes (fast ones) to
do_IRQ(), and therefore it needs to protect itself by calling
irq_enter()/irq_exit().

Jun
