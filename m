Received: from mailapp01.imgtec.com ([195.89.28.115]:44608 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6854790AbaEIVobnbcD9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 May 2014 23:44:31 +0200
Message-ID: <536D4C38.2010300@imgtec.com>
Date: Fri, 9 May 2014 22:44:24 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 10/11] kvm tools: Introduce weak (default) load_bzimage
 function
References: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1399391491-5021-11-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1399391491-5021-11-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Message-ID: <20140509214424.DFmgkN12qQO5bqiPwEegx7P-2OhbovaNXVe98J_9K4A@z>

Hi Andreas,

On 06/05/14 16:51, Andreas Herrmann wrote:
> ... to get rid of its function definition from archs that don't
> support it.

Maybe it makes sense to put this patch before the main mips one so that
the function doesn't have to be added for mips in the first place

Cheers
James

> 
> Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> ---
>  tools/kvm/arm/fdt.c     |    7 -------
>  tools/kvm/kvm.c         |    6 ++++++
>  tools/kvm/mips/kvm.c    |    6 ------
>  tools/kvm/powerpc/kvm.c |    7 -------
>  4 files changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/kvm/arm/fdt.c b/tools/kvm/arm/fdt.c
> index 30cd75a..186a718 100644
> --- a/tools/kvm/arm/fdt.c
> +++ b/tools/kvm/arm/fdt.c
> @@ -276,10 +276,3 @@ int load_flat_binary(struct kvm *kvm, int fd_kernel, int fd_initrd,
>  
>  	return true;
>  }
> -
> -bool load_bzimage(struct kvm *kvm, int fd_kernel, int fd_initrd,
> -		  const char *kernel_cmdline)
> -{
> -	/* To b or not to b? That is the zImage. */
> -	return false;
> -}
> diff --git a/tools/kvm/kvm.c b/tools/kvm/kvm.c
> index 278b915..e1b9f6c 100644
> --- a/tools/kvm/kvm.c
> +++ b/tools/kvm/kvm.c
> @@ -355,6 +355,12 @@ int __attribute__((__weak__)) load_elf_binary(struct kvm *kvm, int fd_kernel,
>  	return false;
>  }
>  
> +bool __attribute__((__weak__)) load_bzimage(struct kvm *kvm, int fd_kernel,
> +				int fd_initrd, const char *kernel_cmdline)
> +{
> +	return false;
> +}
> +
>  bool kvm__load_kernel(struct kvm *kvm, const char *kernel_filename,
>  		const char *initrd_filename, const char *kernel_cmdline)
>  {
> diff --git a/tools/kvm/mips/kvm.c b/tools/kvm/mips/kvm.c
> index 09192c8..fc0428b 100644
> --- a/tools/kvm/mips/kvm.c
> +++ b/tools/kvm/mips/kvm.c
> @@ -323,12 +323,6 @@ int load_elf_binary(struct kvm *kvm, int fd_kernel, int fd_initrd, const char *k
>  	return true;
>  }
>  
> -bool load_bzimage(struct kvm *kvm, int fd_kernel, int fd_initrd,
> -		  const char *kernel_cmdline)
> -{
> -	return false;
> -}
> -
>  void ioport__map_irq(u8 *irq)
>  {
>  }
> diff --git a/tools/kvm/powerpc/kvm.c b/tools/kvm/powerpc/kvm.c
> index c1712cf..2b03a12 100644
> --- a/tools/kvm/powerpc/kvm.c
> +++ b/tools/kvm/powerpc/kvm.c
> @@ -204,13 +204,6 @@ int load_flat_binary(struct kvm *kvm, int fd_kernel, int fd_initrd, const char *
>  	return true;
>  }
>  
> -bool load_bzimage(struct kvm *kvm, int fd_kernel, int fd_initrd,
> -		  const char *kernel_cmdline)
> -{
> -	/* We don't support bzImages. */
> -	return false;
> -}
> -
>  struct fdt_prop {
>  	void *value;
>  	int size;
> 
