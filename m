Received: from mail-eopbgr710121.outbound.protection.outlook.com ([40.107.71.121]:34367
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993663AbeKTWLSMQli2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Nov 2018 23:11:18 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH V5 5/8] MIPS: Align kernel load address to 64KB
Date: Tue, 20 Nov 2018 22:11:15 +0000
Message-ID: <MWHPR2201MB1277489B15D7A3C78862C184C1D90@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1542268439-4146-6-git-send-email-chenhc@lemote.com>
In-Reply-To: <1542268439-4146-6-git-send-email-chenhc@lemote.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, "Steven J . Hill" <Steven.Hill@cavium.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "# 2 . 6 . 36+" <stable@vger.kernel.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181120221115._86Z7WhCxxNiTBuXmv_uk9lHtONUyV5rt9eEwS41nSA@z>

Hello,

Huacai Chen wrote:
> KEXEC needs the new kernel's load address to be aligned on a page
> boundary (see sanity_check_segment_list()), but on MIPS the default
> vmlinuz load address is only explicitly aligned to 16 bytes.
> 
> Since the largest PAGE_SIZE supported by MIPS kernels is 64KB, increase
> the alignment calculated by calc_vmlinuz_load_addr to 64KB.
> 
> Cc: <stable@vger.kernel.org>  # 2.6.36+
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
