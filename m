Received: from mail-eopbgr710132.outbound.protection.outlook.com ([40.107.71.132]:14144
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23991965AbeKSXVDJ0m27 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Nov 2018 00:21:03 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH V5 1/8] MIPS: Loongson: Add Loongson-3A R2.1 basic support
Date: Mon, 19 Nov 2018 23:20:54 +0000
Message-ID: <MWHPR2201MB1277D0155E0BB3E9ABAAFF38C1D80@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1542268439-4146-2-git-send-email-chenhc@lemote.com>
In-Reply-To: <1542268439-4146-2-git-send-email-chenhc@lemote.com>
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
Message-ID: <20181119232054.YqB_PdWdiockY0XpuarEuz8LcH7EW0aB9e--47i7aOc@z>

Hello,

Huacai Chen wrote:
> Loongson-3A R2.1 is the bugfix revision of Loongson-3A R2.
> 
> All Loongson-3 CPU family:
> 
> Code-name         Brand-name       PRId
> Loongson-3A R1    Loongson-3A1000  0x6305
> Loongson-3A R2    Loongson-3A2000  0x6308
> Loongson-3A R2.1  Loongson-3A2000  0x630c
> Loongson-3A R3    Loongson-3A3000  0x6309
> Loongson-3A R3.1  Loongson-3A3000  0x630d
> Loongson-3B R1    Loongson-3B1000  0x6306
> Loongson-3B R2    Loongson-3B1500  0x6307
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
