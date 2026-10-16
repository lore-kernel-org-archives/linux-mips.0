Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08F9270552;
	Fri, 16 Oct 2026 19:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179968; cv=none; b=jxlu0+HXejA1qUHLVQXRRFBPzzFVWWre06GFQF5WMw1yicfi+sz8V3qMEWXzhhpD2s7Sqs83uYXkUnrfYcxW+aI01Fdu6I2VBgz2zxi+XoCtJH0lTcXwKC+y3Cygq+DGXp7fggq8ICJOabrG9vZ9iB5SJM6qZyVuCRGZ4qplmuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179968; c=relaxed/simple;
	bh=dQ/qplgb8ismfZk+a7LlCJrPI6c6lTXg1E+xqCWlJWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMN54bLl8hoBW/Mm2JAvbcEBGeOc7L+dyFo22NbROTNjI+MkK7Ua8vFMnJEZ9iT9s4ZqHRf2dxWYHdwtzCOawNy6SdBbYnqVh644h9mtCzmowznxn4miwP/8DQHgUYGx91s4yeyZkltFrN759W2be7GWc0GGiypSvl6ADJf9d6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IMf2osrH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IMf2osrH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RM4tp6yC/xLvs8tesoN1ler9xX77r7IQWehCDi9+Rcs=; b=IMf2osrHq8Q3+sPkfSvObrPFR9
	zbQOiyfJNwbgnuNGuWeVAV2YJgrBMHeXxMdMj4TUJ0p3Tf2CNvIN+is02ORtne4tu48fdL01v5yeO
	VqBecIaAImUYmYF1Emc59ERE2+b6N0Fp3lYOc2k/QK1SR6zbnB+oyjdUIvqCnBn8kDtp0EtcQJk6W
	PuVy1Bt5/5CzkI5hImkPFaEx7RVgsFxuZ6M6TsIXMMlgInYW1/A+M0OcssVlB+y8AI+s356OP+9wi
	HnD+l8+wfKV6uyhoHH1dp1XjuSZVBnmv9G+H1RA3fWYxO+TWBXANy+0BTDs8/+5oWq/Gvn6SOv8RT
	iKwo4OXQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsI-00000007GNt-1KzW;
	Fri, 16 Oct 2026 19:45:54 +0000
Date: Fri, 16 Oct 2026 20:45:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, manuel.lauss@gmail.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Alchemy: Save the Ethernet address before reusing
 PROM memory
Message-ID: <atJ-8ttrdqhiRCp2@casper.infradead.org>
References: <20261016173157.2083454-1-f.fainelli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016173157.2083454-1-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 10:31:55AM -0700, Florian Fainelli wrote:
> Alchemy keeps pointers into the firmware environment and looks up ethaddr
> when initializing the Ethernet devices. By that point, memory allocation
> can have overwritten the environment, causing prom_getenv() to pass an
> invalid pointer to strchr() and panic during boot.
> 
> On the MTX-1, the struct page layout change in 9ddb3c14afba reduces struct
> page from 40 to 32 bytes and exposes this unreserved firmware memory.
> Bisection and boot tests confirmed that the parent boots while the change
> reproduces the panic.
> 
> Parse the Ethernet address during prom_init(), before registering RAM
> with memblock, and keep the six bytes in kernel-owned init data. Return
> the saved address during device initialization, preserving the existing
> YAMON formats and command-line fallback without reserving a fixed
> low-memory region.
> 
> Fixes: 9ddb3c14afba ("mm: fix struct page layout on 32-bit systems")

This is an inappropriate Fixes line.  That may have exposed the problem
(... 5 years ago; how often is this being tested?) but it's merely
restoring the layout to that which existed two years before that.
The correct Fixes line wuld be something related to this driver.
