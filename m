Received: from mail-eopbgr680093.outbound.protection.outlook.com ([40.107.68.93]:6162
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993030AbeKMWUHIKeZu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:20:07 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: OCTEON: cavium_octeon_defconfig: re-enable OCTEON
 USB  driver
Date: Tue, 13 Nov 2018 22:20:03 +0000
Message-ID: <CY4PR2201MB127275FE7D86A50AFFB1F082C1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20181110220612.21653-1-aaro.koskinen@iki.fi>
In-Reply-To: <20181110220612.21653-1-aaro.koskinen@iki.fi>
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
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <pburton@wavecomp.com>, James Hogan <jhogan@kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181113222003.oG96orqUOpTN5KANzPXyaKG2oUuQ3B2rqE7rV_tEh8Q@z>

Hello,

Aaro Koskinen wrote:
> Re-enable OCTEON USB driver which is needed on older hardware
> (e.g. EdgeRouter Lite) for mass storage etc. This got accidentally
> deleted when config options were changed for OCTEON2/3 USB.
> 
> Fixes: f922bc0ad08b ("MIPS: Octeon: cavium_octeon_defconfig: Enable more drivers")
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Applied to mips-fixes.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
