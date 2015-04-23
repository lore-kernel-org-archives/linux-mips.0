Received: from mailapp01.imgtec.com ([195.59.15.196]:57084 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010711AbbDWH7If8FqW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Apr 2015 09:59:08 +0200
Message-ID: <5538A647.10009@imgtec.com>
Date: Thu, 23 Apr 2015 08:59:03 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [RFC] MIPS: Prevent "BUG: using smp_processor_id() in preemptible..."
 errors
References: <20150422172359.GA20553@paulmartin.codethink.co.uk>
In-Reply-To: <20150422172359.GA20553@paulmartin.codethink.co.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>
Message-ID: <20150423075903.BZvlKO0JvHWt--6DXGZExxDpaNZ43CDDr0hgenQOHm8@z>

Hi,

On 04/22/2015 06:24 PM, Paul Martin wrote:
> Commit 9b26616c8d9dae53fbac7f7cb2c6dd1308102976 "MIPS: Respect the ISA
> level in FCSR handling" added references to current_cpu_data, which is
> a macro expanding to cpu_data[smp_processor_id()].  Change these to
> raw_current_cpu_data.
> 
> These changes may or may not be a good idea.
> 
> There may also be a need for a similar change in
> arch/mips/kernel/ptrace.c which I haven't made.
> 

(^^^ missed your SOB line here? But since this RFC that might have been
intentional)

> ---
>  arch/mips/include/asm/elf.h | 4 ++--
>  arch/mips/math-emu/cp1emu.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
> index a594d8e..63f3bbc 100644
> --- a/arch/mips/include/asm/elf.h
> +++ b/arch/mips/include/asm/elf.h
> @@ -304,7 +304,7 @@ do {									\
>  									\
>  	current->thread.abi = &mips_abi;				\
>  									\
> -	current->thread.fpu.fcr31 = current_cpu_data.fpu_csr31;		\
> +	current->thread.fpu.fcr31 = raw_current_cpu_data.fpu_csr31;	\

The change looks sensible. I am wondering if
boot_cpu_data(==cpu_data[0]) is a better option though.

I leave that to Maciej.

-- 
markos
