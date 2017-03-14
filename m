Received: from smtp-out4.electric.net ([192.162.216.182]:50335 "EHLO
        smtp-out4.electric.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994822AbdCNKS2rdXNU convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 14 Mar 2017 11:18:28 +0100
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [RFC PATCH 07/13] kernel/fork: Split and export 'mm_alloc' and
 'mm_init'
Date: Tue, 14 Mar 2017 10:18:03 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6DCFFB03F4@AcuExch.aculab.com>
References: <20170313221415.9375-1-till.smejkal@gmail.com>
 <20170313221415.9375-8-till.smejkal@gmail.com>
In-Reply-To: <20170313221415.9375-8-till.smejkal@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <David.Laight@ACULAB.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: 'Till Smejkal' <till.smejkal@googlemail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Steven Miao <realmz6@gmail.com>, Richard Kuo <rkuo@codeaurora.org>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, Chris Metcalf <cmetcalf@mellanox.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, Andy Lutomirski <luto@amacapital.net>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Pawel Osciak <pawel@osciak.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Felipe Balbi <balbi@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Benjamin LaHaise <bcrl@kvack.org>, Nadia Yvette Chambers <nyc@holomorphy.com>, Jeff Layton <jlayton@poochiereds.net>, "J. Bruce Fields" <bfields@fieldses.org>, Peter Zijlstra <peterz@infradead.org>, Hugh Dickins <hughd@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-aio@kvack.org" <linux-aio@kvack.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, "linux-metag@vger.kernel.org" <linux-metag@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Message-ID: <20170314101803.XpTsLYGOyNcssZA-LiN2XalWmAWHQSpjhQxz0V-YrS4@z>

From: Linuxppc-dev Till Smejkal
> Sent: 13 March 2017 22:14
> The only way until now to create a new memory map was via the exported
> function 'mm_alloc'. Unfortunately, this function not only allocates a new
> memory map, but also completely initializes it. However, with the
> introduction of first class virtual address spaces, some initialization
> steps done in 'mm_alloc' are not applicable to the memory maps needed for
> this feature and hence would lead to errors in the kernel code.
> 
> Instead of introducing a new function that can allocate and initialize
> memory maps for first class virtual address spaces and potentially
> duplicate some code, I decided to split the mm_alloc function as well as
> the 'mm_init' function that it uses.
> 
> Now there are four functions exported instead of only one. The new
> 'mm_alloc' function only allocates a new mm_struct and zeros it out. If one
> want to have the old behavior of mm_alloc one can use the newly introduced
> function 'mm_alloc_and_setup' which not only allocates a new mm_struct but
> also fully initializes it.
...

That looks like bugs waiting to happen.
You need unchanged code to fail to compile.

	David
