Received: from mailapp01.imgtec.com ([195.59.15.196]:17167 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822185AbaETL3JqxNf4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 May 2014 13:29:09 +0200
Message-ID: <537B3B8A.5000600@imgtec.com>
Date: Tue, 20 May 2014 12:24:58 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 08/12] kvm tools: Provide per arch macro to specify
 type for KVM_CREATE_VM
References: <1400518411-9759-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1400518411-9759-9-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400518411-9759-9-git-send-email-andreas.herrmann@caviumnetworks.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20140520112458.enqvVB0MHbbGmWAPXfMaU6L-w3eEMbh9vo2lflIzuck@z>

On 19/05/14 17:53, Andreas Herrmann wrote:
> This is is usually 0 for most archs. On mips we have two types.
> TE (type 0) and MIPS-VZ (type 1). Default to 1 on mips.

Minor thing I didn't spot with v1 (sorry).
I think this patch should probably be moved before patch 6 with the mips
part squashed into patch 6, otherwise AFAICT the mips support in patch
6/7 is broken out of the box until this patch fixes it.

Cheers
James

> 
> Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> ---
>  tools/kvm/arm/include/arm-common/kvm-arch.h |    2 ++
>  tools/kvm/kvm.c                             |    2 +-
>  tools/kvm/mips/include/kvm/kvm-arch.h       |    5 +++++
>  tools/kvm/powerpc/include/kvm/kvm-arch.h    |    2 ++
>  tools/kvm/x86/include/kvm/kvm-arch.h        |    2 ++
>  5 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/kvm/arm/include/arm-common/kvm-arch.h b/tools/kvm/arm/include/arm-common/kvm-arch.h
> index b6c4bf8..a552163 100644
> --- a/tools/kvm/arm/include/arm-common/kvm-arch.h
> +++ b/tools/kvm/arm/include/arm-common/kvm-arch.h
> @@ -32,6 +32,8 @@
>  
>  #define KVM_IRQ_OFFSET		GIC_SPI_IRQ_BASE
>  
> +#define KVM_VM_TYPE		0
> +
>  #define VIRTIO_DEFAULT_TRANS(kvm)	\
>  	((kvm)->cfg.arch.virtio_trans_pci ? VIRTIO_PCI : VIRTIO_MMIO)
>  
> diff --git a/tools/kvm/kvm.c b/tools/kvm/kvm.c
> index 6046434..e1b9f6c 100644
> --- a/tools/kvm/kvm.c
> +++ b/tools/kvm/kvm.c
> @@ -284,7 +284,7 @@ int kvm__init(struct kvm *kvm)
>  		goto err_sys_fd;
>  	}
>  
> -	kvm->vm_fd = ioctl(kvm->sys_fd, KVM_CREATE_VM, 0);
> +	kvm->vm_fd = ioctl(kvm->sys_fd, KVM_CREATE_VM, KVM_VM_TYPE);
>  	if (kvm->vm_fd < 0) {
>  		pr_err("KVM_CREATE_VM ioctl");
>  		ret = kvm->vm_fd;
> diff --git a/tools/kvm/mips/include/kvm/kvm-arch.h b/tools/kvm/mips/include/kvm/kvm-arch.h
> index 4a8407b..7eadbf4 100644
> --- a/tools/kvm/mips/include/kvm/kvm-arch.h
> +++ b/tools/kvm/mips/include/kvm/kvm-arch.h
> @@ -17,6 +17,11 @@
>  
>  #define KVM_IRQ_OFFSET		1
>  
> +/*
> + * MIPS-VZ (trap and emulate is 0)
> + */
> +#define KVM_VM_TYPE		1
> +
>  #define VIRTIO_DEFAULT_TRANS(kvm)	VIRTIO_PCI
>  
>  #include <stdbool.h>
> diff --git a/tools/kvm/powerpc/include/kvm/kvm-arch.h b/tools/kvm/powerpc/include/kvm/kvm-arch.h
> index f8627a2..fdd518f 100644
> --- a/tools/kvm/powerpc/include/kvm/kvm-arch.h
> +++ b/tools/kvm/powerpc/include/kvm/kvm-arch.h
> @@ -44,6 +44,8 @@
>  
>  #define KVM_IRQ_OFFSET			16
>  
> +#define KVM_VM_TYPE			0
> +
>  #define VIRTIO_DEFAULT_TRANS(kvm)	VIRTIO_PCI
>  
>  struct spapr_phb;
> diff --git a/tools/kvm/x86/include/kvm/kvm-arch.h b/tools/kvm/x86/include/kvm/kvm-arch.h
> index a9f23b8..673bdf1 100644
> --- a/tools/kvm/x86/include/kvm/kvm-arch.h
> +++ b/tools/kvm/x86/include/kvm/kvm-arch.h
> @@ -27,6 +27,8 @@
>  
>  #define KVM_IRQ_OFFSET		5
>  
> +#define KVM_VM_TYPE		0
> +
>  #define VIRTIO_DEFAULT_TRANS(kvm)	VIRTIO_PCI
>  
>  struct kvm_arch {
> 
