Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id A9ECD120;
	Thu, 23 Nov 2023 04:30:11 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1r68qC-0000v8-00; Thu, 23 Nov 2023 13:29:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D8DBEC0136; Thu, 23 Nov 2023 13:29:31 +0100 (CET)
Date: Thu, 23 Nov 2023 13:29:31 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yinglu Yang <yangyinglu@loongson.cn>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>, Marc Zyngier <maz@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] mips: dmi: Fix early remap on MIPS32
Message-ID: <ZV9Fq1ihUm1Rn6yO@alpha.franken.de>
References: <20231122182419.30633-1-fancer.lancer@gmail.com>
 <20231122182419.30633-2-fancer.lancer@gmail.com>
 <b996b542-4cd3-4f9d-b221-00b2d5ef224e@app.fastmail.com>
 <c7cuvhuu6py5vxhhvkhekv6ned5sro4a3wzzn7v45oahfw42ud@gyqmucagt5e2>
 <8ca730b9-fa8c-46ea-bdc5-158da0f29c3a@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ca730b9-fa8c-46ea-bdc5-158da0f29c3a@app.fastmail.com>

On Thu, Nov 23, 2023 at 12:13:11PM +0000, Jiaxun Yang wrote:
> > Ok. Thanks for the heads up. I'll fix the patch to be using ioremap()
> > in v2. ioremap_uc() is just an macro-alias of ioremap() on MIPS.
> 
> Perhaps we need to fix ioremap_cache so it can give a KSEG1 address?

KSEG0 ?

> AFAIK for Loongson DMI is located at cached memory so using ioremap_uc
> blindly will cause inconsistency.

why ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
