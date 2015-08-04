Received: from mail-bl2on0076.outbound.protection.outlook.com ([65.55.169.76]:13568
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012442AbbHDUCNDbeRb (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 4 Aug 2015 22:02:13 +0200
Message-ID: <55C11A37.5070509@caviumnetworks.com>
Date: Tue, 4 Aug 2015 13:01:59 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: MIPS: Make set_pte() SMP safe.
References: <1438649323-1082-1-git-send-email-ddaney.cavm@gmail.com> <55C10F4B.2050003@imgtec.com>
In-Reply-To: <55C10F4B.2050003@imgtec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20150804200159.8EA4Fd4a08kDhdbWuJYKMJvUUSo2PeUuXKJ8bn_SiLo@z>

On 08/04/2015 12:15 PM, Leonid Yegoshin wrote:
> David,
>
> Did you observe this in real?

Yes.  It is not hypothetical.


> The function __get_vm_area_node() allocates a guard page if flag
> VM_NO_GUARD is not used and I don't see any use of it in source.
>
> In past vmap allocated a guard page even unconditionally.

It has nothing to do with guard pages per se.  The problem is if a vmap 
range (including guard page) ends on an even PFN.  The buddy code will 
clobber the PTE for PFN+1.  If another vmap operation is executing in 
set_pte() for the clobbered location, you can get corrupted page tables.


>
> - Leonid.
>
