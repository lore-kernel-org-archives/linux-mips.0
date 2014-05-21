Received: from mail-bl2lp0205.outbound.protection.outlook.com ([207.46.163.205]:3634
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854846AbaEUVEHNTVae (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 May 2014 23:04:07 +0200
Date: Wed, 21 May 2014 23:02:12 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 06/15] MIPS: Add minimal support for OCTEON3 to c-r4k.c
Message-ID: <20140521210212.GH11800@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-7-git-send-email-andreas.herrmann@caviumnetworks.com>
 <20140521124041.GP10287@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20140521124041.GP10287@linux-mips.org>
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140521210212.yIJv41nPBORhqWl06f72ZDih6H8XSvBoIHOxtXmsurE@z>

On Wed, May 21, 2014 at 02:40:41PM +0200, Ralf Baechle wrote:
> On Tue, May 20, 2014 at 04:47:07PM +0200, Andreas Herrmann wrote:
> 
> > +static inline void r4k_blast_dcache_page_dc128(unsigned long addr)
> > +{
> > +	R4600_HIT_CACHEOP_WAR_IMPL;
> 
> The R4600 has 32 byte cache lines that is this line will never be
> executed on an R4600 thus can be dropped.

So the line can also be removed from r4k_blast_dcache_page_dc64?

> > +	blast_dcache128_page(addr);
> > +}
> > +
> >  static void r4k_blast_dcache_page_setup(void)
> >  {
> >  	unsigned long  dc_lsize = cpu_dcache_line_size();
> > @@ -121,6 +127,8 @@ static void r4k_blast_dcache_page_setup(void)
> >  		r4k_blast_dcache_page = r4k_blast_dcache_page_dc32;
> >  	else if (dc_lsize == 64)
> >  		r4k_blast_dcache_page = r4k_blast_dcache_page_dc64;
> > +	else if (dc_lsize == 128)
> > +		r4k_blast_dcache_page = r4k_blast_dcache_page_dc128;
> 
> 
> For another patch - let's see if this can be turned into a switch
> construct which hopefully is more readable and produces just as
> afficient code with reasonable vintage of gcc.

Ok.

Andreas
