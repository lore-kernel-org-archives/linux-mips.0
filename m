Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698873672AE
	for <linux-mips@vger.kernel.org>; Sat, 26 Sep 2026 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419338; cv=none; b=NeQq/AspCLClMpKd0tPw7yUXbA0WYYXlc45oDHUKLnsyolHYb4Pdjn7VzO3oB+SAeU8ans0NjbL5QAHJyhZ1svZJK2F0m1OBun2r9UIsH56Kf02Ui7cwK4KQ23U0TERbNY+21Wk4QgDpiHJCMNpTcQlu5W8dy0l6vqI+Oi+YmI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419338; c=relaxed/simple;
	bh=iThLZhKXBJ9UbcxYdAZnD42yIju7+FsmlOGCUXVB1bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIkAz5WICoAiQn2NOCB4dL+pW5XEkpLg7C5XxxA3sSXMA+T5FGroK0HwIWS3zBbfOZzjDG7E5HyJim9Kb9W0AQr+3Kt1mieyV/qvHwTsP7NM3OuiKnXASCpE8laYIh4WU/x5Zg1gHjYkqw20GPGY6Z3sxbK0EWX/U5+0tK1hE6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4P-0007Lb-00; Sat, 26 Sep 2026 11:51:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 403A1C0D12; Sat, 26 Sep 2026 11:39:53 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:39:53 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: sibyte: remove several unused headers
Message-ID: <areS6cdgsL6UJqUH@alpha.franken.de>
References: <20260918035850.568217-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918035850.568217-1-enelsonmoore@gmail.com>

On Thu, Sep 17, 2026 at 08:58:25PM -0700, Ethan Nelson-Moore wrote:
> arch/mips/include/asm/sibyte contains several unused headers with
> SB1250 and BCM1480 register definitions. Remove them.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/mips/include/asm/sibyte/bcm1480_l2c.h    | 163 ---
>  arch/mips/include/asm/sibyte/bcm1480_mc.h     | 971 ------------------
>  arch/mips/include/asm/sibyte/sb1250_l2c.h     | 118 ---
>  arch/mips/include/asm/sibyte/sb1250_ldt.h     | 409 --------
>  arch/mips/include/asm/sibyte/sb1250_mc.h      | 537 ----------
>  arch/mips/include/asm/sibyte/sb1250_syncser.h | 133 ---
>  6 files changed, 2331 deletions(-)
>  delete mode 100644 arch/mips/include/asm/sibyte/bcm1480_l2c.h
>  delete mode 100644 arch/mips/include/asm/sibyte/bcm1480_mc.h
>  delete mode 100644 arch/mips/include/asm/sibyte/sb1250_l2c.h
>  delete mode 100644 arch/mips/include/asm/sibyte/sb1250_ldt.h
>  delete mode 100644 arch/mips/include/asm/sibyte/sb1250_mc.h
>  delete mode 100644 arch/mips/include/asm/sibyte/sb1250_syncser.h

while they are unused at the moment, they contain hardware information
otherwise not available in public. So I'm not applying this patch.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
