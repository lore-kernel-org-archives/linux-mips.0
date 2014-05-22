Received: from mail-bn1blp0187.outbound.protection.outlook.com ([207.46.163.187]:22356
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855114AbaEVQOjK9zWR (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 22 May 2014 18:14:39 +0200
Date: Thu, 22 May 2014 18:13:42 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 07/15] MIPS: Add mips_cpunum() function.
Message-ID: <20140522161342.GI11800@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-8-git-send-email-andreas.herrmann@caviumnetworks.com>
 <537C89B5.2030907@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <537C89B5.2030907@imgtec.com>
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
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140522161342.C7EFOzEH2vc3B71oyL47GOyWluyq6sCp-9-UhZtlPpk@z>

On Wed, May 21, 2014 at 12:10:45PM +0100, James Hogan wrote:
> On 20/05/14 15:47, Andreas Herrmann wrote:
> > From: David Daney <david.daney@cavium.com>
> > 
> > This returns the CPUNum from the low order Ebase bits.
> > 
> > Signed-off-by: David Daney <david.daney@cavium.com>
> > Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> > ---
> >  arch/mips/include/asm/mipsregs.h |    5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> > index 3e025b5..f110d48 100644
> > --- a/arch/mips/include/asm/mipsregs.h
> > +++ b/arch/mips/include/asm/mipsregs.h
> > @@ -1916,6 +1916,11 @@ __BUILD_SET_C0(brcm_cmt_ctrl)
> >  __BUILD_SET_C0(brcm_config)
> >  __BUILD_SET_C0(brcm_mode)
> >  
> > +static inline unsigned int mips_cpunum(void)
> > +{
> > +	return read_c0_ebase() & 0x3ff; /* Low 10 bits of ebase. */
> > +}
> 
> If this is going to go in mips generic code I think it should be clearly
> defined, especially in the presence of MT, otherwise perhaps it makes
> sense for it to go in a paravirt specific header?

It's just wrapper to read ebase_cpunum. Currently only used in the
paravirt-code (to get CPUnum for a guest CPU -- which eventually is
read from guest cp0 context).

I am not sure whether it needs to be moved to a paravirt specific
header.

> I.e. does it return the core number of the running VPE (if so it should
> probably do something like below as in decode_configs() and go in
> smp.h), or does it simply always return that field in ebase register (in
> which case it should probably have ebase in the name and a comment to
> clarify that it doesn't necessarily map directly to core/vpe number).

Under KVM (MIPSVZ) it effectively returns vcpu_id and thus such a
comment could be added for clarification.

So, should we name it get_ebase_cpunum() but keep it in this header
(and also replace the 1 or 2 occurrences of "read_c0_ebase() & 0x3ff"
in the non-paravirt code with it)?

> unsigned int core = read_c0_ebase() & 0x3ff;
> if (cpu_has_mipsmt)
> 	core >>= fls(smp_num_siblings) - 1;
> 
> Cheers
> James


Andreas
