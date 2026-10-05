Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF321400DE8;
	Mon,  5 Oct 2026 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189581; cv=none; b=joEy5IoNK9sX24VpLxKyRYlsp0os3+Q1sutdJFBFUo8BKKibBrG9cqIYcV0vdJpbmmG1SSIHSK3RvZBP78UslowNGYWDxH3VqximX84O7lQ8Y1s7JrOOiSu8pn2WzYk8SH0KLehyaTZol/19ZdZeYgbFfNSkqUMuF30n1DJcHwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189581; c=relaxed/simple;
	bh=g+Oo6kbYdXpTWrgAqiIP43Ul0a+nwIHetvB/s/2gGs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5of7RODT8SVQS+oglqx0xpLxAyMYywl4Id2lMtyG4nUKgw8KJUkqldA2pU5x/QmSc6/Y8LaPWMw1vYuRmCTeyPf4nalN0/zpd1FlF+a7gYIRazUjPkYdRkyBEHUkmnHg/lNfK2aS5l0t72vDpwu2sPjXLulv1gz2lT/CrcVgg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Xn1etKoT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xn1etKoT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8YAheal/bOJc18SMan7lnG9SW9YRTAdQQ//1cWA65q0=; b=Xn1etKoT/4y6enwBaTM8hDjAt7
	UrW1RCRlTcUMc8P++S3bg2zlJG6tY7lWy4dOhPT5pClu8FhAQMyoSsRiQOVjArO3/u7HdwcPCvNB3
	KhQyxVDEq5NXZrbbviFAjhuyeCwfSDG0m89rSgWfCV/gfppJTeREKi+QLPhlit/LlEq1Xq6k8AOBK
	tpUo+EWb1zLbUpzXc1ne7cEo37CQJ8LLN02BXSCS3mwYQb07WyZm+oLGZUPMdK21US5x1stqn4ks6
	bRh/IK8INtSAlClWOEi/65hZyOFoe6Gl9bNgryLImAb9YkbKSr7EvKU1BKhwcXTurDALFMlaJ3+Tl
	8Wht0uVQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeEQ-0000000FuGG-0C32;
	Mon, 05 Oct 2026 08:39:34 +0000
Date: Mon, 5 Oct 2026 01:39:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Imre Kaloz <kaloz@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/38] MIPS: SGI-IP27: route XBridge and PIC DMA through
 the 32-bit window
Message-ID: <asNiRoPpv6dkAFD4@infradead.org>
References: <cover.1790857966.git.kaloz@kernel.org>
 <cce203c61386970826873f87cc9d0e6c732c3a53.1790857966.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cce203c61386970826873f87cc9d0e6c732c3a53.1790857966.git.kaloz@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Oct 01, 2026 at 06:11:56PM +0200, Imre Kaloz wrote:
> XBridge does not honour the SN0-style 64-bit direct-mapped DMA address:
> commands complete but no data moves. PIC moves no data either. Route
> both through the 2GB 32-bit window and cap bus_dma_limit at its top, so
> SWIOTLB bounces anything above it. PIC is flagged once a following
> patch enumerates it.
> 
> Only XBridge (part 0xd002) is flagged; a Bridge (0xc002) behind a Hub
> keeps the 64-bit direct map. The 64MB bounce pool comes from node 0
> whenever DRAM passes 2GB, on Hub any multi-node machine. A PIC bus in
> PCI-X mode takes the window too; IRIX does not.

It's been a while, but IIRC XBridge also support 64-bit direct-mapped
DMA addresses, just differently.

If you find a late 2.4 or early 2.6 kernel, it comes with an open source
copy of the IRIX-style PCI code under arch/ia64/ that also includes the
older chips never used on Altix.  It might be worth to take a look at
that for clues.
