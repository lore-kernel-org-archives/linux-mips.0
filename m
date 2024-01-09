Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B13C3F8C4
	for <linux-mips@vger.kernel.org>; Tue,  9 Jan 2024 21:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rNJqY-0003EN-00; Tue, 09 Jan 2024 22:41:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 25EE8C0135; Tue,  9 Jan 2024 22:40:42 +0100 (CET)
Date: Tue, 9 Jan 2024 22:40:42 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Huang Pei <huangpei@loongson.cn>
Cc: Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH] MIPS: loongson64: fix boot failure
Message-ID: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
References: <20231225093025.23215-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231225093025.23215-1-huangpei@loongson.cn>

On Mon, Dec 25, 2023 at 05:30:25PM +0800, Huang Pei wrote:
>  arch/mips/loongson64/numa.c | 2 --
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 246c6a6b0261..9b632b4c10c3 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2007,7 +2007,8 @@ unsigned long vi_handlers[64];
>  
>  void reserve_exception_space(phys_addr_t addr, unsigned long size)
>  {
> -	memblock_reserve(addr, size);
> +	if(memblock_is_region_memory(addr, size))
> +		memblock_reserve(addr, size);
>  }

I don't think this is a good idea, reserve_exception_space() is called
in cpu_probe() and at that point memblock setup hasn't been done. So
we end up in a situation commit bd67b711bfaa ("MIPS: kernel: Reserve
exception base early to prevent corruption") fixed.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
