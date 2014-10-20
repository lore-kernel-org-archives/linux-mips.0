Received: from mailapp01.imgtec.com ([195.59.15.196]:47597 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011798AbaJTNT0Re1oA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 20 Oct 2014 15:19:26 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 1E61E2D689F02
        for <linux-mips@linux-mips.org>; Mon, 20 Oct 2014 14:19:17 +0100 (IST)
Message-ID: <54450BD6.1000806@imgtec.com>
Date: Mon, 20 Oct 2014 14:19:18 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: ath79: fix compilation error when CONFIG_PCI is
 disabled
References: <CAMuHMdV3cGsW3iONgHHsMgVcoOqjLDoiE5u-+62M=6+fOYsj4Q@mail.gmail.com> <1413810699-44465-1-git-send-email-stefan.hengelein@fau.de>
In-Reply-To: <1413810699-44465-1-git-send-email-stefan.hengelein@fau.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Message-ID: <20141020131918.VPvZ_yNmM2VeCYQ52El8Pc61lavre9t9jMS5UCUKJDQ@z>

On 10/20/2014 02:11 PM, Stefan Hengelein wrote:
> When CONFIG_PCI is disabled, 'db120_pci_init()' had a different
> signature than when was enabled. Therefore, compilation failed when
> CONFIG_PCI was not present.
> 
> arch/mips/ath79/mach-db120.c:132: error: too many arguments to function 'db120_pci_init'
> 
> This error was found with vampyr.
> 
> Signed-off-by: Stefan Hengelein <stefan.hengelein@fau.de>
> 
> ---
> Changelog:
> v2: fix prototype instead of removing the caller
> ---
>  arch/mips/ath79/mach-db120.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/ath79/mach-db120.c b/arch/mips/ath79/mach-db120.c
> index 4d661a1..9423f5a 100644
> --- a/arch/mips/ath79/mach-db120.c
> +++ b/arch/mips/ath79/mach-db120.c
> @@ -113,7 +113,7 @@ static void __init db120_pci_init(u8 *eeprom)
>  	ath79_register_pci();
>  }
>  #else
> -static inline void db120_pci_init(void) {}
> +static inline void db120_pci_init(u8 *eeprom) {}
>  #endif /* CONFIG_PCI */
>  
>  static void __init db120_setup(void)
> 
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos
