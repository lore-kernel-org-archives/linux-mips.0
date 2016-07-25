Received: from mail-sn1nam02on0086.outbound.protection.outlook.com ([104.47.36.86]:52688
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992186AbcGYVuCWZhEk (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 25 Jul 2016 23:50:02 +0200
Message-ID: <5796897F.8050007@caviumnetworks.com>
Date: Mon, 25 Jul 2016 14:49:51 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Octeon: Improve USB reset code for OCTEON II.
References: <57967A2C.3020002@bethel-hill.org> <20160725211545.GB17344@blackmetal.musicnaut.iki.fi>
In-Reply-To: <20160725211545.GB17344@blackmetal.musicnaut.iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, "Steven J. Hill" <sjhill@bethel-hill.org>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>
Message-ID: <20160725214951.KDEYZqKizkqEIbbJyZ-4ZGu9CAE-Zg0DEuSRe8ppymI@z>

On 07/25/2016 02:15 PM, Aaro Koskinen wrote:
> Hi,
>
> On Mon, Jul 25, 2016 at 03:44:28PM -0500, Steven J. Hill wrote:
>> -	.dma_mask_64	= 1,
>> +	/*
>> +	 * We can DMA from anywhere. But the descriptors must be in
>> +	 * the lower 4GB.
>> +	 */
>> +	.dma_mask_64	= 0,
>
> Is this change really related to USB reset code?

In a word ... no.

It is still needed though on systems with 4GB or more of RAM.

Steven, can you split the patch in two?   One patch with the reset 
enhancements, and a second with this change to restrict the DMA mask.

Thanks,
David.
