Received: from mail-eopbgr770129.outbound.protection.outlook.com ([40.107.77.129]:28260
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993032AbeKMWWUrQ0lu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:22:20 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Remove GCC_IMM_ASM & GCC_REG_ACCUM macros
Date: Tue, 13 Nov 2018 22:22:18 +0000
Message-ID: <CY4PR2201MB1272BFF6F9737CF238ABFBEDC1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20181107230454.3232-1-paul.burton@mips.com>
In-Reply-To: <20181107230454.3232-1-paul.burton@mips.com>
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
Message-ID: <20181113222218.wcXMvU1irI6JjNGKfvV_uiO9jpWjIxYWGWWnBhg7o1E@z>

Hello,

Paul Burton wrote:
> asm/compiler.h defined GCC_IMM_ASM & GCC_REG_ACCUM macros, both of which
> are defined differently for GCC pre-3.4 or GCC 3.4 & higher. We only
> support building with GCC 4.6 & higher since commit cafa0010cd51 ("Raise
> the minimum required gcc version to 4.6"), which makes the pre-3.4
> definition dead code.
> 
> Rather than leave the macro definitions around, inline the GCC 3.4 &
> higher definitions into the single file that uses them & remove the
> macros entirely.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
