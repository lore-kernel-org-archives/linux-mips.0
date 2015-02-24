Received: from mail-wg0-f52.google.com ([74.125.82.52]:34974 "EHLO
        mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27006864AbbBXHjO0V0YT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Feb 2015 08:39:14 +0100
Received: by wggz12 with SMTP id z12so3448747wgg.2
        for <linux-mips@linux-mips.org>; Mon, 23 Feb 2015 23:39:09 -0800 (PST)
Date: Tue, 24 Feb 2015 08:39:06 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] Fix offset2lib issue for x86*, ARM*, PowerPC and MIPS
Message-ID: <20150224073906.GA16422@gmail.com>
References: <54EB735F.5030207@upv.es>
 <CAGXu5j+SBRcj+BGyxEwUzgKsB2fdzNiPY37Q=JTsf=-QbGwoGA@mail.gmail.com>
 <20150223205436.15133mg1kpyojyik@webmail.upv.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150223205436.15133mg1kpyojyik@webmail.upv.es>
Return-Path: <mingo.kernel.org@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Hector Marco Gisbert <hecmargi@upv.es>
Cc: Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, ismael Ripoll <iripoll@upv.es>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linuxppc-dev@lists.ozlabs.org
Message-ID: <20150224073906.__JxfHYUH2IOxkjJJxZS98LbB2HikTO9acNse89jTEA@z>


* Hector Marco Gisbert <hecmargi@upv.es> wrote:

> +unsigned long randomize_et_dyn(unsigned long base)
> +{
> +	unsigned long ret;
> +	if ((current->personality & ADDR_NO_RANDOMIZE) ||
> +		!(current->flags & PF_RANDOMIZE))
> +		return base;
> +	ret = base + mmap_rnd();
> +	return (ret > base) ? ret : base;
> +}

> +unsigned long randomize_et_dyn(unsigned long base)
> +{
> +	unsigned long ret;
> +	if ((current->personality & ADDR_NO_RANDOMIZE) ||
> +		!(current->flags & PF_RANDOMIZE))
> +		return base;
> +	ret = base + mmap_rnd();
> +	return (ret > base) ? ret : base;
> +}

> +unsigned long randomize_et_dyn(unsigned long base)
> +{
> +	unsigned long ret;
> +	if ((current->personality & ADDR_NO_RANDOMIZE) ||
> +		!(current->flags & PF_RANDOMIZE))
> +		return base;
> +	ret = base + brk_rnd();
> +	return (ret > base) ? ret : base;
> +}

> +unsigned long randomize_et_dyn(unsigned long base)
> +{
> +	unsigned long ret;
> +	if ((current->personality & ADDR_NO_RANDOMIZE) ||
> +		!(current->flags & PF_RANDOMIZE))
> +		return base;
> +	ret = base + mmap_rnd();
> +	return (ret > base) ? ret : base;
> +}

> +unsigned long randomize_et_dyn(unsigned long base)
> +{
> +	unsigned long ret;
> +	if ((current->personality & ADDR_NO_RANDOMIZE) ||
> +		!(current->flags & PF_RANDOMIZE))
> +		return base;
> +	ret = base + mmap_rnd();
> +	return (ret > base) ? ret : base;
> +}

That pointless repetition should be avoided.

Thanks,

	Ingo
