Received: from mail-he1eur01on0117.outbound.protection.outlook.com ([104.47.0.117]:52404
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27041659AbcFQMFpLaapA (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 17 Jun 2016 14:05:45 +0200
Date: Fri, 17 Jun 2016 15:00:15 +0300
From: Aaro Koskinen <aaro.koskinen@nokia.com>
Subject: Re: [PATCH] MIPS: Fix page table corruption on THP permission
 changes.
Message-ID: <20160617120015.GJ3012@ak-desktop.emea.nsn-net.net>
References: <1466117431-18020-1-git-send-email-ddaney.cavm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1466117431-18020-1-git-send-email-ddaney.cavm@gmail.com>
Return-Path: <aaro.koskinen@nokia.com>
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
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20160617120015.NlMJHLrdOv8wKbOmS7mYKGcuAeCm82_4Zf8fkSFgFcw@z>

Hi,

On Thu, Jun 16, 2016 at 03:50:31PM -0700, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
> 
> When the core THP code is modifying the permissions of a huge page it
> calls pmd_modify(), which unfortunately was clearing the _PAGE_HUGE bit
> of the page table entry.  The result can be kernel messages like:
> 
> mm/memory.c:397: bad pmd 000000040080004d.

[...]

> BUG: Bad rss-counter state mm:80000003fa168000 idx:1 val:1536
> 
> Fix by not clearing _PAGE_HUGE bit.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/mips/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index a6b611f..477b1b1 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -632,7 +632,7 @@ static inline struct page *pmd_page(pmd_t pmd)
>  
>  static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  {
> -	pmd_val(pmd) = (pmd_val(pmd) & _PAGE_CHG_MASK) | pgprot_val(newprot);
> +	pmd_val(pmd) = (pmd_val(pmd) & (_PAGE_CHG_MASK | _PAGE_HUGE)) | pgprot_val(newprot);
>  	return pmd;
>  }

The fix looks correct, but unfortunately at least EBH5600 still keeps
crashing with THP enabled. :-(

[  606.429974] Got mcheck at 000000ffebed8c2c
[  606.442262] CPU: 6 PID: 6767 Comm: ld Not tainted 4.7.0-rc3-octeon-distro.git-v2.17-27-g5cc128c-12208-g7d9ecdf #1
[  606.473026] task: 800000041f384880 ti: 80000000ed7b0000 task.ti: 80000000ed7b0000
[  606.495454] $ 0   : 0000000000000000 3e000000038ac006 000000ffebba7028 000000ffebb9f020
[  606.519588] $ 4   : 0000000001529d94 00000001204f4236 0000000000000000 0000000000000000
[  606.543722] $ 8   : 0000000000000001 7efefefefefefeff ffa0a0998d9e9c8b 8101010101010100
[  606.567856] $12   : 4040404040404040 ffffffff84080018 0000000000000000 6162002e74657874
[  606.591991] $16   : 000000012032a7d0 00000001204f4229 00000001201483f0 0000000000000000
[  606.616125] $20   : 0000000000000000 000000000000000c 00000000053cd125 00000001204edb70
[  606.640259] $24   : 0000000000000034 000000ffebed8b50                                  
[  606.664393] $28   : 000000ffebfac000 000000ffff808160 00000001204b9ad0 000000ffebed9cc8
[  606.688528] Hi    : 0000000000001001
[  606.699237] Lo    : 00000000000014f4
[  606.709951] epc   : 000000ffebed8c2c 0xffebed8c2c
[  606.724048] ra    : 000000ffebed9cc8 0xffebed9cc8
[  606.738144] Status: 00308cf3	KX SX UX USER EXL IE 
[  606.752704] Cause : 00800060 (ExcCode 18)
[  606.764717] PrId  : 000d0409 (Cavium Octeon+)
[  606.777770] Index    : 80000000
[  606.787178] PageMask : 1fe000
[  606.796064] EntryHi  : 000000012032a095
[  606.807555] EntryLo0 : 00000000038a8006
[  606.819046] EntryLo1 : 00000000038ac006
[  606.830535] Wired    : 0
[  606.838120] PageGrain: e0000000
[  606.847525] 
[  606.851986] Index: 40 pgmask=4kb va=0ffebba6000 asid=95
	[ri=0 xi=1 pa=0041d2b2000 c=0 d=1 v=1 g=0] [ri=0 xi=1 pa=0041d2b3000 c=0 d=1 v=1 g=0]
[  606.890740] Index: 41 pgmask=4kb va=0ffebbb6000 asid=95
	[ri=0 xi=1 pa=0041d26e000 c=0 d=1 v=1 g=0] [ri=0 xi=1 pa=0041d26f000 c=0 d=1 v=1 g=0]
[  606.929492] Index: 42 pgmask=4kb va=00120148000 asid=95
	[ri=0 xi=0 pa=0041d6b7000 c=0 d=1 v=1 g=0] [ri=0 xi=0 pa=0041dcd1000 c=0 d=1 v=1 g=0]
[  606.968241] Index: 43 pgmask=4kb va=0012012c000 asid=95
	[ri=0 xi=1 pa=000e30e9000 c=0 d=1 v=1 g=0] [ri=0 xi=0 pa=0041e5f8000 c=0 d=1 v=1 g=0]
[  607.006990] Index: 44 pgmask=4kb va=001204ec000 asid=95
	[ri=0 xi=0 pa=000e317e000 c=0 d=1 v=1 g=0] [ri=0 xi=0 pa=000e32cf000 c=0 d=1 v=1 g=0]
[  607.045743] Index: 45 pgmask=4kb va=001204fe000 asid=95
	[ri=0 xi=0 pa=000e4206000 c=0 d=1 v=1 g=0] [ri=0 xi=0 pa=000e308f000 c=0 d=1 v=1 g=0]
[  607.084493] Index: 46 pgmask=4kb va=001204f4000 asid=95
	[ri=0 xi=0 pa=000e31d0000 c=0 d=1 v=1 g=0] [ri=0 xi=0 pa=000e2874000 c=0 d=1 v=1 g=0]
[  607.123243] Index: 47 pgmask=4kb va=0ffebd3c000 asid=95
	[ri=0 xi=0 pa=000ef2fc000 c=0 d=0 v=1 g=0] [ri=0 xi=0 pa=000ef01f000 c=0 d=0 v=1 g=0]
[  607.161992] Index: 48 pgmask=4kb va=0ffebf28000 asid=95
	[ri=0 xi=0 pa=000e3adf000 c=0 d=0 v=1 g=0] [ri=0 xi=0 pa=000e3ade000 c=0 d=0 v=1 g=0]
[  607.200741] Index: 49 pgmask=4kb va=0ffff808000 asid=95
	[ri=0 xi=0 pa=000e34a8000 c=0 d=1 v=1 g=0] [ri=0 xi=0 pa=000e43bb000 c=0 d=1 v=1 g=0]
[  607.239489] Index: 50 pgmask=4kb va=0ffebfa4000 asid=95
	[ri=0 xi=1 pa=000e35c6000 c=0 d=1 v=1 g=0] [ri=0 xi=1 pa=000e31eb000 c=0 d=1 v=1 g=0]
[  607.278238] Index: 51 pgmask=4kb va=0ffebed8000 asid=95
	[ri=0 xi=0 pa=000e3dce000 c=0 d=0 v=1 g=0] [ri=0 xi=0 pa=000e49ed000 c=0 d=0 v=1 g=0]
[  607.316985] Index: 52 pgmask=4kb va=00120274000 asid=95
	[ri=0 xi=0 pa=00000000000 c=0 d=0 v=0 g=0] [ri=0 xi=1 pa=00000000000 c=2 d=1 v=1 g=0]
[  607.355734] 
[  607.360192] 
Code: de100000  12000014  00000000 <de020010> 1456fffb  df9991d0  de040008  0320f809  0220282d 
[  607.389654] Kernel panic - not syncing: Caught Machine Check exception - caused by multiple matching entries in the TLB.
[  607.422806] ---[ end Kernel panic - not syncing: Caught Machine Check exception - caused by multiple matching entries in the TLB.

*** NMI Watchdog interrupt on Core 0x0 ***

A.
