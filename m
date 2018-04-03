Received: from mail-pl0-x242.google.com ([IPv6:2607:f8b0:400e:c01::242]:37449
        "EHLO mail-pl0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993856AbeDCWjmTMLZy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 4 Apr 2018 00:39:42 +0200
Received: by mail-pl0-x242.google.com with SMTP id v5-v6so9132462plo.4
        for <linux-mips@linux-mips.org>; Tue, 03 Apr 2018 15:39:42 -0700 (PDT)
Date: Tue, 03 Apr 2018 15:39:34 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] lib: Rename compiler intrinsic selects to GENERIC_LIB_*
In-Reply-To: <1522747466-22081-2-git-send-email-matt.redfearn@mips.com>
From: Palmer Dabbelt <palmer@sifive.com>
Message-ID: <mhng-58affcc9-9eff-4403-861e-e40aea063afc@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-Path: <palmer@sifive.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: antonynpavlov@gmail.com, jhogan@kernel.org, ralf@linux-mips.org, linux-mips@linux-mips.org, matt.redfearn@mips.com, mcgrof@kernel.org, robin.murphy@arm.com, geert@linux-m68k.org, linux-riscv@lists.infradead.org, clm@fb.com, ynorov@caviumnetworks.com, jk@ozlabs.org, f.fainelli@gmail.com, Greg KH <gregkh@linuxfoundation.org>, akpm@linux-foundation.org, bart.vanassche@wdc.com, robh@kernel.org, terrelln@fb.com, dan.j.williams@intel.com, albert@sifive.com, viro@zeniv.linux.org.uk, tom@quantonium.net, linux-kernel@vger.kernel.org, richard@nod.at, paulmck@linux.vnet.ibm.com
Message-ID: <20180403223934.gpsOnznRCjswHi3rPTOik27XT3ApfOTeYfdUhuV3gxU@z>

On Tue, 03 Apr 2018 02:24:25 PDT (-0700), matt.redfearn@mips.com wrote:
> When these are included into arch Kconfig files, maintaining
> alphabetical ordering of the selects means these get split up. To allow
> for keeping things tidier and alphabetical, rename the selects to
> GENERIC_LIB_*
>
> Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>
> ---
>
> Changes in v5: None
> Changes in v4:
> Rename Kconfig symbols GENERIC_* -> GENERIC_LIB_*
>
> Changes in v3: None
> Changes in v2: None
>
>  arch/riscv/Kconfig |  6 +++---
>  lib/Kconfig        | 12 ++++++------
>  lib/Makefile       | 12 ++++++------
>  3 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 04807c7f64cc..20185aaaf933 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -104,9 +104,9 @@ config ARCH_RV32I
>  	bool "RV32I"
>  	select CPU_SUPPORTS_32BIT_KERNEL
>  	select 32BIT
> -	select GENERIC_ASHLDI3
> -	select GENERIC_ASHRDI3
> -	select GENERIC_LSHRDI3
> +	select GENERIC_LIB_ASHLDI3
> +	select GENERIC_LIB_ASHRDI3
> +	select GENERIC_LIB_LSHRDI3
>
>  config ARCH_RV64I
>  	bool "RV64I"
> diff --git a/lib/Kconfig b/lib/Kconfig
> index e96089499371..e54ebe00937e 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -588,20 +588,20 @@ config STRING_SELFTEST
>
>  endmenu
>
> -config GENERIC_ASHLDI3
> +config GENERIC_LIB_ASHLDI3
>  	bool
>
> -config GENERIC_ASHRDI3
> +config GENERIC_LIB_ASHRDI3
>  	bool
>
> -config GENERIC_LSHRDI3
> +config GENERIC_LIB_LSHRDI3
>  	bool
>
> -config GENERIC_MULDI3
> +config GENERIC_LIB_MULDI3
>  	bool
>
> -config GENERIC_CMPDI2
> +config GENERIC_LIB_CMPDI2
>  	bool
>
> -config GENERIC_UCMPDI2
> +config GENERIC_LIB_UCMPDI2
>  	bool
> diff --git a/lib/Makefile b/lib/Makefile
> index a90d4fcd748f..7425e177f08c 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -253,9 +253,9 @@ obj-$(CONFIG_SBITMAP) += sbitmap.o
>  obj-$(CONFIG_PARMAN) += parman.o
>
>  # GCC library routines
> -obj-$(CONFIG_GENERIC_ASHLDI3) += ashldi3.o
> -obj-$(CONFIG_GENERIC_ASHRDI3) += ashrdi3.o
> -obj-$(CONFIG_GENERIC_LSHRDI3) += lshrdi3.o
> -obj-$(CONFIG_GENERIC_MULDI3) += muldi3.o
> -obj-$(CONFIG_GENERIC_CMPDI2) += cmpdi2.o
> -obj-$(CONFIG_GENERIC_UCMPDI2) += ucmpdi2.o
> +obj-$(CONFIG_GENERIC_LIB_ASHLDI3) += ashldi3.o
> +obj-$(CONFIG_GENERIC_LIB_ASHRDI3) += ashrdi3.o
> +obj-$(CONFIG_GENERIC_LIB_LSHRDI3) += lshrdi3.o
> +obj-$(CONFIG_GENERIC_LIB_MULDI3) += muldi3.o
> +obj-$(CONFIG_GENERIC_LIB_CMPDI2) += cmpdi2.o
> +obj-$(CONFIG_GENERIC_LIB_UCMPDI2) += ucmpdi2.o

Sorry, I'm not sure if this is the right patch -- someone suggested acking 
this, but it's already Review-By me and if I understand correctly it's going 
through your tree.  I'm a bit new to this, but if it helps then here's a

Acked-By: Palmer Dabbelt <palmer@sifive.com>
