Received: from mail-eopbgr760103.outbound.protection.outlook.com ([40.107.76.103]:23936
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993846AbeKUSVf66O00 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Nov 2018 19:21:35 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Regerate defconfigs
Date: Wed, 21 Nov 2018 18:21:33 +0000
Message-ID: <MWHPR2201MB12775ADA87E6BEDF360AED46C1DA0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181121005819.23815-1-paul.burton@mips.com>
In-Reply-To: <20181121005819.23815-1-paul.burton@mips.com>
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
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Anders Roxell <anders.roxell@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181121182133.El4v4HuTRSMKLN_JCbYMdvExjCtICnqPH_LM-3Bq57o@z>

Hello,

Paul Burton wrote:
> A couple of patches have come up recently to remove particular instances
> of obsolete Kconfig symbols from defconfigs. Rather than doing this
> piecemeal, simply regenerate them all.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> References: https://patchwork.linux-mips.org/patch/19635/
> References: https://patchwork.linux-mips.org/patch/21156/
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
