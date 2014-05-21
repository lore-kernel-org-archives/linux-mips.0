Received: from mail-by2lp0242.outbound.protection.outlook.com ([207.46.163.242]:22742
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6842298AbaEUNTcPeLzV (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 May 2014 15:19:32 +0200
Date: Wed, 21 May 2014 15:17:40 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 05/15] MIPS: Don't build fast TLB refill handler with
 32-bit kernels.
Message-ID: <20140521131740.GG11800@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-6-git-send-email-andreas.herrmann@caviumnetworks.com>
 <537C741F.60104@imgtec.com>
 <20140521130420.GR10287@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20140521130420.GR10287@linux-mips.org>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140521131740.K8NL_CpV2sfdzgY6stZy2vOrtkfnF024RsKp-gkzkEo@z>

On Wed, May 21, 2014 at 03:04:20PM +0200, Ralf Baechle wrote:
> On Wed, May 21, 2014 at 10:38:39AM +0100, James Hogan wrote:
> 
> > On 20/05/14 15:47, Andreas Herrmann wrote:
> > > From: David Daney <david.daney@cavium.com>
> > > 
> > > The fast handler only supports 64-bit kernels.
> > > 
> > > Signed-off-by: David Daney <david.daney@cavium.com>
> > > Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> > > ---
> > >  arch/mips/mm/tlbex.c |    8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> > > index ee88367..781e183 100644
> > > --- a/arch/mips/mm/tlbex.c
> > > +++ b/arch/mips/mm/tlbex.c
> > > @@ -1250,13 +1250,17 @@ static void build_r4000_tlb_refill_handler(void)
> > >  	unsigned int final_len;
> > >  	struct mips_huge_tlb_info htlb_info __maybe_unused;
> > >  	enum vmalloc64_mode vmalloc_mode __maybe_unused;
> > > -
> > > +#ifdef CONFIG_64BIT
> > > +	bool is64bit = true;
> > > +#else
> > > +	bool is64bit = false;
> > > +#endif
> > >  	memset(tlb_handler, 0, sizeof(tlb_handler));
> > >  	memset(labels, 0, sizeof(labels));
> > >  	memset(relocs, 0, sizeof(relocs));
> > >  	memset(final_handler, 0, sizeof(final_handler));
> > >  
> > > -	if ((scratch_reg >= 0 || scratchpad_available()) && use_bbit_insns()) {
> > > +	if (is64bit && (scratch_reg >= 0 || scratchpad_available()) && use_bbit_insns()) {
> > >  		htlb_info = build_fast_tlb_refill_handler(&p, &l, &r, K0, K1,
> > >  							  scratch_reg);
> > >  		vmalloc_mode = refill_scratch;
> > > 
> > 
> > This looks like a good place to use IS_ENABLED(CONFIG_64BIT) to reduce
> > ifdefery.
> 
> Or even the classic "if (sizeof(unsigned long) == 8)" which is a little less
> expressive but more portable.

Ok, makes sense.
(Will use one of the two suggestions.)


Thanks,

Andreas
