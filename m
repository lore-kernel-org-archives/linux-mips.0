Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7EE1CD1B
	for <linux-mips@vger.kernel.org>; Fri, 26 Jan 2024 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706264166; cv=none; b=prFLC1NEYzYLJeuXBIvIQ1g5sQFG0e5dOWNsEyedGoXYYxKbHmtrYmBeE04doqu96YQvf9tnEGbr9mFGkYU2FcmXhh08LwrojNZVDk0t4y9VV/9IbyD5FpAjGEqR2eOllWqKVQQ1d9ykGR3k/aF5IDXjmXGkkWh9zSdqrERWIKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706264166; c=relaxed/simple;
	bh=go0UzTGaBLVOeOiIsV4OsCaYW1uXDoIyL0R3EOkg168=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyCIbYJUtlHQ+uWL3og14PlC1nbYtmNIdJ0sYOOisEMBZAC8b/C6A6+nAwPSlqDs8avu7CNDAB5UURnACvP3NqDH7Vi/3dhCHGr9nprwXB2dvAX4iShSWgcBuAd4i8XzwvECtFGLaVGm48ip85LNyPlgdqF7pxksHILjWdFMvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rTJFY-0003wi-00; Fri, 26 Jan 2024 11:15:52 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 161B3C04A1; Fri, 26 Jan 2024 11:12:32 +0100 (CET)
Date: Fri, 26 Jan 2024 11:12:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Huang Pei <huangpei@loongson.cn>
Cc: Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 2/2] MIPS: loongson64: set nid for reserved memblock
 region
Message-ID: <ZbOFkEikUQbvg7OU@alpha.franken.de>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240123014758.12718-1-huangpei@loongson.cn>
 <20240123014758.12718-2-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123014758.12718-2-huangpei@loongson.cn>

On Tue, Jan 23, 2024 at 09:47:58AM +0800, Huang Pei wrote:
> Commit 61167ad5fecd("mm: pass nid to reserve_bootmem_region()") reveals
> that reserved memblock regions have no valid node id set, just set it
> right since loongson64 firmware makes it clear in memory layout info.
> 
> This works around booting failure on 3A1000+ since commit 61167ad5fecd
> ("mm: pass nid to reserve_bootmem_region()") under
> CONFIG_DEFERRED_STRUCT_PAGE_INIT.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/loongson64/init.c | 2 ++
>  arch/mips/loongson64/numa.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index f25caa6aa9d3..000ba91c0886 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -103,6 +103,8 @@ void __init szmem(unsigned int node)
>  	if (loongson_sysconf.vgabios_addr)
>  		memblock_reserve(virt_to_phys((void *)loongson_sysconf.vgabios_addr),
>  				SZ_256K);
> +	/* set nid for reserved memory */
> +	memblock_set_node((u64)node << 44, (u64)(node+1) << 44, &memblock.reserved, node);
>  }
>  
>  #ifndef CONFIG_NUMA
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index 8f61e93c0c5b..6345e096c532 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -132,6 +132,8 @@ static void __init node_mem_init(unsigned int node)
>  
>  		/* Reserve pfn range 0~node[0]->node_start_pfn */
>  		memblock_reserve(0, PAGE_SIZE * start_pfn);
> +		/* set nid for reserved memory on node 0 */
> +		memblock_set_node(0, (u64)1 << 44, &memblock.reserved, 1);
>  	}
>  }
>  
> -- 
> 2.30.2

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
