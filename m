Received: from mailapp01.imgtec.com ([195.59.15.196]:36782 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6859943AbaG3RjZzemu0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 30 Jul 2014 19:39:25 +0200
Date: Wed, 30 Jul 2014 18:39:16 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH] MIPS: prevent user from setting FCSR cause bits
Message-ID: <20140730173916.GV30558@pburton-laptop>
References: <1406035281-693-1-git-send-email-paul.burton@imgtec.com>
 <20140730173446.GB27790@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20140730173446.GB27790@linux-mips.org>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20140730173916.2RgXUS4nbtNcKj8Wi7diZo41F-9m8k6WdFINW52VFI0@z>

On Wed, Jul 30, 2014 at 07:34:47PM +0200, Ralf Baechle wrote:
> On Tue, Jul 22, 2014 at 02:21:21PM +0100, Paul Burton wrote:
> 
> > If one or more matching FCSR cause & enable bits are set in saved thread
> > context then when that context is restored the kernel will take an FP
> > exception. This is of course undesirable and considered an oops, leading
> > to the kernel writing a backtrace to the console and potentially
> > rebooting depending upon the configuration. Thus the kernel avoids this
> > situation by clearing the cause bits of the FCSR register when handling
> > FP exceptions and after emulating FP instructions.
> > 
> > However the kernel does not prevent userland from setting arbitrary FCSR
> > cause & enable bits via ptrace, using either the PTRACE_POKEUSR or
> > PTRACE_SETFPREGS requests. This means userland can trivially cause the
> > kernel to oops on any system with an FPU. Prevent this from happening
> > by clearing the cause bits when writing to the saved FCSR context via
> > ptrace.
> > 
> > This problem appears to exist at least back to the beginning of the git
> > era in the PTRACE_POKEUSR case.
> 
> Good catch - but I think something like UML on a more proper fix.  How
> until then I'm going to apply this.
> 
>   Ralf

Any chance you could expand that acronym for me? Maybe I'm being slow
since neither of the expansions that spring to mind make much sense.

Thanks,
    Paul
