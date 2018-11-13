Received: from mail-eopbgr770129.outbound.protection.outlook.com ([40.107.77.129]:28260
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993090AbeKMWWVLJR1u convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:22:21 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Simplify GCC_OFF_SMALL_ASM definition
Date: Tue, 13 Nov 2018 22:22:19 +0000
Message-ID: <CY4PR2201MB127217D506B0CB4D21A4B91CC1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20181107230524.3370-1-paul.burton@mips.com>
In-Reply-To: <20181107230524.3370-1-paul.burton@mips.com>
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
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181113222219.xXP_cx-A_PVIo9DDaM2wRl4XGY-O7An316fq8JUWIyg@z>

Hello,

Paul Burton wrote:
> The GCC_OFF_SMALL_ASM macro defines the constraint to use for
> instructions needing "small offsets", typically the LL or SC
> instructions. Historically these had 16 bit offsets, but microMIPS &
> MIPS32/MIPS64r6 onwards reduced the width of the offset field.
> 
> GCC 4.9 & higher supports a ZC constraint which matches the offset
> requirements of the LL & SC instructions. Where supported we can use
> the ZC constraint regardless of ISA, and it will handle the requirements
> of the ISA correctly. As such we require 3 cases:
> 
> - GCC 4.9 & higher can use ZC.
> 
> - GCC older than 4.9 must use the older R constraint, which does not
> take into account microMIPS or MIPSr6.
> 
> - microMIPS builds therefore require GCC 4.9 or higher. MIPSr6 support
> was only introduced in newer compilers anyway so it can be ignored
> here.
> 
> The current code complicates this a little by specifically having MIPSr6
> bypass the GCC version check, and using the R constraint for pre-MIPSr6
> builds even if the compiler supports ZC which would be equivalent.
> 
> Simplify this such that the code straightforwardly implements the 3
> cases outlined above.
> 
> For non-GCC compilers we presume that ZC is safe to use. In practice the
> only non-GCC compiler of interest is clang and it has supported the ZC
> constraint since version 3.7.0. It seems safe enough to presume that
> nobody will expect to built a working kernel using a clang version older
> than that, and if they do then they'll have bigger problems. As such we
> don't check the clang version number & just presume ZC is usable when
> the compiler is not GCC.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
