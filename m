Received: from mail-by2lp0238.outbound.protection.outlook.com ([207.46.163.238]:49330
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6824816Ab3HHSlIDEZxP (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 8 Aug 2013 20:41:08 +0200
Message-ID: <5203E639.6010100@caviumnetworks.com>
Date: Thu, 8 Aug 2013 11:40:57 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Discard .eh_frame sections in linker script.
References: <1375987013-3599-1-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1375987013-3599-1-git-send-email-ddaney.cavm@gmail.com>
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
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20130808184057.nroRhiVTIcwseR5dQowFGiMERt5C-N-CXCLeNFug5m8@z>

On 08/08/2013 11:36 AM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
>
> Some toolchains (including Cavimu OCTEON SDK) are emitting .eh_frame

... Obvious spelling error  ^^^^^^^

I will fix it and resend.

> sections by default.  Discard them as they are useless in the kernel.
>
> Signed-off-by: David Daney <david.daney@cavium.com>
> ---
>   arch/mips/kernel/vmlinux.lds.S | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index 05826d2..3b46f7c 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -179,5 +179,6 @@ SECTIONS
>   		*(.options)
>   		*(.pdr)
>   		*(.reginfo)
> +		*(.eh_frame)
>   	}
>   }
>
