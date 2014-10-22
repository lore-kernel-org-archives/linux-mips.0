Received: from mailapp01.imgtec.com ([195.59.15.196]:8049 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012176AbaJVWWYNSm8E (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Oct 2014 00:22:24 +0200
Date: Wed, 22 Oct 2014 23:22:16 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] mips: add arch_trigger_all_cpu_backtrace() function
Message-ID: <20141022222216.GD12296@jhogan-linux.le.imgtec.org>
References: <1669712409.167661413959996217.JavaMail.weblogic@epmlwas02b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1669712409.167661413959996217.JavaMail.weblogic@epmlwas02b>
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Eunbong Song <eunb.song@samsung.com>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20141022222216.oRd-7wGyQP6Aq9rsNhD2IAHJHeo9OJCTR3F1WlpsZGM@z>

On Wed, Oct 22, 2014 at 06:39:56AM +0000, Eunbong Song wrote:
> This patch adds arch_trigger_all_cpu_backtrace() for mips architecture.

Don't forget your Signed-off-by

> +static void arch_dump_stack(void *info)
> +{
> +	struct pt_regs *regs;  
> +	
> +	regs = get_irq_regs();
> +
> +	if(regs)
> +		show_regs(regs);
> +
> +	dump_stack();
> +}
> +
> +void arch_trigger_all_cpu_backtrace(bool include_self)
> +{
> +	smp_call_function(arch_dump_stack, NULL, 1);

should this call arch_dump_stack directly too if include_self?

Cheers
James
