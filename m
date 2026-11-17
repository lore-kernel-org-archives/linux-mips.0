Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932886;
	b=10qKXQL4YdTIEBtdMCbGGOjPNdaiFCKVaz2pghChpo8aXKYtm2GTyMdtOIPl1lOlzJ1f
	 1CPN0krHlbOcd7Wnsbs7j2sGT3Sh+38RQlGwW+SCMh6Jqx44lKiI67vjvVPiaBCnay/3m
	 bHzOAglrXOgBVQR7Zo30H8jOU7G/JN6MWMVrteLUP0pRdyqLOnIUcfgfqrsEsLcYcxHWn
	 5ZWsS9lrlHEDVVvPFGVBrvuQPjRqd3nqtOWjjrEuYpPXqgGhrK53TZJvL2czot19DsvI5
	 GrCKokTTXmFRSER8rLKKLlaBzsjaDgsZ1lwtCUIaduxQndyPqe+pR6xS92X8u9evjQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932886;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BZR6sTyUIFu+KbgR3RNN3rHjb6ViVVFg38WZJ09msGQ=;
	b=WH8kEyWCOzQJEAUC9EE1VwpiX93pytD0PRTQhb18J3+tonhQ7hpNQc22xQpdSN9n9TD8
	 bRdKAI2OUofCBkfkzbmX6KaeohVn9pOxTeGP3tHYs2kHz0VIhivE4iIELJDT1BBLqcpq0
	 FU5cLkolyDA7l9lDVpeG5BIRoaa00A6m7n/6rkF7ZIn8AeErr6zQxmfLS2CX9tDOsDg2f
	 pPumXmDwD7YLNMsqCE+ymyjKMhu7kMIxPPe8PTWpCjNei5OaFoLCu1ZMBjKVxyq1fyd2I
	 BWnBhrmv7qhrZRlxTXO/gSNQ0zo1Z1RSRM/0zrDc9okW5+crBMHShH4Gknvy5S8c9Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579EB606A330;
	Tue, 17 Nov 2026 16:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 579EB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTM2N-0004s7-00; Tue, 17 Nov 2026 17:28:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7EC8BC0520; Tue, 17 Nov 2026 17:10:42 +0100 (CET)
Date: Tue, 17 Nov 2026 17:10:42 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, Hemanth Selam <hemanth.selam@gmail.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mips: n64: Clean up platform initialization
Message-ID: <avx8gnAvegdcse1u@alpha.franken.de>
References: <20261029212343.110095-6-blum@kernel.org>
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
In-Reply-To: <20261029212343.110095-6-blum@kernel.org>

On Thu, Oct 29, 2026 at 10:23:43PM +0100, Thorsten Blum wrote:
> Clean up and simplify the Nintendo 64 initialization code.
> 
> Thorsten Blum (4):
>   mips: n64: Use DEFINE_RES_*() helpers
>   mips: n64: Simplify framebuffer allocation
>   mips: n64: Rename the video interface register helper
>   mips: n64: Use SZ_8M in plat_mem_setup()
> 
>  arch/mips/n64/init.c | 81 ++++++++++++++------------------------------
>  1 file changed, 26 insertions(+), 55 deletions(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
