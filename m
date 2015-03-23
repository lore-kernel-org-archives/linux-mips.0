Received: from mail-ig0-f181.google.com ([209.85.213.181]:36482 "EHLO
        mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27009429AbbCWWQxvUUf8 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 23 Mar 2015 23:16:53 +0100
MIME-Version: 1.0
In-Reply-To: <20150323212524.GU14954@sirena.org.uk>
References: <E1YZyoN-00019n-50@debutante>
        <20150323212524.GU14954@sirena.org.uk>
Date: Mon, 23 Mar 2015 23:16:49 +0100
Message-ID: <CACna6rzRO=vtiv_RfC9nDz+nCZdGGvCh4-zx5cm-W2GSRC1U6w@mail.gmail.com>
Subject: Re: next-20150323 build: 1 failures 23 warnings (next-20150323)
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-Path: <zajec5@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Mark Brown <broonie@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Ralf Baechle <ralf@linux-mips.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Network Development <netdev@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20150323221649.7rs9m5Rht4FZJMtjVO1s8bwzYdDS-OXfg0tcIqha9TM@z>

On 23 March 2015 at 22:25, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Mar 23, 2015 at 09:38:19AM +0000, Build bot for Mark Brown wrote:
>
> In current -next the bgmac driver does not compile in an ARM
> allmodconfig:
>
>>       arm-allmodconfig
>> ../drivers/net/ethernet/broadcom/bgmac.c:20:27: fatal error: bcm47xx_nvram.h: No such file or directory
>
> because this include file is only present on MIPS.  This looks at first
> glance to have happened in the merge commit edb15d83a875a1f4 from the
> MIPS tree though I think that needs a bit more investigation.

Sorry & thanks. Will fix that tomorrow.

-- 
Rafał
