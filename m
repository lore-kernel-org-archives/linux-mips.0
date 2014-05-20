Received: from mail-by2lp0244.outbound.protection.outlook.com ([207.46.163.244]:59194
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855025AbaETO4nmKVhQ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 May 2014 16:56:43 +0200
Date: Tue, 20 May 2014 16:55:45 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH v2 08/12] kvm tools: Provide per arch macro to specify
 type for KVM_CREATE_VM
Message-ID: <20140520145545.GB23042@alberich>
References: <1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400518411-9759-9-git-send-email-andreas.herrmann@caviumnetworks.com>
 <537B3B8A.5000600@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <537B3B8A.5000600@imgtec.com>
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
Cc: Pekka Enberg <penberg@kernel.org>, David Daney <ddaney.cavm@gmail.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20140520145545.Qn_Yi_3OTy0CptLAdyDqmBZm9KeYmiuv2vYCqdz0_aw@z>

On Tue, May 20, 2014 at 12:24:58PM +0100, James Hogan wrote:
> On 19/05/14 17:53, Andreas Herrmann wrote:
> > This is is usually 0 for most archs. On mips we have two types.
> > TE (type 0) and MIPS-VZ (type 1). Default to 1 on mips.
> 
> Minor thing I didn't spot with v1 (sorry).
> I think this patch should probably be moved before patch 6 with the mips
> part squashed into patch 6, otherwise AFAICT the mips support in patch
> 6/7 is broken out of the box until this patch fixes it.

Yes, you are correct, the patch sequence should be changed.
(Will have to send out a new version of the patch set. But first I am
waiting a little bit to see whether there are further comments.)


Thanks,

Andreas


> Cheers
> James
> 
> > 
> > Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> > ---
> >  tools/kvm/arm/include/arm-common/kvm-arch.h |    2 ++
> >  tools/kvm/kvm.c                             |    2 +-
> >  tools/kvm/mips/include/kvm/kvm-arch.h       |    5 +++++
> >  tools/kvm/powerpc/include/kvm/kvm-arch.h    |    2 ++
> >  tools/kvm/x86/include/kvm/kvm-arch.h        |    2 ++
> >  5 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/kvm/arm/include/arm-common/kvm-arch.h b/tools/kvm/arm/include/arm-common/kvm-arch.h
> > index b6c4bf8..a552163 100644
> > --- a/tools/kvm/arm/include/arm-common/kvm-arch.h
> > +++ b/tools/kvm/arm/include/arm-common/kvm-arch.h
> > @@ -32,6 +32,8 @@
> >  
> >  #define KVM_IRQ_OFFSET		GIC_SPI_IRQ_BASE
> >  
> > +#define KVM_VM_TYPE		0
> > +
> >  #define VIRTIO_DEFAULT_TRANS(kvm)	\
> >  	((kvm)->cfg.arch.virtio_trans_pci ? VIRTIO_PCI : VIRTIO_MMIO)
> >  
> > diff --git a/tools/kvm/kvm.c b/tools/kvm/kvm.c
> > index 6046434..e1b9f6c 100644
> > --- a/tools/kvm/kvm.c
> > +++ b/tools/kvm/kvm.c
> > @@ -284,7 +284,7 @@ int kvm__init(struct kvm *kvm)
> >  		goto err_sys_fd;
> >  	}
> >  
> > -	kvm->vm_fd = ioctl(kvm->sys_fd, KVM_CREATE_VM, 0);
> > +	kvm->vm_fd = ioctl(kvm->sys_fd, KVM_CREATE_VM, KVM_VM_TYPE);
> >  	if (kvm->vm_fd < 0) {
> >  		pr_err("KVM_CREATE_VM ioctl");
> >  		ret = kvm->vm_fd;
> > diff --git a/tools/kvm/mips/include/kvm/kvm-arch.h b/tools/kvm/mips/include/kvm/kvm-arch.h
> > index 4a8407b..7eadbf4 100644
> > --- a/tools/kvm/mips/include/kvm/kvm-arch.h
> > +++ b/tools/kvm/mips/include/kvm/kvm-arch.h
> > @@ -17,6 +17,11 @@
> >  
> >  #define KVM_IRQ_OFFSET		1
> >  
> > +/*
> > + * MIPS-VZ (trap and emulate is 0)
> > + */
> > +#define KVM_VM_TYPE		1
> > +
> >  #define VIRTIO_DEFAULT_TRANS(kvm)	VIRTIO_PCI
> >  
> >  #include <stdbool.h>
> > diff --git a/tools/kvm/powerpc/include/kvm/kvm-arch.h b/tools/kvm/powerpc/include/kvm/kvm-arch.h
> > index f8627a2..fdd518f 100644
> > --- a/tools/kvm/powerpc/include/kvm/kvm-arch.h
> > +++ b/tools/kvm/powerpc/include/kvm/kvm-arch.h
> > @@ -44,6 +44,8 @@
> >  
> >  #define KVM_IRQ_OFFSET			16
> >  
> > +#define KVM_VM_TYPE			0
> > +
> >  #define VIRTIO_DEFAULT_TRANS(kvm)	VIRTIO_PCI
> >  
> >  struct spapr_phb;
> > diff --git a/tools/kvm/x86/include/kvm/kvm-arch.h b/tools/kvm/x86/include/kvm/kvm-arch.h
> > index a9f23b8..673bdf1 100644
> > --- a/tools/kvm/x86/include/kvm/kvm-arch.h
> > +++ b/tools/kvm/x86/include/kvm/kvm-arch.h
> > @@ -27,6 +27,8 @@
> >  
> >  #define KVM_IRQ_OFFSET		5
> >  
> > +#define KVM_VM_TYPE		0
> > +
> >  #define VIRTIO_DEFAULT_TRANS(kvm)	VIRTIO_PCI
> >  
> >  struct kvm_arch {
> > 
