Received: from mail-dm3nam03on0086.outbound.protection.outlook.com ([104.47.41.86]:12736
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991957AbcLISq6o3u7u (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 9 Dec 2016 19:46:58 +0100
Subject: Re: [PATCH] MIPS: OCTEON: Enable KASLR
References: <4bc97883-39b4-1a00-6e06-518c598bbf3c@cavium.com>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <bb09e7fa-d13d-979d-8496-83006014cedc@caviumnetworks.com>
Date: Fri, 9 Dec 2016 10:46:44 -0800
MIME-Version: 1.0
In-Reply-To: <4bc97883-39b4-1a00-6e06-518c598bbf3c@cavium.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Steven J. Hill" <Steven.Hill@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20161209184644.3TlSN2OnbeOfP5CqFsTNQIhSl-OSsxwKcZg4D9AkY-Q@z>

On 12/09/2016 01:35 AM, Steven J. Hill wrote:
> This patch enables KASLR for OCTEON systems. The SMP startup code is
> such that the secondaries monitor the volatile variable
> 'octeon_processor_relocated_kernel_entry' for any non-zero value.
> The 'plat_post_relocation hook' is used to set that value to the
> kernel entry point of the relocated kernel. The secondary CPUs will
> then jumps to the new kernel, perform their initialization again
> and begin waiting for the boot CPU to start them via the relocated
> loop 'octeon_spin_wait_boot'. Inspired by Steven's code from Cavium.
>
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
> Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
> ---
>  arch/mips/Kconfig                                         |  3 ++-
>  arch/mips/cavium-octeon/smp.c                             |  7 +++++--
>  .../include/asm/mach-cavium-octeon/kernel-entry-init.h    | 15 ++++++++++++++-
>  3 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index b3c5bde..65d7e20 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -909,6 +909,7 @@ config CAVIUM_OCTEON_SOC
>  	select NR_CPUS_DEFAULT_16
>  	select BUILTIN_DTB
>  	select MTD_COMPLEX_MAPPINGS
> +	select SYS_SUPPORTS_RELOCATABLE
>  	help
>  	  This option supports all of the Octeon reference boards from Cavium
>  	  Networks. It builds a kernel that dynamically determines the Octeon
> @@ -2570,7 +2571,7 @@ config SYS_SUPPORTS_NUMA
>
>  config RELOCATABLE
>  	bool "Relocatable kernel"
> -	depends on SYS_SUPPORTS_RELOCATABLE && (CPU_MIPS32_R2 || CPU_MIPS64_R2 || CPU_MIPS32_R6 || CPU_MIPS64_R6)
> +	depends on SYS_SUPPORTS_RELOCATABLE && (CPU_MIPS32_R2 || CPU_MIPS64_R2 || CPU_MIPS32_R6 || CPU_MIPS64_R6 || CAVIUM_OCTEON_SOC)
>  	help
>  	  This builds a kernel image that retains relocation information
>  	  so it can be loaded someplace besides the default 1MB.
> diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
> index 256fe6f..65c8369 100644
> --- a/arch/mips/cavium-octeon/smp.c
> +++ b/arch/mips/cavium-octeon/smp.c
> @@ -24,12 +24,17 @@
>  volatile unsigned long octeon_processor_boot = 0xff;
>  volatile unsigned long octeon_processor_sp;
>  volatile unsigned long octeon_processor_gp;
> +#ifdef CONFIG_RELOCATABLE
> +volatile unsigned long octeon_processor_relocated_kernel_entry;
> +#endif /* CONFIG_RELOCATABLE */
>
>  #ifdef CONFIG_HOTPLUG_CPU
>  uint64_t octeon_bootloader_entry_addr;
>  EXPORT_SYMBOL(octeon_bootloader_entry_addr);
>  #endif
>
> +extern void kernel_entry(unsigned long arg1, ...);
> +
>  static void octeon_icache_flush(void)
>  {
>  	asm volatile ("synci 0($0)\n");
> @@ -333,8 +338,6 @@ void play_dead(void)
>  		;
>  }
>
> -extern void kernel_entry(unsigned long arg1, ...);
> -
>  static void start_after_reset(void)
>  {
>  	kernel_entry(0, 0, 0);	/* set a2 = 0 for secondary core */
> diff --git a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
> index c4873e8..f69611c 100644
> --- a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
> +++ b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
> @@ -99,9 +99,22 @@
>  	# to begin
>  	#
>
> +octeon_spin_wait_boot:
> +#ifdef CONFIG_RELOCATABLE
> +	PTR_LA	t0, octeon_processor_relocated_kernel_entry
> +	LONG_L	t0, (t0)
> +	beq	zero, t0, 1f
> +

This doesn't look correct.

Please explain how this code implements:

    loop here until octeon_processor_relocated_kernel_entry is set.



> +	/* If kernel has been relocated, jump to it's new entry point */
> +	move	a0, zero
> +	move	a1, zero
> +	move	a2, zero

Why change the values of a*?  Don't these registers already contain the 
proper values from the bootloader?

> +	jr	t0
> +1:
> +#endif /* CONFIG_RELOCATABLE */
> +
>  	# This is the variable where the next core to boot os stored
>  	PTR_LA	t0, octeon_processor_boot
> -octeon_spin_wait_boot:
>  	# Get the core id of the next to be booted
>  	LONG_L	t1, (t0)
>  	# Keep looping if it isn't me
>
