Received: from mail-eopbgr780111.outbound.protection.outlook.com ([40.107.78.111]:52303
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993828AbeKZSWriVZfw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Nov 2018 19:22:47 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Enable dead code elimination
Date: Mon, 26 Nov 2018 18:22:45 +0000
Message-ID: <MWHPR2201MB12771CB00C8821F0FC62B94EC1D70@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181121215623.31911-1-paul.burton@mips.com>
In-Reply-To: <20181121215623.31911-1-paul.burton@mips.com>
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
Message-ID: <20181126182245.uuP6aZTeuqhxvSoTTglfhVvDRUekJIAf1EYYpGUV6IU@z>

Hello,

Paul Burton wrote:
> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for MIPS, allowing the
> user to enable dead code elimination. In order for this to work, ensure
> that we keep the data bus exception table & the machine list by
> annotating them with KEEP.
> 
> This shrinks both 32r2el_defconfig & 64r6el_defconfig builds by ~6%, as
> shown by numbers from scripts/bloat-o-meter:
> 
> | 32r2el_defconfig | 64r6el_defconfig
> --------|------------------|------------------
> No DCE | 8919864          | 8286307
> DCE | 8338988 (-6.51%) | 7741808 (-6.57%)
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Cc: linux-mips@linux-mips.org

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
