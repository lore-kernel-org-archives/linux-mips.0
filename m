Received: from mail-eopbgr710121.outbound.protection.outlook.com ([40.107.71.121]:34367
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991346AbeKTWLRl3yc2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Nov 2018 23:11:17 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH V5 3/8] MIPS: Ensure pmd_present() returns false after
  pmd_mknotpresent()
Date: Tue, 20 Nov 2018 22:11:12 +0000
Message-ID: <MWHPR2201MB1277A8CB4488D38A4A2DE074C1D90@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1542268439-4146-4-git-send-email-chenhc@lemote.com>
In-Reply-To: <1542268439-4146-4-git-send-email-chenhc@lemote.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, "Steven J . Hill" <Steven.Hill@cavium.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "# 3 . 8+" <stable@vger.kernel.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181120221112.tKncjvY_4JDQ3ZLxq4fYe95a8DwD6yDBIJz4zG3_tQs@z>

Hello,

Huacai Chen wrote:
> This patch is borrowed from ARM64 to ensure pmd_present() returns false
> after pmd_mknotpresent(). This is needed for THP.
> 
> Cc: <stable@vger.kernel.org> # 3.8+
> References: 5bb1cc0ff9a6 ("arm64: Ensure pmd_present() returns false after pmd_mknotpresent()")
> Reviewed-by: James Hogan <jhogan@kernel.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
