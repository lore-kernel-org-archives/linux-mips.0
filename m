Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5763641D105
	for <linux-mips@vger.kernel.org>; Sat, 26 Sep 2026 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419324; cv=none; b=ZA+nt1YTccj48t1SLFWJMnF1gxl+S6wXRzBKO1fUc2ICVsWt14YhVVV6nBgTUmNBih55bJwNrTVFU7MCjNg+92YGsFux9ubgWAG5kM2403J2ekr/fU+BtKiprvfBxaYuBJyJ7vAUKdsN/8aOkrKB8nufF2L4KkJmjNr4/4LuGdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419324; c=relaxed/simple;
	bh=F2TE+Tzza+PHc/UwSExLmYh0uASAFT6uZwQEhVWsGMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk2roCcF+hJm39v4yOXdkz/FLAdQp+jjLoqYf0mHUGTMKuWe6fNvpZdU8PCtlI3PRCYNbzMZpUdroLMELQFepOjxGvr5+zbzYaqmCFgW8U/KYWpKyWI34wdTuqYQrWUu5klfbugvUcZIEWLvmLNl97o9/htKShSpK3iIu8RgAYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4P-0007LX-00; Sat, 26 Sep 2026 11:51:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B3CAFC0CEE; Sat, 26 Sep 2026 11:38:26 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:38:26 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: remove unused <asm/mips-boards/sead3-addr.h> header
Message-ID: <areSkrgM1FDjlK_w@alpha.franken.de>
References: <20260918030041.397914-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918030041.397914-1-enelsonmoore@gmail.com>

On Thu, Sep 17, 2026 at 08:00:35PM -0700, Ethan Nelson-Moore wrote:
> The last use of arch/mips/include/asm/mips-boards/sead3-addr.h was
> removed in commit 64601cb1343f ("leds: Remove SEAD-3 driver") but it
> was left behind. Remove it.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  .../mips/include/asm/mips-boards/sead3-addr.h | 83 -------------------
>  1 file changed, 83 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mips-boards/sead3-addr.h

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
