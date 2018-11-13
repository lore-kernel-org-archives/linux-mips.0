Received: from mail-eopbgr680093.outbound.protection.outlook.com ([40.107.68.93]:6162
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993032AbeKMWUHe2w0u convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:20:07 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Let early memblock_alloc*() allocate memories
 bottom-up
Date: Tue, 13 Nov 2018 22:20:05 +0000
Message-ID: <CY4PR2201MB1272584D86653816B828DC3BC1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <1541821814-7738-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1541821814-7738-1-git-send-email-chenhc@lemote.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, "Steven J . Hill" <Steven.Hill@cavium.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181113222005.uD0A4Jt-lFC-G7toQoGgAvaBblTMPVmOtF4NVlhBLT8@z>

Hello,

Huacai Chen wrote:
> After switched to NO_BOOTMEM, there are several boot failures. Some of
> them have been fixed and some of them haven't. I find that many of them
> are because of memory allocations are top-down, while the old behavior
> is bottom-up. This patch let early memblock_alloc*() allocate memories
> bottom-up to avoid some potential problems.
> 
> References: https://patchwork.linux-mips.org/patch/21031/
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Applied to mips-fixes.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
