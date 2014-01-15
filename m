Received: from mail-bl2lp0210.outbound.protection.outlook.com ([207.46.163.210]:44033
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6827341AbaAOTMYTB3Jx (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 15 Jan 2014 20:12:24 +0100
Message-ID: <52D6DD74.60308@caviumnetworks.com>
Date: Wed, 15 Jan 2014 11:11:48 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH mips-for-linux-next] MIPS: check for -mfix-cn63xxp1 compiler
 option
References: <1389812784-30085-1-git-send-email-florian@openwrt.org>
In-Reply-To: <1389812784-30085-1-git-send-email-florian@openwrt.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <florian@openwrt.org>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, blogic@openwrt.org, david.daney@cavium.com
Message-ID: <20140115191148.pGavEfT-2Mx6mnXoyclh-Z0__00TZOxTcmUGXgHsf8g@z>

On 01/15/2014 11:06 AM, Florian Fainelli wrote:
> Attempting to build for Cavium Octeon with an unpatched or old
> toolchain will fail due to the -mfix-cn63xxp1 option being unrecognized.
> Call cc-option on this option to make sure we can safely use it.
>
> Signed-off-by: Florian Fainelli <florian@openwrt.org>

NACK.

If the chip you are building for needs -Wa,-mfix-cn63xxp1, then building 
without this option yields a system the generates random errors.  So I 
would argue that if -Wa,-mfix-cn63xxp1 is not supported by your 
assembler, breaking the build is the proper thing to do.

David Daney

> ---
>   arch/mips/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 873a0ca..f372b84 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -155,7 +155,7 @@ cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += $(call cc-option,-march=octeon) -Wa,--trap
>   ifeq (,$(findstring march=octeon, $(cflags-$(CONFIG_CPU_CAVIUM_OCTEON))))
>   cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += -Wa,-march=octeon
>   endif
> -cflags-$(CONFIG_CAVIUM_CN63XXP1) += -Wa,-mfix-cn63xxp1
> +cflags-$(CONFIG_CAVIUM_CN63XXP1) += -Wa,$(call cc-option,-mfix-cn63xxp1)
>   cflags-$(CONFIG_CPU_BMIPS)	+= -march=mips32 -Wa,-mips32 -Wa,--trap
>
>   cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)	+= $(call cc-option,-mfix-r4000,)
>
