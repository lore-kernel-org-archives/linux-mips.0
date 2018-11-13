Received: from mail-eopbgr770105.outbound.protection.outlook.com ([40.107.77.105]:14240
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993032AbeKMWWOTMQ0u convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:22:14 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 1/2] MIPS: Use Kconfig to select CPU_NO_EFFICIENT_FFS
Date: Tue, 13 Nov 2018 22:22:12 +0000
Message-ID: <CY4PR2201MB1272B73DDE21899898EB23BEC1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20181108234409.21199-1-paul.burton@mips.com>
In-Reply-To: <20181108234409.21199-1-paul.burton@mips.com>
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
To: Paul Burton <pburton@wavecomp.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>Andrew Morton <akpm@linux-foundation.org>Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181113222212.UEWlzUQB_cSI1uvaCzRxKVGJtaatTePVdRLNLEgGIo8@z>

Hello,

Paul Burton wrote:
> Select CONFIG_CPU_NO_EFFICIENT_FFS via Kconfig when the kernel is
> configured for a pre-MIPS32r1 CPU, rather than defining its equivalent
> in asm/cpu-features.h based upon overrides of cpu_has_mips* macros.
> 
> The latter only works if a platform has an cpu-feature-overrides.h
> header which defines cpu_has_mips* macros, which are not generally
> needed. There are many cases where we know that the target ISA for a
> kernel build is MIPS32r1 or later & thus includes the CLZ instruction,
> without requiring any overrides from the platform. Using Kconfig allows
> us to take those into account, and more naturally make a decision about
> instruction support using information about the target ISA.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>

Series applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
