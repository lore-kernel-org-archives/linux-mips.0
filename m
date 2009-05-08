Received: from mail-gx0-f157.google.com ([209.85.217.157]:59349 "EHLO
	mail-gx0-f157.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S20025089AbZEHPZm convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 8 May 2009 16:25:42 +0100
MIME-Version: 1.0
In-Reply-To: <20090504225719.GA22417@cuplxvomd02.corp.sa.net>
References: <20090504225719.GA22417@cuplxvomd02.corp.sa.net>
Date: Fri, 8 May 2009 11:25:35 -0400
Message-ID: <7d1d9c250905080825n62f46b2bk254a736d3bce2ec6@mail.gmail.com>
Subject: Re: [PATCH 2/3] mips:powertv: Make kernel command line size
	configurable (resend)
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <paul.gortmaker@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David VomLehn <dvomlehn@cisco.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20090508152535.m_I7J86Q2UkaysJyeKgl_rJxZDw5kb59eGSxfbt0cvI@z>

On Mon, May 4, 2009 at 6:57 PM, David VomLehn <dvomlehn@cisco.com> wrote:
> Most platforms can get by perfectly well with the default command line size,
> but some platforms need more. This patch allows the command line size to
> be configured for those platforms that need it. The default remains 256
> characters.

The one thing I see when I look at this patch, is that it lands in the
arch/mips/Kconfig -- but is there really anything fundamentally
architecture specific about the allowed length of the kernel command
line?.  It probably belongs somewhere alongside the setting for
LOG_BUF_LEN or similar (and then add the other respective changes
to make all arch actually respect the setting.)

Paul.

>
> Signed-off-by: David VomLehn <dvomlehn@cisco.com>
> ---
>  arch/mips/Kconfig             |    7 +++++++
>  arch/mips/include/asm/setup.h |    2 +-
>  2 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 998e5db..99f7b6d 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -780,6 +780,13 @@ config EARLY_PRINTK
>  config SYS_HAS_EARLY_PRINTK
>        bool
>
> +config COMMAND_LINE_SIZE
> +       int "Maximum size of command line passed to kernel from bootloader"
> +       default 256
> +       help
> +         Most systems work well with the default value, but some bootloaders pass more
> +         information on the command line than others. A smaller value is good here.
> +
>  config HOTPLUG_CPU
>        bool
>        default n
> diff --git a/arch/mips/include/asm/setup.h b/arch/mips/include/asm/setup.h
> index e600ced..132e397 100644
> --- a/arch/mips/include/asm/setup.h
> +++ b/arch/mips/include/asm/setup.h
> @@ -1,7 +1,7 @@
>  #ifndef _MIPS_SETUP_H
>  #define _MIPS_SETUP_H
>
> -#define COMMAND_LINE_SIZE      256
> +#define COMMAND_LINE_SIZE      CONFIG_COMMAND_LINE_SIZE
>
>  #ifdef  __KERNEL__
>  extern void setup_early_printk(void);
>
>
