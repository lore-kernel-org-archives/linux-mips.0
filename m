Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33420 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990946AbeI0EuqGmmA7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 27 Sep 2018 06:50:46 +0200
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w8R4nKqS041471
        for <linux-mips@linux-mips.org>; Thu, 27 Sep 2018 00:50:42 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2mrnx2dtw2-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@linux-mips.org>; Thu, 27 Sep 2018 00:50:41 -0400
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@linux-mips.org> from <rppt@linux.vnet.ibm.com>;
        Thu, 27 Sep 2018 05:50:38 +0100
Date: Thu, 27 Sep 2018 07:50:20 +0300
From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH 03/30] mm: remove CONFIG_HAVE_MEMBLOCK
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-4-git-send-email-rppt@linux.vnet.ibm.com>
 <CAKgT0UdP=78RsWHMxFu4PD8a3AhA3eNcG68Z_9aGY0vhOKf7xA@mail.gmail.com>
 <20180926183152.GA4597@rapoport-lnx>
 <CAKgT0UcC-GTtyPK9ynvj6r3YFqy8kE40iMJxzPowbNoXGf9iWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKgT0UcC-GTtyPK9ynvj6r3YFqy8kE40iMJxzPowbNoXGf9iWg@mail.gmail.com>
Message-ID: <20180927045019.GA16740@rapoport-lnx>
Return-Path: <rppt@linux.vnet.ibm.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: linux-mm <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, chris@zankel.net, David Miller <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, green.hu@gmail.com, Greg KH <gregkh@linuxfoundation.org>, gxt@pku.edu.cn, Ingo Molnar <mingo@redhat.com>, jejb@parisc-linux.org, jonas@southpole.se, Jonathan Corbet <corbet@lwn.net>, lftan@altera.com, msalter@redhat.com, Martin Schwidefsky <schwidefsky@de.ibm.com>, mattst88@gmail.com, mpe@ellerman.id.au, Michal Hocko <mhocko@suse.com>, monstr@monstr.eu, palmer@sifive.com, paul.burton@mips.com, rkuo@codeaurora.org, richard@nod.at, dalias@libc.org, Russell King - ARM Linux <linux@armlinux.org.uk>, fancer.lancer@gmail.com, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, vgupta@synopsys.com, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
Message-ID: <20180927045020.cFnW4yNeQWYwEYRBnZmLsYnv-vOGh8YtlVk1scRSf88@z>

On Wed, Sep 26, 2018 at 05:34:32PM -0700, Alexander Duyck wrote:
> On Wed, Sep 26, 2018 at 11:32 AM Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> >
> > On Wed, Sep 26, 2018 at 09:58:41AM -0700, Alexander Duyck wrote:
> > > On Fri, Sep 14, 2018 at 5:11 AM Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> > > >
> > > > All architecures use memblock for early memory management. There is no need
> > > > for the CONFIG_HAVE_MEMBLOCK configuration option.
> > > >
> > > > Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> > >
> > > <snip>
> > >
> > > > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > > > index 5169205..4ae91fc 100644
> > > > --- a/include/linux/memblock.h
> > > > +++ b/include/linux/memblock.h
> > > > @@ -2,7 +2,6 @@
> > > >  #define _LINUX_MEMBLOCK_H
> > > >  #ifdef __KERNEL__
> > > >
> > > > -#ifdef CONFIG_HAVE_MEMBLOCK
> > > >  /*
> > > >   * Logical memory blocks.
> > > >   *
> > > > @@ -460,7 +459,6 @@ static inline phys_addr_t memblock_alloc(phys_addr_t size, phys_addr_t align)
> > > >  {
> > > >         return 0;
> > > >  }
> > > > -#endif /* CONFIG_HAVE_MEMBLOCK */
> > > >
> > > >  #endif /* __KERNEL__ */
> > >
> > > There was an #else above this section and I believe it and the code
> > > after it needs to be stripped as well.
> >
> > Right, I've already sent the fix [1] and it's in mmots.
> >
> > [1] https://lkml.org/lkml/2018/9/19/416
> >
> 
> Are you sure? The patch you reference appears to be for
> drivers/of/fdt.c, and the bit I pointed out here is in
> include/linux/memblock.h.

Ah, sorry. You are right, will fix. Thanks for spotting it!
 
> - Alex
> 

-- 
Sincerely yours,
Mike.
