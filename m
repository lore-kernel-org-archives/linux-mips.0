Received: from mail-wm0-f46.google.com ([74.125.82.46]:38248 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27006811AbbLRKSQd4fgG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Dec 2015 11:18:16 +0100
Received: by mail-wm0-f46.google.com with SMTP id l126so58474630wml.1
        for <linux-mips@linux-mips.org>; Fri, 18 Dec 2015 02:18:16 -0800 (PST)
Subject: Re: [PATCH v3 4/4] printk/nmi: Increase the size of NMI buffer and
 make it configurable
References: <1449667265-17525-1-git-send-email-pmladek@suse.com>
 <1449667265-17525-5-git-send-email-pmladek@suse.com>
 <CAMuHMdXVgr58YjoePGrRbMyMncQ27f85prL7G5SpeHeNxoYrXQ@mail.gmail.com>
 <20151211124159.GB3729@pathway.suse.cz>
 <20151211145725.b0e81bb4bb18fcd72ef5f557@linux-foundation.org>
 <20151211232113.GZ8644@n2100.arm.linux.org.uk>
 <alpine.LNX.2.00.1512120024370.9922@cbobk.fhfr.pm>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <5673DD60.7080302@linaro.org>
Date: Fri, 18 Dec 2015 10:18:08 +0000
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.00.1512120024370.9922@cbobk.fhfr.pm>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <daniel.thompson@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jiri Kosina <jikos@kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, Cris <linux-cris-kernel@axis.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>
Message-ID: <20151218101808.SybjX4fwQ2IuHGtgbhzHeHuDCkKW7cJuh4j1Y0wyPAg@z>

On 11/12/15 23:26, Jiri Kosina wrote:
> On Fri, 11 Dec 2015, Russell King - ARM Linux wrote:
>
>> I'm personally happy with the existing code, and I've been wondering why
>> there's this effort to apply further cleanups - to me, the changelogs
>> don't seem to make that much sense, unless we want to start using
>> printk() extensively in NMI functions - using the generic nmi backtrace
>> code surely gets us something that works across all architectures...
>
> It is already being used extensively, and not only for all-CPU backtraces.
> For starters, please consider
>
> - WARN_ON(in_nmi())
> - BUG_ON(in_nmi())

Sorry to join in so late but...

Today we risk deadlock when we try to issue these diagnostic errors 
directly from NMI context.

After this change we will still risk deadlock, because that's what the 
diagnostic code is trying to tell us, *and* we delay actually reporting 
the error until, and only if, the NMI handler completes.

I'm not entirely sure that this is an improvement.


> - anything being printed out from MCE handlers

The MCE handlers should only call printk() when they decide to panic and 
*after* busting the spinlocks. At this point deferring printk() until it 
is safe is not very helpful.

When we bust the spinlocks we should probably restore the normal 
printk() function to give best chance of the failure messages making it out.


Daniel.
