Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCD333F8C6;
	Mon, 15 Jun 2026 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520249; cv=none; b=WPc21jgcbnc2bm6YqcJXsSUT+XB/6227VZpCqYUE6vSfp1wNCEg8cLsd1Mo9/KrzlBIfA0OZWY6NOioC4647GgIH0Z/n4xzyi55yRoyYckQLH+U2uH7CQ73piX/v/5CIfC+gn6zXmDWE5434slTL8vli/T8gOpLziXNfuFd+n/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520249; c=relaxed/simple;
	bh=Ywavuujbw/K6kxO2YqFSCXq4KZOqGXMrYlBVOmH1ReE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKFlS1tc/SiveC+hw9JhkeLzB8bfSo5SjJJeHvHdOUW4x+HgK5s1payzY8GlWeqycL4vS4NPx7vpYwCxNHsf0la+EE0b+2ftkjD2L3Ox0uTf5w20LjvopcF9of78LCG4Bxs+Inq8yJ0CXRllz9ykRzeEkKwuLA7UMRd0g2CjwHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000Jd-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CC08FC07D4; Mon, 15 Jun 2026 12:29:38 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:29:38 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Yadan Fan <ydfan@suse.com>
Cc: akpm@linux-foundation.org, rppt@kernel.org,
	"Liam R. Howlett" <liam@infradead.org>, catalin.marinas@arm.com,
	jiaxun.yang@flygoat.com, paulburton@kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: mm: Fix out-of-bounds write in maar_res_walk()
Message-ID: <ai_UEmtkptfhUndW@alpha.franken.de>
References: <93172f19-9a73-4661-8dad-3dff800c2d54@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93172f19-9a73-4661-8dad-3dff800c2d54@suse.com>

On Tue, May 26, 2026 at 05:20:09PM +0800, Yadan Fan wrote:
> >From 8dda685e7d0d1653cfb2a93d0865a1fa5a561700 Mon Sep 17 00:00:00 2001
> From: Yadan Fan <ydfan@suse.com>
> Date: Mon, 25 May 2026 12:04:36 +0800
> Subject: [PATCH v3] MIPS: mm: Fix out-of-bounds write in maar_res_walk()
> 
> maar_res_walk() uses wi->num_cfg as the index into the fixed-size
> wi->cfg array, but checks whether the array is full only after it has
> filled the selected entry. If walk_system_ram_range() reports more than
> 16 memory ranges, the overflow call writes one struct maar_config past
> the end of the array before WARN_ON() prevents num_cfg from advancing.
> 
> Move the full-array check before taking the array slot and return non-zero
> when the scratch array is full, so walk_system_ram_range() terminates the
> walk instead of invoking the callback for further ranges.
> 
> Fixes: a5718fe8f70f ("MIPS: mm: Drop boot_mem_map")
> 
> Signed-off-by: Yadan Fan <ydfan@suse.com>
> ---
> Changes in v3:
>   - Restore to use WARN_ON() with return -1 to stop
>     walk_system_ram_range() walking further
> 
>  arch/mips/mm/init.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
