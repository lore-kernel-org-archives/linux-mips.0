Received: from pandora.armlinux.org.uk ([IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6]:59186
        "EHLO pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990471AbeJNJ1yU7odX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 14 Oct 2018 11:27:54 +0200
Date: Sun, 14 Oct 2018 10:27:34 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH V4 2/15] KVM/MMU: Add tlb flush with range helper function
Message-ID: <20181014092734.GV30658@n2100.armlinux.org.uk>
References: <20181013145406.4911-1-Tianyu.Lan@microsoft.com>
 <20181013145406.4911-3-Tianyu.Lan@microsoft.com>
 <4D709C3A-A91C-4CA7-922A-E77618EF21B4@oracle.com>
 <alpine.DEB.2.21.1810141014350.1438@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.1810141014350.1438@nanos.tec.linutronix.de>
Return-Path: <linux+linux-mips=linux-mips.org@armlinux.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Liran Alon <liran.alon@oracle.com>, linux-mips@linux-mips.org, linux@armlinux.org, kvm@vger.kernel.org, rkrcmar@redhat.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, paulus@ozlabs.org, hpa@zytor.com, kys@microsoft.com, kvmarm@lists.cs.columbia.edu, lantianyu1986@gmail.com, sthemmin@microsoft.com, mpe@ellerman.id.au, x86@kernel.org, michael.h.kelley@microsoft.com, mingo@redhat.com, benh@kernel.crashing.org, jhogan@kernel.org, Lan Tianyu <Tianyu.Lan@microsoft.com>, marc.zyngier@arm.com, haiyangz@microsoft.com, kvm-ppc@vger.kernel.org, devel@linuxdriverproject.org, linux-arm-kernel@lists.infradead.org, christoffer.dall@arm.com, ralf@linux-mips.org, paul.burton@mips.com, pbonzini@redhat.com, vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Message-ID: <20181014092734.djzEbvMhly5QJ0YXoACDQDT6kfAOjds5I5kKcmbC-Pg@z>

On Sun, Oct 14, 2018 at 10:16:56AM +0200, Thomas Gleixner wrote:
> On Sun, 14 Oct 2018, Liran Alon wrote:
> > > On 13 Oct 2018, at 17:53, lantianyu1986@gmail.com wrote:
> > > 
> > > From: Lan Tianyu <Tianyu.Lan@microsoft.com>
> > > 
> > > This patch is to add wrapper functions for tlb_remote_flush_with_range
> > > callback.
> > > 
> > > Signed-off-by: Lan Tianyu <Tianyu.Lan@microsoft.com>
> > > ---
> > > Change sicne V3:
> > >       Remove code of updating "tlbs_dirty"
> > > Change since V2:
> > >       Fix comment in the kvm_flush_remote_tlbs_with_range()
> > > ---
> > > arch/x86/kvm/mmu.c | 40 ++++++++++++++++++++++++++++++++++++++++
> > > 1 file changed, 40 insertions(+)
> > > 
> > > diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
> > > index c73d9f650de7..ff656d85903a 100644
> > > --- a/arch/x86/kvm/mmu.c
> > > +++ b/arch/x86/kvm/mmu.c
> > > @@ -264,6 +264,46 @@ static void mmu_spte_set(u64 *sptep, u64 spte);
> > > static union kvm_mmu_page_role
> > > kvm_mmu_calc_root_page_role(struct kvm_vcpu *vcpu);
> > > 
> > > +
> > > +static inline bool kvm_available_flush_tlb_with_range(void)
> > > +{
> > > +	return kvm_x86_ops->tlb_remote_flush_with_range;
> > > +}
> > 
> > Seems that kvm_available_flush_tlb_with_range() is not used in this patch…
> 
> What's wrong with that? 
> 
> It provides the implementation and later patches make use of it. It's a
> sensible way to split patches into small, self contained entities.
