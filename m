Received: from mail-sn1nam02on0097.outbound.protection.outlook.com ([104.47.36.97]:44688
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23994585AbeJIXByf1vG2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 10 Oct 2018 01:01:54 +0200
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] memblock: stop using implicit alignement to
 SMP_CACHE_BYTES
Date: Tue, 9 Oct 2018 23:01:40 +0000
Message-ID: <20181009230137.rju3lm2saou5xsa4@pburton-laptop>
References: <1538687224-17535-1-git-send-email-rppt@linux.vnet.ibm.com>
In-Reply-To: <1538687224-17535-1-git-send-email-rppt@linux.vnet.ibm.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E3554E11A6C0914FA9C02D46ED897C1C@namprd22.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Chris Zankel <chris@zankel.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Guan Xuetao <gxt@pku.edu.cn>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>
Message-ID: <20181009230140.OHDlSPK6ZZKQvnPk8fSs9jSddq2KOfRtOVBevlK23A8@z>

Hi Mike,

On Fri, Oct 05, 2018 at 12:07:04AM +0300, Mike Rapoport wrote:
> When a memblock allocation APIs are called with align = 0, the alignment is
> implicitly set to SMP_CACHE_BYTES.
> 
> Replace all such uses of memblock APIs with the 'align' parameter explicitly
> set to SMP_CACHE_BYTES and stop implicit alignment assignment in the
> memblock internal allocation functions.
> 
>%
> 
> Suggested-by: Michal Hocko <mhocko@suse.com>
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

  Acked-by: Paul Burton <paul.burton@mips.com> # MIPS part

Thanks,
    Paul
