Received: from mail-pd0-f177.google.com ([209.85.192.177]:34235 "EHLO
        mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27026572AbbEHP4ViFyAE convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 8 May 2015 17:56:21 +0200
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Subject: Re: [PATCH 1/2] MIPS: BMIPS: dts: remove unsupported entry for bcm7362
From: Jaedon Shin <jaedon.shin@gmail.com>
In-Reply-To: <CAJiQ=7CQshXhGJ7ftWQSu_UxgKVaRprZPEPXWNP6ci_1bLrJrw@mail.gmail.com>
Date: Sat, 9 May 2015 00:55:07 +0900
Content-Transfer-Encoding: 8BIT
Message-ID: <BABEE235-D7C4-4897-B3ED-778A5FB7F538@gmail.com>
References: <1431089958-2626-1-git-send-email-jaedon.shin@gmail.com> <1431089958-2626-2-git-send-email-jaedon.shin@gmail.com> <CAJiQ=7CQshXhGJ7ftWQSu_UxgKVaRprZPEPXWNP6ci_1bLrJrw@mail.gmail.com>
Return-Path: <jaedon.shin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kevin Cernekee <cernekee@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Message-ID: <20150508155507.dFvpgh98AfkWta9oYYQ3fLSyl2UlV2JLcugWFnvFPKM@z>


> On May 8, 2015, at 11:40 PM, Kevin Cernekee <cernekee@gmail.com> wrote:
> 
> On Fri, May 8, 2015 at 5:59 AM, Jaedon Shin <jaedon.shin@gmail.com> wrote:
>> Remove unsupported memory entry for the bcm7362 platform. The BMIPS4380
>> processor only supports ZONE_NORMAL is not available for HIGHMEM.
>> 
>> Signed-off-by: Jaedon Shin <jaedon.shin@gmail.com>
>> ---
>> arch/mips/boot/dts/brcm/bcm97362svmb.dts | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> index b7b88e5dc9e7..ab8b01fa7dcf 100644
>> --- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> +++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> @@ -8,7 +8,7 @@
>> 
>>        memory@0 {
>>                device_type = "memory";
>> -               reg = <0x00000000 0x10000000>, <0x20000000 0x30000000>;
>> +               reg = <0x00000000 0x10000000>;
> 
> Hmm, this is more of a kernel limitation than a hardware limitation,
> though.  The board physically has 1GB of memory, right?  It is best if
> the DT entry reflects the actual hardware configuration.
> 
> The Broadcom kernels enable the CPU's special "XKS01" feature to put
> 1GB of memory in ZONE_NORMAL:
> 
> https://github.com/Broadcom/stblinux-3.3/tree/master/linux
> 
> Maybe this would be worth adding to mainline.

Yes, It is right to have 1GB of memory.

In order to add XKS01 ioremap, keg, tlb, dma, etc. change is required.
However, there is no assurance they'll take those changes to the mainline.

Anyway, I also hope it added.
