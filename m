Received: from dns1.mips.com ([63.167.95.197]:35404 "EHLO dns1.mips.com"
	rhost-flags-OK-OK-OK-OK) by ftp.linux-mips.org with ESMTP
	id S1492259AbZGBVwd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 2 Jul 2009 23:52:33 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH 15/15] Do not rely on the initial state of TC/VPE bindings when doing cross VPE writes
Date: Thu, 2 Jul 2009 14:46:33 -0700
Message-ID: <94BD67F8AF3ED34FA362C662BA1F12C503BED88E@MTVEXCHANGE.mips.com>
In-Reply-To: <4A4C314B.2070907@paralogos.com>
References: <20090702023938.23268.65453.stgit@linux-raghu> <20090702024331.23268.98671.stgit@linux-raghu> <4A4C314B.2070907@paralogos.com>
From: "Gandham, Raghu" <raghu@mips.com>
Return-Path: <raghu@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Kevin D. Kissell" <kevink@paralogos.com>
Cc: linux-mips@linux-mips.org, "Dearman, Chris" <chris@mips.com>
Message-ID: <20090702214633.aOOGMabbfuYPkY07r3qU3bbp-tTSmBgoSpmFEMPMgfw@z>



> -----Original Message-----
> From: Kevin D. Kissell [mailto:kevink@paralogos.com]
> Sent: Wednesday, July 01, 2009 9:02 PM
> To: Gandham, Raghu
> Cc: linux-mips@linux-mips.org; Dearman, Chris
> Subject: Re: [PATCH 15/15] Do not rely on the initial state of TC/VPE
> bindings when doing cross VPE writes
> 
> Note that, regardless of the reset state, smtc_configure_tlb() should
> have at least temporarily bound TC 1 to VPE1, which may be why this
> never seemed to be a problem on the 34K.  If one wants to support
> designs with more than 2 VPEs, then this is probably one of the things
> that needs to be fixed.  That having been said, rather than adding a
> usually-redundant write_vpe_c0_vpeconf0() in that clause, wouldn't it
be
> cleaner to just move the MVP setting from the top of the loop to the
> point in the loop just after the TCs have been bound to the VPE in
> question, i.e.,
> 
>  454                 if (slop) {
>  455                         if (tc != 0) {
>  456                                 smtc_tc_setup(vpe,tc, cpu);
>  457                                 cpu++;
>  458                         }
>  459                         printk(" %d", tc);
>  460                         tc++;
>  461                         slop--;
>  462                 }
> 
>                         write_vpe_c0_vpeconf0(read_vpe_c0_vpeconf0() |
> VPECONF0_MVP);
> 
>  463                 if (vpe != 0) {
>  464                         /*
>  465                          * Clear any stale software interrupts
from
> VPE's Cause
>  466                          */
> 
> This should definitely be OK for a 34K, because it's being executed by
> TC0 in VPE0 and the reset state of VPE0 has MVP set.  If it weren't,
> smtc_configure_tlb() would have failed.
> 
>           Regards,
> 
>           Kevin K.


I will resend this patch with your suggestion.

Thanks,
Raghu

> 
> Raghu Gandham wrote:
> > From: Kurt Martin <kurt@mips.com>
> >
> > Signed-off-by: Jaidev Patwardhan <jaidev@mips.com>
> > 	Signed-off-by: Chris Dearman <chris@mips.com>
> > ---
> >
> >  arch/mips/kernel/smtc.c |   12 ++++++++++++
> >  1 files changed, 12 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/mips/kernel/smtc.c b/arch/mips/kernel/smtc.c
> > index 69240c4..3498b82 100644
> > --- a/arch/mips/kernel/smtc.c
> > +++ b/arch/mips/kernel/smtc.c
> > @@ -481,6 +481,18 @@ void smtc_prepare_cpus(int cpus)
> >  			 */
> >  			if (tc != 0) {
> >  				smtc_tc_setup(vpe, tc, cpu);
> > +				if (vpe != 0) {
> > +					/*
> > +					 * Set MVP bit (possibly again).
Do it
> > +					 * here to catch CPUs that have
no TCs
> > +					 * bound to the VPE at reset.
In that
> > +					 * case, a TC must be bound to
the VPE
> > +					 * before we can set
VPEControl[MVP]
> > +					 */
> > +					write_vpe_c0_vpeconf0(
> > +						read_vpe_c0_vpeconf0() |
> > +						VPECONF0_MVP);
> > +				}
> >  				cpu++;
> >  			}
> >  			printk(" %d", tc);
> >
> >
> >
