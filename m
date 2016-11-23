Received: from mail-sn1nam01on0063.outbound.protection.outlook.com ([104.47.32.63]:49408
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993008AbcKWM0WZTbxP (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 23 Nov 2016 13:26:22 +0100
Subject: Re: [PATCH 0/5] Enable KASLR for OCTEON platforms.
References: <088264c9-75b8-37ff-6514-0f536b1f8e55@cavium.com>
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <954fe857-52c8-cab2-d947-db2b0673f7a1@cavium.com>
Date: Wed, 23 Nov 2016 06:26:11 -0600
MIME-Version: 1.0
In-Reply-To: <088264c9-75b8-37ff-6514-0f536b1f8e55@cavium.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
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
Message-ID: <20161123122611.LZc1TByoKyM_jD5GeWeUWvXI6nLksp4wzs1_H88KQlg@z>

On 11/22/2016 01:43 PM, Steven J. Hill wrote:
> This patchset enables support of KASLR for OCTEON platforms.
> 
> Steven J. Hill (5):
>   MIPS: FW: Make fw_init_cmdline() to be __weak.
>   MIPS: Fix vmlinux.64 target for CONFIG_RELOCATABLE
>   MIPS: OCTEON: Add fw_init_cmdline() for Cavium platforms.
>   MIPS: OCTEON: Add plat_get_fdt() function for Cavium platforms.
>   MIPS: OCTEON: Enable KASLR
> 
>  arch/mips/Kconfig               |  3 ++-
>  arch/mips/Makefile              |  5 +++++
>  arch/mips/cavium-octeon/setup.c | 23 +++++++++++++++++++++++
>  arch/mips/include/asm/fw/fw.h   |  2 +-
>  4 files changed, 31 insertions(+), 2 deletions(-)
> 
My apologies for the incomplete patchset. I pulled the trigger a
little early and did not include the code necessary for SMP to
work properly. I will do a second version for patch 5/5 only.

Steve
