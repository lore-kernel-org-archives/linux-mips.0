Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967080;
	b=YnnhG7F/jqwJxwKTBTY4kAm7ugMUq12EUvvuvSXsy8c6+id5fPZiI6/SXatKgEypfNsY
	 Pu+W6j6nJcCRUWDb5WGktrKjrBudVau07WIJZmQXDfFi4OnTPIE9FqTJYKWH+Bvmxr/n/
	 nyP2KlZQEE6/1eW+uEYdM6QvDp6JMu9MYVqd3sSbSx8Q5BantVNV4xhbAs2iN69/uFaac
	 G4nZ9hdW+LTeYL7MKtzMPGwRy7e3vcR/VN3k4bmRGYYB91QWcG+63p/WGFHfvSACRnHmo
	 +JSLSny8Krq/HO3HVR55Q7TWQzRCDeXVYOEkMhGsNUtZQYD34sRWRPtQWcDNL63nR/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967080;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=cLz+hJwLg/RJu8aIH9wyoA7Z4B5/aGJ+PCk94TYhssM=;
	b=SOJokIMQJpPOYsTSqIwkpaJrBgVak3N82Z897t88U60ulu9xAmoYFt2FVdG+5bmKooPV
	 HiJAMtVg4lpXRpTVCUahCPKA1kr+Uk54hZnargcjEXxH1RkTnfuiemqLNDdCn13JMcOKO
	 ziCy7OX2yMduZcYuFEM9tkEH4vX+Sy/6h329hMukbBCA3Mw36w6KI0F21ZNfEaZKm7S9s
	 YLzOmuq4vv+N853Dk2Te3VnN8iKCFG5HOAvU+nSLRWt6fxL7K5knxen+ekATtUgcQaSae
	 qsnpi1Vd07WZZ4f0oVjZzw+wNRZNeW5P+ISXbJhIOntbffy/M/gb3mR+ov6R6lVD30A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15067606A31C;
	Wed, 18 Nov 2026 01:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15067606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CA2A992009D; Wed, 18 Nov 2026 02:57:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C6E5D92009B;
	Wed, 18 Nov 2026 01:57:50 +0000 (GMT)
Date: Wed, 18 Nov 2026 01:57:50 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: SiByte: Fix missing function prototypes
In-Reply-To: <20261113191933.477395-1-f.fainelli@gmail.com>
Message-ID: <alpine.DEB.2.21.2611180154490.54328@angie.orcam.me.uk>
References: <20261113191933.477395-1-f.fainelli@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Nov 2026, Florian Fainelli wrote:

> The SB1250 SWARM build reports missing prototypes for platform time
> initialization, SoC setup, IRQ and SMP helpers, and both RTC backends.

 Thank you for doing this.  I've meant to for a long time, but have been 
distracted with higher priority stuff.

>  static inline int __maybe_unused bcm1250_m3_war(void)
>  {
> -	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
> -		return sb1250_m3_workaround_needed();
> +#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
> +	return sb1250_m3_workaround_needed();
> +#else
>  	return 0;
> +#endif
>  }

 It seems a style regression, why is this change needed?

  Maciej
