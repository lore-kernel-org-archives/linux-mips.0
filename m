Received: from mailapp01.imgtec.com ([195.59.15.196]:43144 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028544AbcEMKDbO3wkP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 May 2016 12:03:31 +0200
Subject: Re: [PATCH] MIPS: Descend into arch/mips/boot/tools while cleaning
References: <20160512072127.GQ16402@linux-mips.org>
 <1463097704-23755-1-git-send-email-f.fainelli@gmail.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <5735A66C.4030706@imgtec.com>
Date: Fri, 13 May 2016 11:03:24 +0100
MIME-Version: 1.0
In-Reply-To: <1463097704-23755-1-git-send-email-f.fainelli@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@linux-mips.org
Cc: ralf@linux-mips.org, macro@imgtec.com
Message-ID: <20160513100324.rIheWOA38tJExtgwb9gT0eR48tZIcifwibso5wiKiT0@z>

And this one.

Acked-by: Matt Redfearn <matt.redfearn@imgtec.com>

On 13/05/16 01:01, Florian Fainelli wrote:
> arch/mips/boot/tools/relocs was not being cleaned since we did not wire
> this directory into the archclean target, fix that.
>
> Fixes: 5f552da15721 ("MIPS: tools: Add relocs tool")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   arch/mips/Makefile | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 8388ef6a0044..c0b002a09bef 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -404,6 +404,7 @@ endif
>   archclean:
>   	$(Q)$(MAKE) $(clean)=arch/mips/boot
>   	$(Q)$(MAKE) $(clean)=arch/mips/boot/compressed
> +	$(Q)$(MAKE) $(clean)=arch/mips/boot/tools
>   	$(Q)$(MAKE) $(clean)=arch/mips/lasat
>   
>   define archhelp
