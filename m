Received: from casper.infradead.org ([85.118.1.10]:60437 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1493101Ab0ACRYU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 3 Jan 2010 18:24:20 +0100
Date: Sun, 3 Jan 2010 09:26:08 -0800
From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: [PATCH] stack2core: show stack message and convert it to core
 file when kernel die
Message-ID: <20100103092608.0a04c664@infradead.org>
In-Reply-To: <daef60381001030855o3a39c3fdr879e2634fb85c491@mail.gmail.com>
References: <daef60381001030705r93b3fbfkc50e7b9bbc62b334@mail.gmail.com>
        <20100103160313.GA21156@n2100.arm.linux.org.uk>
        <daef60381001030830u176c0cfavbb31358a2b42ed60@mail.gmail.com>
        <20100103164414.GB21156@n2100.arm.linux.org.uk>
        <daef60381001030855o3a39c3fdr879e2634fb85c491@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Hui Zhu <teawater@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, saeed bishara <saeed.bishara@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Nicolas Pitre <nico@fluxnic.net>, Ralf Baechle <ralf@linux-mips.org>, David Daney <ddaney@caviumnetworks.com>, Tomaso Paoletti <tpaoletti@caviumnetworks.com>, Chris Dearman <chris@mips.com>, Paul Gortmaker <Paul.Gortmaker@windriver.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>, Brian Gerst <brgerst@gmail.com>, Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@suse.de>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Coly Li <coly.li@suse.de>
Message-ID: <20100103172608.m8p3RcwqnVUwJowEiIY8BjTNZ_kffJn8eiFj-uSgKkU@z>

On Mon, 4 Jan 2010 00:55:04 +0800
Hui Zhu <teawater@gmail.com> wrote:
> 
> It show which line make kernel die.
> 

similar to scripts/markup_oops.pl already does ?


-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
