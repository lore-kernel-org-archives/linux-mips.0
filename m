Received: from mail-pz0-f197.google.com ([209.85.222.197]:46156 "EHLO
        mail-pz0-f197.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493100Ab0ACRSx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 3 Jan 2010 18:18:53 +0100
MIME-Version: 1.0
In-Reply-To: <20100103171013.GC21156@n2100.arm.linux.org.uk>
References: <daef60381001030705r93b3fbfkc50e7b9bbc62b334@mail.gmail.com>
        <20100103160313.GA21156@n2100.arm.linux.org.uk> <daef60381001030830u176c0cfavbb31358a2b42ed60@mail.gmail.com>
        <20100103164414.GB21156@n2100.arm.linux.org.uk> <daef60381001030855o3a39c3fdr879e2634fb85c491@mail.gmail.com>
        <20100103171013.GC21156@n2100.arm.linux.org.uk>
From: Hui Zhu <teawater@gmail.com>
Date: Mon, 4 Jan 2010 01:18:25 +0800
Message-ID: <daef60381001030918r26658a26l52133d43d4342a16@mail.gmail.com>
Subject: Re: [PATCH] stack2core: show stack message and convert it to core
        file when kernel die
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: saeed bishara <saeed.bishara@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Nicolas Pitre <nico@fluxnic.net>, Ralf Baechle <ralf@linux-mips.org>, David Daney <ddaney@caviumnetworks.com>, Tomaso Paoletti <tpaoletti@caviumnetworks.com>, Chris Dearman <chris@mips.com>, Paul Gortmaker <Paul.Gortmaker@windriver.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>, Brian Gerst <brgerst@gmail.com>, Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@suse.de>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Coly Li <coly.li@suse.de>
Message-ID: <20100103171825.M_nAV34bjl9yArEkEjNbiqSYdjEbYIGWZauqECimNfM@z>

Sorry I make a mistake, I sent the mail before I complete it.  Maybe
some hotkey or something.

The s2c can get the message from the current panic message is better.
I am not get them for now, maybe it need open some options or
something.

Thanks,
Hui

On Mon, Jan 4, 2010 at 01:10, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Mon, Jan 04, 2010 at 12:55:04AM +0800, Hui Zhu wrote:
>> I didn't give the user raw oopses.
>> I give him core file. When the kernel die, do we can get a core file now?
>
> I think there's a communication issue here... clearly you're not
> understanding what I've been trying to tell you.
>
> I don't think I can help you any further.
>
