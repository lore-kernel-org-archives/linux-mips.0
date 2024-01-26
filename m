Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D7357317
	for <linux-mips@vger.kernel.org>; Fri, 26 Jan 2024 23:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310920; cv=none; b=N31eUho9qOQnYS7nUv+TDjE31rLoV6nsfRPQlcTjHhBUq3xFBr5fQg8ygt818kqmM1fFAlX7q7It30Vd5aa85ZvDp6agDAt7T5OPFHcyga/VOu9CODsMQI8C4aEhyNPOmWFZylJj8Ysv6tH1QhT1de/LQxAKxDziBl1gqoaxz2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310920; c=relaxed/simple;
	bh=3976i5Rk6n2bOJxuyiTHKvrQWlah5prxCdOMlvgsv5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGQpgWkAvSadBUZvs71fDhQhulcQK2uczZxIZb8xTKbPzpAUrDigTNwpC2LST7kNUEP2vcPmo/ehh5jVhkOeWxdEzqunaPafAcBD8LA5iXYUKbo6qUp1d6J161gnQpuJe3wjIVjuY6XUp9+mjm07iU7KHi6Et5v4ns3REf7uMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rTVPh-0002NB-00; Sat, 27 Jan 2024 00:15:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5A605C0135; Fri, 26 Jan 2024 18:24:35 +0100 (CET)
Date: Fri, 26 Jan 2024 18:24:35 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huang Pei <huangpei@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 2/2] MIPS: loongson64: set nid for reserved memblock
 region
Message-ID: <ZbPq0yF20Qyo1rKb@alpha.franken.de>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240123014758.12718-1-huangpei@loongson.cn>
 <20240123014758.12718-2-huangpei@loongson.cn>
 <ZbOFkEikUQbvg7OU@alpha.franken.de>
 <CAAhV-H71SLi5LU_YmaPb2GdeGmsqy8FY7N5ZDxvPYrpVWazELg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H71SLi5LU_YmaPb2GdeGmsqy8FY7N5ZDxvPYrpVWazELg@mail.gmail.com>

On Fri, Jan 26, 2024 at 10:24:29PM +0800, Huacai Chen wrote:
> On Fri, Jan 26, 2024 at 6:30 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Tue, Jan 23, 2024 at 09:47:58AM +0800, Huang Pei wrote:
> > [...]
> > > diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> > > index 8f61e93c0c5b..6345e096c532 100644
> > > --- a/arch/mips/loongson64/numa.c
> > > +++ b/arch/mips/loongson64/numa.c
> > > @@ -132,6 +132,8 @@ static void __init node_mem_init(unsigned int node)
> > >
> > >               /* Reserve pfn range 0~node[0]->node_start_pfn */
> > >               memblock_reserve(0, PAGE_SIZE * start_pfn);
> > > +             /* set nid for reserved memory on node 0 */
> > > +             memblock_set_node(0, (u64)1 << 44, &memblock.reserved, 1);
> > >       }
> > >  }
> > >
> > > --
> > > 2.30.2
> >
> > applied to mips-fixes.
> Oh, I'm sorry that I found a very stupid error in this patch. The
> comment says set memory on node 0 but the code set it on node 1...

and what is correct ? Please send a patch to fix it in mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
