Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF7E363C6B;
	Tue, 23 Jun 2026 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225987; cv=none; b=TGtiLuQBwcJnW+nGL6xX5Bzcht2vKzAIvpleIQIBqLuBrNTuX6gUEHfHeRzUC/T1tqRJM6LaGRGVGjXTfXSzNkz4fAR+8yEh9kkx7A7mF3e5Gq/77ivBuIVAg7bFFGHWSVUyafHkWA47F5wSLFgBOtnSWx0OdFRyuavzyfSwPgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225987; c=relaxed/simple;
	bh=OxkK1z+xWbkxXuAzONXcUIzcOp0u1A+Z+7OOe3jTQck=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sWIfxJecSH83NIs0NThMvgCQN/Np4UtYaI4dRfGWjQtxKcG3xbXdOwkIk3EUxhXx8K4QfWta6GFC5AQvwqWhcZ5Rt8xA4EmiFt+/Q8jp4P0LUlJcKTRqy7A7XfS5j0kTdgSRApH5S25KwzwjqwIr5HXnwp8msCyxfRZXnqvaFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 934AA92009C; Tue, 23 Jun 2026 16:39:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 90B7F92009B;
	Tue, 23 Jun 2026 15:39:57 +0100 (BST)
Date: Tue, 23 Jun 2026 15:39:57 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@aosc.io>
cc: guanwentao@uniontech.com, linux-kernel@vger.kernel.org, 
    linux-mips@vger.kernel.org, niecheng1@uniontech.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, wangyuli@uniontech.com, 
    zhanjun@uniontech.com
Subject: Re: Gentle ping: [PATCH v2 0/6] MIPS: Resolve build problems on
 decstation_64
In-Reply-To: <20260623132631.480565-1-wangyuli@aosc.io>
Message-ID: <alpine.DEB.2.21.2606231518110.58268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2507071545400.56608@angie.orcam.me.uk> <20260623132631.480565-1-wangyuli@aosc.io>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi WangYuli,

> I happened to notice that part of this patch series appears to have made
> its way upstream via a separate submission, with you listed as the
> author, and has since been picked up by Thomas.
> 
> Link: https://lore.kernel.org/all/ahWx0vtGim1VlHc7@alpha.franken.de/
> 
> That was, I have to say, a rather unexpected way for those patches to
> make progress. Since you have already found time to handle that part of

 Aww, I have duplicated your effort it would seem and came up with an 
almost identical change (which sort of proves the obviousness), which I 
needed to make my life easier with the verification of the serial driver 
fixes I have recently made to make the platform usable again.

 My apologies to appear unfair to you.  Sadly I have lost track of your 
submission (which has sat in my inbox along with other 20k+ old messages) 
and genuinely wrote this stuff from scratch.

 Your addition of:

#include <linux/interrupt.h>

to arch/mips/include/asm/dec/reset.h is still in principle required for 
the `irqreturn_t' data type to be directly pulled, as pointed out by AI 
review, so it's a good opportunity to have it applied on top.

> the series, I would be grateful if you could also review the remaining
> patches, which fix the build failures triggered by using clang together
> with -Werror.

 I'm coming back after a fortnight away on holiday and still catching up, 
but will get back to your patches ASAP now that I'm back in business with 
this DEC stuff.  Sadly one machine's PSU has fried in the course of final 
verification of serial driver fix backports, so I'll have to set some time 
aside in July to get the unit (hopefully) repaired.

 Please ping again if I don't come back by mid July.  Thank you for your 
patience and understanding.

  Maciej
