Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38397471CE1;
	Fri, 18 Sep 2026 20:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764625; cv=none; b=Drvo0BFdtJL4nyy+/woBPHLIWGXRPsV2/BAAe6RnOQxJUUf/X/VXdAxVi8MWTqcWjVy/lnbFRdiwKItVPHahmtb0l3e69w3GA00YJyzt+Oa3O1uwsIp/4QJ7QrrBUz+lWH7oqK3BUdgvWMxLoDfDsnyURl7zPeRZQD7gcsK8j1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764625; c=relaxed/simple;
	bh=R1NtC5lchfgyPlaBjuFMvS/9OeEp/0zoPHG1Z4EcnHo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rDhsd7k4CI1i3vTddAN+kjMHw4DE0QS7KWckAhKQMY4S4iwKFtrT7POKu7syFqroiSbBSJjJLH99gjinfpfXe8hEWrkGCkQd1Q2jUMLkYuOH+dZivtIFqy2grjPa/1Gmg8rKEXCqpnighTfpRAtUgMubv+r9JswiECujwx64/SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9DAB192009C; Fri, 18 Sep 2026 22:50:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 96C4092009B;
	Fri, 18 Sep 2026 21:50:21 +0100 (BST)
Date: Fri, 18 Sep 2026 21:50:21 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: guanwentao@uniontech.com, linux-kernel@vger.kernel.org, 
    linux-mips@vger.kernel.org, niecheng1@uniontech.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, zhanjun@uniontech.com, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 3/6] MIPS: dec: Create reset.h
In-Reply-To: <3AD7E5DDE3F05C6D+20250422102253.137944-3-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2609182143320.57799@angie.orcam.me.uk>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com> <3AD7E5DDE3F05C6D+20250422102253.137944-3-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Apr 2025, WangYuli wrote:

> Declare externally used functions in reset.c to resolve compilation
> warnings.

 OK, so I got this sorted independently with commit 0eb77376912e ("MIPS: 
DEC: Fix prototypes for halt/reset handlers").  However there are a couple 
of bits here that I encourage you to resubmit.

> In passing, also correct the include file ordering in setup.c as it
> doesn't merit a separate commit.

 Specifically this stuff, i.e.:

> diff --git a/arch/mips/dec/setup.c b/arch/mips/dec/setup.c
> index 87f0a1436bf9..6b100c7d0633 100644
> --- a/arch/mips/dec/setup.c
> +++ b/arch/mips/dec/setup.c
> @@ -18,10 +18,10 @@
>  #include <linux/memblock.h>
>  #include <linux/param.h>
>  #include <linux/percpu-defs.h>
> +#include <linux/pm.h>
>  #include <linux/sched.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> -#include <linux/pm.h>
>  
>  #include <asm/addrspace.h>
>  #include <asm/bootinfo.h>

(please always submit one self-contained feature or fix per patch).

> diff --git a/arch/mips/include/asm/dec/reset.h b/arch/mips/include/asm/dec/reset.h
> new file mode 100644
> index 000000000000..c1557b88264c
> --- /dev/null
> +++ b/arch/mips/include/asm/dec/reset.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Reset a DECstation machine.
> + *
> + * File created to eliminate warnings; copyright from reset.c.
> + *
> + * Copyright (C) 199x  the Anonymous
> + * Copyright (C) 2001, 2002, 2003  Maciej W. Rozycki
> + */
> +
> +#ifndef __ASM_DEC_RESET_H
> +
> +#include <linux/interrupt.h>

 And then also this inclusion (in a separate patch).

  Maciej
