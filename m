content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: do_IRQ query
Date: Thu, 12 Jun 2003 13:16:51 -0700
Message-ID: <D9F6B9DABA4CAE4B92850252C52383AB07968330@ex-eng-corp.efi.com>
From: "Ranjan Parthasarathy" <ranjanp@efi.com>
Return-Path: <ranjanp@efi.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030612201651.blXYLkERd8zn-5z4xz6nkAL-tcPgSqcaA8oxBnEskhQ@z>

Is it safe to call do_IRQ directly inside interrupt handlers without doing a irq_enter. I have seen ksoftirqd_CPUX crashes when I call the do_IRQ routines directly instead of the following sequence.

irq_enter()
do_IRQ
irq_exit()

Some code use it while some do not. The timer code in arch/mips/kernel/time.c uses it in ll_timer_interrupt. Some ports call this function directly in their interrupt handlers.

Any information would be greatly appreciated.

Thank you

Ranjan
