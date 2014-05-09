Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:7511 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6854774AbaEIP6NRF6FP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 May 2014 17:58:13 +0200
Date: Fri, 9 May 2014 21:35:09 +0530
From: Jayachandran C. <jchandra@broadcom.com>
Subject: Re: [PATCH RFC 0/5] Mapped kernel support for Broadcom XLP
Message-ID: <20140509160508.GA14124@jayachandranc.netlogicmicro.com>
References: <1399649304-25856-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1399649304-25856-1-git-send-email-jchandra@broadcom.com>
Return-Path: <jchandra@broadcom.com>
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
Cc: ralf@linux-mips.org
Message-ID: <20140509160509.bEerQZ2T14E-qwbkeDZjJG7ZR6sxY_-yZXb1I7DLAg0@z>

On Fri, May 09, 2014 at 08:58:20PM +0530, Jayachandran C wrote:
> This patchset adds support for loading a XLR/XLP kernel compiled with a
> CKSEG2 load address.
> 
> The changes are to:
>  - move the existing MAPPED_KERNEL option from sgi-ip27 to common config
>  - Add a plat_mem_fixup function to arch_mem_init which will allow
>    the platform to calculate the kernel wired TLB entries and save
>    them so that all the CPUs can set them up at boot.
>  - Update PAGE_OFFSET, MAP_BASE and MODULE_START when mapped kernel
>    is enabled.
>  - Update compressed kernel code to generate the final executable in
>    KSEG0 and map the load address of the embedded kernel before loading
>    it.
>  - Use wired entries of sizes 256M/1G/4G to map the available memory on
>    XLP9xx and XLP2xx
> 
> Comments and suggestions welcome.

Looks like I missed a patch while sending this out. Will send the full
patchset again (and fix it up in patchwork).

JC.
