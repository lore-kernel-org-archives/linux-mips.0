Received: from mail-eopbgr770132.outbound.protection.outlook.com ([40.107.77.132]:51264
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993070AbeKMWWSgeVVu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:22:18 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v2 1/2] mips: delete duplicated BUILTIN_DTB and LIBFDT
 configs
Date: Tue, 13 Nov 2018 22:22:16 +0000
Message-ID: <CY4PR2201MB12725B9145E49B80801D4AC5C1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20181112170059.7199-1-maksym.kokhan@globallogic.com>
In-Reply-To: <20181112170059.7199-1-maksym.kokhan@globallogic.com>
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
To: Maksym Kokhan <maksym.kokhan@globallogic.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <pburton@wavecomp.com>, James Hogan <jhogan@kernel.org>, Andrii Bordunov <andrew.bordunov@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181113222216.7RCBVSh1xopz_Xat7PvEL94YoP5HZc5cBR_AykGgm6I@z>

Hello,

Maksym Kokhan wrote:
> CONFIG_BUILTIN_DTB and CONFIG_LIBFDT selection is duplicated
> in menu "Machine selection" under MIPS_MALTA.
> 
> Signed-off-by: Maksym Kokhan <maksym.kokhan@globallogic.com>
> Signed-off-by: Andrii Bordunov <andrew.bordunov@gmail.com>

Series applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
