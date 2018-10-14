Received: from mail-pl1-x642.google.com ([IPv6:2607:f8b0:4864:20::642]:38240
        "EHLO mail-pl1-x642.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990490AbeJNNVlqK85g convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 14 Oct 2018 15:21:41 +0200
MIME-Version: 1.0
References: <20181013145406.4911-1-Tianyu.Lan@microsoft.com>
 <20181013145406.4911-3-Tianyu.Lan@microsoft.com> <4D709C3A-A91C-4CA7-922A-E77618EF21B4@oracle.com>
 <alpine.DEB.2.21.1810141014350.1438@nanos.tec.linutronix.de>
 <20181014092734.GV30658@n2100.armlinux.org.uk> <20181014093541.GW30658@n2100.armlinux.org.uk>
In-Reply-To: <20181014093541.GW30658@n2100.armlinux.org.uk>
From: Tianyu Lan <lantianyu1986@gmail.com>
Date: Sun, 14 Oct 2018 21:21:23 +0800
Message-ID: <CAOLK0pzHAc1ipDbd3Trg2W_Gb_DxdEKM2ML5Fk09u0-O8y6UAg@mail.gmail.com>
Subject: Re: [PATCH V4 2/15] KVM/MMU: Add tlb flush with range helper function
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-Path: <lantianyu1986@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux@armlinux.org.uk
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, kvm <kvm@vger.kernel.org>, Radim Krcmar <rkrcmar@redhat.com>, benh@kernel.crashing.org, will.deacon@arm.com, christoffer.dall@arm.com, paulus@ozlabs.org, "H. Peter Anvin" <hpa@zytor.com>, kys@microsoft.com, kvmarm@lists.cs.columbia.edu, sthemmin@microsoft.com, mpe@ellerman.id.au, the arch/x86 maintainers <x86@kernel.org>, michael.h.kelley@microsoft.com, Ingo Molnar <mingo@redhat.com>, catalin.marinas@arm.com, jhogan@kernel.org, Tianyu Lan <Tianyu.Lan@microsoft.com>, marc.zyngier@arm.com, haiyangz@microsoft.com, kvm-ppc@vger.kernel.org, liran.alon@oracle.com, Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger kernel org" <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, devel@linuxdriverproject.org, vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Message-ID: <20181014132123.nBhJAgzJJbwudgKFdXZjou8BhOxZM5Bb2QOg-35daUU@z>

Hi Russell:
              Thanks for your review.

On Sun, Oct 14, 2018 at 5:36 PM Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
>
> On Sun, Oct 14, 2018 at 10:27:34AM +0100, Russell King - ARM Linux wrote:
> > On Sun, Oct 14, 2018 at 10:16:56AM +0200, Thomas Gleixner wrote:
> > > On Sun, 14 Oct 2018, Liran Alon wrote:
> > > > > On 13 Oct 2018, at 17:53, lantianyu1986@gmail.com wrote:
> > > > >
> > > > > From: Lan Tianyu <Tianyu.Lan@microsoft.com>
> > > > >
> > > > > This patch is to add wrapper functions for tlb_remote_flush_with_range
> > > > > callback.
> > > > >
> > > > > Signed-off-by: Lan Tianyu <Tianyu.Lan@microsoft.com>
> > > > > ---
> > > > > Change sicne V3:
> > > > >       Remove code of updating "tlbs_dirty"
> > > > > Change since V2:
> > > > >       Fix comment in the kvm_flush_remote_tlbs_with_range()
> > > > > ---
> > > > > arch/x86/kvm/mmu.c | 40 ++++++++++++++++++++++++++++++++++++++++
> > > > > 1 file changed, 40 insertions(+)
> > > > >
> > > > > diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
> > > > > index c73d9f650de7..ff656d85903a 100644
> > > > > --- a/arch/x86/kvm/mmu.c
> > > > > +++ b/arch/x86/kvm/mmu.c
> > > > > @@ -264,6 +264,46 @@ static void mmu_spte_set(u64 *sptep, u64 spte);
> > > > > static union kvm_mmu_page_role
> > > > > kvm_mmu_calc_root_page_role(struct kvm_vcpu *vcpu);
> > > > >
> > > > > +
> > > > > +static inline bool kvm_available_flush_tlb_with_range(void)
> > > > > +{
> > > > > +       return kvm_x86_ops->tlb_remote_flush_with_range;
> > > > > +}
> > > >
> > > > Seems that kvm_available_flush_tlb_with_range() is not used in this patch…
> > >
> > > What's wrong with that?
> > >
> > > It provides the implementation and later patches make use of it. It's a
> > > sensible way to split patches into small, self contained entities.
> >
> > From what I can see of the patches that follow _this_ patch in the
> > series, this function remains unused.  So, not only is it not used
> > in this patch, it's not used in this series.
>
> Note - I seem to have only received patches 1 through 4, so this is
> based on the patches I've received.
>

Sorry to confuse your. I get from CCers from get_maintainer.pl script.
The next patch "[PATCH V4 3/15]KVM: Replace old tlb flush function with
new one to flush a specified range" calls new function.
https://lkml.org/lkml/2018/10/13/254

The patch "[PATCH V4 4/15] KVM: Make kvm_set_spte_hva() return int"
changes under ARM directory. Please have a look. Thanks.
-- 
Best regards
Tianyu Lan
