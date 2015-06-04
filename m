Received: from ozlabs.org ([103.22.144.67]:47082 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27007193AbbFDKUhJ2Afi (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 4 Jun 2015 12:20:37 +0200
In-Reply-To: <1433308225-13874-1-git-send-email-robh@kernel.org>
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: of: clean-up unnecessary libfdt include paths
Message-ID: <20150604102032.DF5B4140280@ozlabs.org>
Date: Thu,  4 Jun 2015 20:20:32 +1000 (AEST)
Return-Path: <michael@ozlabs.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@linaro.org>, linuxppc-dev@lists.ozlabs.org
Message-ID: <20150604102032.KAqmHOSQjHx4P84tBjxPKARzHTB1dm7eIERzrFWJhdM@z>

On Wed, 2015-03-06 at 05:10:25 UTC, Rob Herring wrote:
> With the latest dtc import include fixups, it is no longer necessary to
> add explicit include paths to use libfdt. Remove these across the
> kernel.

What are the "latest dtc import include fixups" ?

> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index c1ebbda..c16e836 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -2,7 +2,6 @@
>  # Makefile for the linux kernel.
>  #
>  
> -CFLAGS_prom.o		= -I$(src)/../../../scripts/dtc/libfdt
>  CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
>  
>  subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror

Acked-by: Michael Ellerman <mpe@ellerman.id.au>


cheers
