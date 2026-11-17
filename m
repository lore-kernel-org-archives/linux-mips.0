Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934984;
	b=KLA8Wggz9Lg7mwxL6UjshAjX1ZiTj/rGBSGLdUDy+7JiWQFWjkxetxkCrxTAtMLZF2io
	 riw7pCjF1+LrBtbttYh9YO1DlJRGUVJcH6F4Z+VMHtWenfOOaLnvo4+epgbJwiwllpngw
	 Kf3C8wtsKoqXM6zm02BFiUkhddExV0Rpw4FJ0PsWCjCMTMoPbycmxXGtpkEsnHHGv7wX4
	 eK+mRCR+X79UrAjl7mcRzoqZ2RmTNMrqv54MtKsfNxdXtXSUuXjwwrtrQZKCHFZR5Hysx
	 ZsZcZOskta/rjmPryAkTRogayej9ExR+vLGSaFE2JggTFanozuzJK6RsNWnfDwuWQvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934984;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X54A0VdAIdeF8wwEbkYLU1VApz9QjgIgfm0tz895t40=;
	b=F4mgj8yx0g4sWHe9udxipQbl3N03WmI/cCHVWWeUYP1knCFVoyH0oZio9tmJ9jqhjbLq
	 T/1v5xJ4eKOhRi9yXwcDoPmP1TQZxwdo98vCmEedROeO5iImj7KR404hLYJ0BrqhwMoBM
	 kKdF3iQ2klMR3n69UvOA301ZUn0rS6kUJBQGhoM6Xuznp4gKKTMNTbuhffqvscWRI+RvN
	 Z3PIO2XNcM+udDM28K/WZlnyff7dvTOMlzKLVdXqpIOwo0jXq81/5VTf/CXhJvq4PatIg
	 xc5Qf8BCPJ+1WfiJ42wCJn8pBrHjY/BpEmTXwJ7VHEllDvGjq/2As9Gu86H9H7ltPrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48211606A330;
	Tue, 17 Nov 2026 17:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48211606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTMaC-0005GH-00; Tue, 17 Nov 2026 18:03:00 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A3476C01A0; Tue, 17 Nov 2026 17:55:56 +0100 (CET)
Date: Tue, 17 Nov 2026 17:55:56 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] MIPS: sgi-ip32: Clear latched CRIME errors at boot
Message-ID: <avyHHHEjSpmUDEa2@alpha.franken.de>
References: <20261013094554.16804-1-kaloz@kernel.org>
 <20261013094554.16804-2-kaloz@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013094554.16804-2-kaloz@kernel.org>

On Tue, Oct 13, 2026 at 11:45:52AM +0200, Imre Kaloz wrote:
> Errors already latched in CRIME when the kernel starts are reported as
> new, as a "CRIME memory error" or a "CRIME CPU error", once the error
> interrupts are enabled. Clear both status registers in crime_init().
> 
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
> ---
>  arch/mips/sgi-ip32/crime.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/mips/sgi-ip32/crime.c b/arch/mips/sgi-ip32/crime.c
> index b8a0e4cfa9ce..d9f5fe939bfe 100644
> --- a/arch/mips/sgi-ip32/crime.c
> +++ b/arch/mips/sgi-ip32/crime.c
> @@ -34,6 +34,10 @@ void __init crime_init(void)
>  	crime = ioremap(CRIME_BASE, sizeof(struct sgi_crime));
>  	mace = ioremap(MACE_BASE, sizeof(struct sgi_mace));
>  
> +	/* Errors latched before the kernel starts would be reported as new */
> +	crime->mem_error_stat = 0;
> +	crime->cpu_error_stat = 0;
> +
>  	id = crime->id;
>  	rev = id & CRIME_ID_REV;
>  	id = (id & CRIME_ID_IDBITS) >> 4;
> -- 
> 2.47.3

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
