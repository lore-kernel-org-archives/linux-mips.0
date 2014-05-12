Received: from mail-by2on0140.outbound.protection.outlook.com ([207.46.100.140]:64935
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6817664AbaELKrOi2EHP (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 12 May 2014 12:47:14 +0200
Date: Mon, 12 May 2014 12:46:58 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 07/11] kvm tools: Provide per arch macro to specify type
 for KVM_CREATE_VM
Message-ID: <20140512104658.GC15623@alberich>
References: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1399391491-5021-8-git-send-email-andreas.herrmann@caviumnetworks.com>
 <536D49E6.5050201@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <536D49E6.5050201@imgtec.com>
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
Message-ID: <20140512104658.hXYA_1u6ZnrK80cPDcBe98gjaqBrT64Kp9SieeHo_SI@z>

On Fri, May 09, 2014 at 10:34:30PM +0100, James Hogan wrote:
> Hi Andreas,
> 
> On 06/05/14 16:51, Andreas Herrmann wrote:
> > This is is usually 0 for most archs. On mips we have two types.
> > TE (type 0) and MIPS-VZ (type 1). Default to 1 on mips.
> > 
> > Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> > ---
> >  tools/kvm/arm/include/arm-common/kvm-arch.h |    2 ++
> >  tools/kvm/kvm.c                             |    2 +-
> >  tools/kvm/mips/include/kvm/kvm-arch.h       |    2 ++
> >  tools/kvm/powerpc/include/kvm/kvm-arch.h    |    2 ++
> >  tools/kvm/x86/include/kvm/kvm-arch.h        |    2 ++
> >  5 files changed, 9 insertions(+), 1 deletion(-)
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
> > index cfc0693..278b915 100644
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
> > index 4a8407b..0210f0b 100644
> > --- a/tools/kvm/mips/include/kvm/kvm-arch.h
> > +++ b/tools/kvm/mips/include/kvm/kvm-arch.h
> > @@ -17,6 +17,8 @@
> >  
> >  #define KVM_IRQ_OFFSET		1
> >  
> > +#define KVM_VM_TYPE		1
> 
> A comment or define to clarify this wouldn't hurt.

Ok.

Thanks,
Andreas
