Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702BB4315A;
	Wed,  2 Sep 2026 01:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788312235; cv=none; b=XAdQgJkQRmscT6qts/zEn2/zq+cciOFvuxhpF0jLUYiuBLFm4y6hiZ2OV1EMvHNKVnPsH0QI4JelD2c6fWzwX6fgWSpZ1qMAvXMeaftGDW+e8qLBYJWQt0u/GSXVVt0VAz2N63f4AgvFePtz4kniCrn52XKmHv8quL6/U04m7+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788312235; c=relaxed/simple;
	bh=KWOXKNuOAxjJEunoUnMYIvsSO+KEoVVNjdyFAg+Ssi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cD0ApStxANE24hR7LMC14PudmImMxAOk9WjHjFoZ3G9MmhZ7AMrNDJcTpI8iKOpWuuQX2MLllqD/Y2kNAWPkP2g/DjCK1aOEjgKQqlVnjg9GPvJnlfy5hcik4Pmp2pqX8RqyH+et5+p685Vp4yXngEgsm/xXFEenGbo7Tf5q69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=iGjFPCAF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="iGjFPCAF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4B3B340E02C2;
	Wed,  2 Sep 2026 01:23:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id f-AG5n7Z_ETx; Wed,  2 Sep 2026 01:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788312221; bh=DvjfH0WJCA0AHVu8mE0AWync93ugHMTiexrTJdxyEtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGjFPCAF1Wf0YkQF7ORxCxUJAtUjCktkCMVeNmVkwWkOzzjvnCopskwm380HGt5K8
	 1eEY9yHN+bUNT2AS9mZutyStaHoF8+/8O0VJLC6HVoN1kr9eIT4i9ArjIxVwqDO8So
	 dK6Jwv5FO+XNlk9RMwD9MPfowcD4uTZoPZD5UP+aRMdBMl9KKjS6NVdxE3StG7VFff
	 raB37HxMQouCUAGPykNTeOk7Af0OBhUm7Elo4KL0njJoz7svlGmvYXEYpU8bSNGxvP
	 TE1kbdqZLfvtEZsEzEcH6RGC4CdUlLUm0QmzhDck2eFhKOqfElq+wBbbTd4gCEqytf
	 S/30U40tzYus3csnhlRJATSbkRqbJJpAig1p3JtZWVNmuCwV21915hYxrLihuAMQhq
	 lPaV4jxzuveFIvX13tt0LUJN5KtRrA9pHTlX8CXauklOQLwg7ObbujktjHZ62rQXPw
	 CfVgl7lMQblI5FY+8hQrEU9zc40ULn4tGXVGeR9FkIAjfPGj65q08Z4yWhvX3u5I/r
	 ng2kCWqmRIaSxfz6GOmHlsD8R6stw3EkW0M5OVqzJ6LxYv5EfYa1BZqSDsKM7yRVV3
	 5ldHW0hTJyzSQhhiDwOBNR0nwXbHFnLR167qiVYInbqDSnyd4OhLBPlW/skNiKrGL2
	 +ysl/1Lwi5clCr6y2Y+h1YF0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9B12F40E024B;
	Wed,  2 Sep 2026 01:23:34 +0000 (UTC)
Date: Tue, 1 Sep 2026 18:23:31 -0700
From: Borislav Petkov <bp@alien8.de>
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/octeon: fix kernel-doc comment for
 co_cache_error_event
Message-ID: <20260902012331.GEapd6k7g1DZxILLVW@fat_crate.local>
References: <20260821233751.2331272-1-hanzhijian1991@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821233751.2331272-1-hanzhijian1991@gmail.com>

On Sat, Aug 22, 2026 at 07:37:51AM +0800, hanzhijian wrote:
> The comment for co_cache_error_event() starts with "/**" but lacks the
> function name line, so scripts/kernel-doc reports "isn't a kernel-doc
> comment" and it is silently dropped from the generated documentation.
> 
> Add the missing name line and document the parameters.
> 
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

I'm presuming your legal name is "Zhijian Han"?

Because you should use your proper legal name when you sign off on patches.
You don't have to send a new version - I can fix it up when applying.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
