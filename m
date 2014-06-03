Received: from localhost.localdomain ([127.0.0.1]:44171 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6843095AbaFCJehTHv17 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 3 Jun 2014 11:34:37 +0200
Date: Tue, 3 Jun 2014 11:34:34 +0200
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] MIPS: Kconfig: microMIPS and SmartMIPS are mutually
 exclusive
Message-ID: <20140603093434.GQ17197@linux-mips.org>
References: <1401785177-7904-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401785177-7904-1-git-send-email-markos.chandras@imgtec.com>
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20140603093434.UJPMnY13rDNndm5WWd6dwi0CpfeUxOnhnKNTr7WZ6gA@z>

On Tue, Jun 03, 2014 at 09:46:17AM +0100, Markos Chandras wrote:

> Warning: the 32-bit microMIPS architecture does not support the `smartmips'
> extension
> arch/mips/kernel/entry.S:90: Error: unrecognized opcode `mtlhx $24'
> [...]
> arch/mips/kernel/entry.S:109: Error: unrecognized opcode `mtlhx $24'
> 
> Link: https://dmz-portal.mips.com/bugz/show_bug.cgi?id=1021
> Reviewed-by: Steven J. Hill <Steven.Hill@imgtec.com>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 2fe8e60..ffde3d6 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2063,7 +2063,7 @@ config ARCH_PHYS_ADDR_T_64BIT
>         def_bool 64BIT_PHYS_ADDR
>  
>  config CPU_HAS_SMARTMIPS
> -	depends on SYS_SUPPORTS_SMARTMIPS
> +	depends on SYS_SUPPORTS_SMARTMIPS && !CPU_MICROMIPS
>  	bool "Support for the SmartMIPS ASE"
>  	help
>  	  SmartMIPS is a extension of the MIPS32 architecture aimed at
