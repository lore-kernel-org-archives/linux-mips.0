Received: from mail-wm0-f47.google.com ([74.125.82.47]:34751 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007818AbbLNK2zcgxU2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 14 Dec 2015 11:28:55 +0100
Received: by mail-wm0-f47.google.com with SMTP id p66so54970315wmp.1
        for <linux-mips@linux-mips.org>; Mon, 14 Dec 2015 02:28:55 -0800 (PST)
Subject: Re: [PATCH v3 4/4] printk/nmi: Increase the size of NMI buffer and
 make it configurable
References: <1449667265-17525-1-git-send-email-pmladek@suse.com>
 <1449667265-17525-5-git-send-email-pmladek@suse.com>
 <CAMuHMdXVgr58YjoePGrRbMyMncQ27f85prL7G5SpeHeNxoYrXQ@mail.gmail.com>
 <20151211124159.GB3729@pathway.suse.cz>
 <20151211145725.b0e81bb4bb18fcd72ef5f557@linux-foundation.org>
 <20151211232113.GZ8644@n2100.arm.linux.org.uk>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <566E99DF.6050008@linaro.org>
Date: Mon, 14 Dec 2015 10:28:47 +0000
MIME-Version: 1.0
In-Reply-To: <20151211232113.GZ8644@n2100.arm.linux.org.uk>
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
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>
Cc: Petr Mladek <pmladek@suse.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <jkosina@suse.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, Cris <linux-cris-kernel@axis.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>
Message-ID: <20151214102847.LPjnxouokJeP77D8MzgiFbMlLmky2OF5Lb4M4MdjUHk@z>

On 11/12/15 23:21, Russell King - ARM Linux wrote:
> As I explained when I did that work, the vast majority of ARM platforms
> are unable to trigger anything like a NMI - the FIQ is something that's
> generally a property of the secure monitor, and is not accessible to
> Linux.  However, there are platforms where it is accessible.
>
> The work to add the FIQ-based variant never happened (I've no idea what
> happened to that part, Daniel seems to have lost interest in working on
> it.)  So, what we have is the IRQ-based variant merged in mainline, which
> would be the fallback for the "FIQ not available" cases, and I carry a
> local hack in my tree which provides the FIQ-based version - but if it
> were to trigger, it takes out all interrupts (hence why I've not merged
> my hack.)
>
> I think the reason that the FIQ-based variant has never really happened
> is that hooking into the interrupt controller code to clear down the FIQ
> creates such a horrid layering violation, and also a locking mess that
> I suspect it's just been given up with.

I haven't quite given up; I'm still looking into this stuff. However 
you're certainly right that connecting the FIQ handler to the GIC code 
in an elegant way is tough.

I've been working in parallel on an arm64 implementation with the result 
that I'm now two lumps of code that are almost, but not quite, ready.

Right now I hope to share latest arm code fairly late in the this 
devcycle (for review rather than merge) followed up with a new version 
very early in v4.6. Even now I think the code needs a long soak in -next 
just in case there are any lurking regressions on particular platforms.

I don't expect anyone to base decisions on my aspirations above but 
would like to reassure Russell that I haven't given up on it.


Daniel.
