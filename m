Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E53395AF2;
	Sat, 26 Sep 2026 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418474; cv=none; b=pk+Hxm9hLjDS/3Bpuyk69PS9yyGit+V7tssIrWbw/cnK3uslxLj9Uayvp+wrM1RTxgcXB89wZA/rELegeFBGcPfvCO1BP8wwDcL37VokoOS9NKzT90ZjnJWYYDe6FQ+EiNLqdBaldhUiuWMcr12AkXkE7X65kR8n4HX24Jzzd7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418474; c=relaxed/simple;
	bh=X542uY2+AUo37lQStTTPHAiOVR27PiNxmZy5HjlDeA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKJ7LF5qrIIkxt9LGXJ1ln83XOJzvt4XQMABmNzSb6rYwjxT9BABD5HO/iNcLa8fYjyG9jB6jGt8aAiVhHee1caZwlGK7PdfcWdI3fr0Af5McEs1I0U+rwMlTgz+fiaEHUU3njZjY2XHXOge9YE383EK+uVgPud2dppFydM4HSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007LR-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 1B488C0C9E; Sat, 26 Sep 2026 11:37:50 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:37:50 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Octeon: offer the RedBoot parser when it is
 modular
Message-ID: <areSbrA71ZV-2yZY@alpha.franken.de>
References: <20260915081828.25800-1-orgads@gmail.com>
 <20260915081828.25800-2-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915081828.25800-2-orgads@gmail.com>

On Tue, Sep 15, 2026 at 08:18:25AM +0000, Orgad Shaneh wrote:
> The bootbus flash driver lists "RedBoot" among the partition parsers to
> try under "#ifdef CONFIG_MTD_REDBOOT_PARTS", so building that parser as
> a module drops it from the list and the partitions on such a chip are
> never found.
> 
> Use IS_ENABLED(), like the USB device-tree fixups in octeon-platform.c.
> 
> Untested - I have no board with RedBoot partitions; the change is by
> inspection, in the same family as the two above.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>
> ---
> diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
> --- a/arch/mips/cavium-octeon/flash_setup.c
> +++ b/arch/mips/cavium-octeon/flash_setup.c
> @@ -22,7 +22,7 @@ static struct map_info flash_map;
>  static struct mtd_info *mymtd;
>  static const char *part_probe_types[] = {
>  	"cmdlinepart",
> -#ifdef CONFIG_MTD_REDBOOT_PARTS
> +#if IS_ENABLED(CONFIG_MTD_REDBOOT_PARTS)
>  	"RedBoot",
>  #endif
>  	NULL
> -- 
> 2.47.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
