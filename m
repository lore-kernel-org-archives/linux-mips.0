Received: from mailapp01.imgtec.com ([195.89.28.115]:65026 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6854786AbaEIVWXUm0zy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 May 2014 23:22:23 +0200
Message-ID: <536D4707.5090207@imgtec.com>
Date: Fri, 9 May 2014 22:22:15 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 06/11] kvm tools, mips: Enable build of mips support
References: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1399391491-5021-7-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1399391491-5021-7-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20140509212215.87kSOMGUzM8RfWwJyKybFe9WBF1Tiv74OEoDrg4Tbb8@z>

Hi Andreas,

On 06/05/14 16:51, Andreas Herrmann wrote:
> From: David Daney <david.daney@cavium.com>
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> ---
>  tools/kvm/Makefile |   11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/kvm/Makefile b/tools/kvm/Makefile
> index b872651..91286ad 100644
> --- a/tools/kvm/Makefile
> +++ b/tools/kvm/Makefile
> @@ -105,7 +105,7 @@ OBJS	+= virtio/mmio.o
>  
>  # Translate uname -m into ARCH string
>  ARCH ?= $(shell uname -m | sed -e s/i.86/i386/ -e s/ppc.*/powerpc/ \
> -	  -e s/armv7.*/arm/ -e s/aarch64.*/arm64/)
> +	  -e s/armv7.*/arm/ -e s/aarch64.*/arm64/ -e s/mips64/mips/)
>  
>  ifeq ($(ARCH),i386)
>  	ARCH         := x86
> @@ -184,6 +184,15 @@ ifeq ($(ARCH), arm64)
>  	ARCH_WANT_LIBFDT := y
>  endif
>  
> +ifeq ($(ARCH),mips)
> +	DEFINES		+= -DCONFIG_MIPS
> +	ARCH_INCLUDE	:= mips/include
> +	CFLAGS		+= -I../../arch/mips/include/asm/mach-cavium-octeon
> +	CFLAGS		+= -I../../arch/mips/include/asm/mach-generic

I can't see any obvious includes from these two directories in the
previous patch. Are there any?

> +	OBJS		+= mips/kvm.o
> +	OBJS		+= mips/kvm-cpu.o
> +	OBJS		+= mips/irq.o
> +endif
>  ###
>  
>  ifeq (,$(ARCH_INCLUDE))
> 

Cheers
James
