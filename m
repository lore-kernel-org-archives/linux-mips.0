Received: from mail-pa0-f66.google.com ([209.85.220.66]:33195 "EHLO
        mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992936AbcHKCAMUl03E convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 11 Aug 2016 04:00:12 +0200
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 2/4] MIPS: BMIPS: Add support GPIO device nodes
From: Jaedon Shin <jaedon.shin@gmail.com>
In-Reply-To: <CAOiHx=n19Sb3B1_FGkdzqxWqi5Vpy5PQbYWdaVvNaUTW+Njcog@mail.gmail.com>
Date: Thu, 11 Aug 2016 11:00:00 +0900
Content-Transfer-Encoding: 8BIT
Message-ID: <2D0C8F56-B6B7-4079-B0D1-7277781C27E4@gmail.com>
References: <20160808021719.4680-1-jaedon.shin@gmail.com> <20160808021719.4680-3-jaedon.shin@gmail.com> <CAOiHx=kxjXiYm_4S3rLOjB0wM-UpQsqfXn+EVq6+FGOH4whuuQ@mail.gmail.com> <D5F26D94-8312-4CAC-8577-205A1AAFB0E5@gmail.com> <CAOiHx=n19Sb3B1_FGkdzqxWqi5Vpy5PQbYWdaVvNaUTW+Njcog@mail.gmail.com>
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
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, Rob Herring <robh+dt@kernel.org>, MIPS Mailing List <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Message-ID: <20160811020000.ooEguojgQnTnjIn-bn_ha3-pN1Y0595PAeiIhn1mN6o@z>

Hi Jonas,

On Aug 9, 2016, at 11:14 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:
> 
> Hi,
> 
> On 9 August 2016 at 03:44, Jaedon Shin <jaedon.shin@gmail.com> wrote:
>> Hi Jonas,
>> 
>> On Aug 8, 2016, at 11:06 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:
>>> 
>>> Hi,
>>> 
>>> please always include devicetree for any dts(i) related changes.
>>> 
>>> On 8 August 2016 at 04:17, Jaedon Shin <jaedon.shin@gmail.com> wrote:
>>>> (snip)
>>>> diff --git a/arch/mips/boot/dts/brcm/bcm97435svmb.dts b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
>>>> index 9db84f2a6664..dd8b8fb97053 100644
>>>> --- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
>>>> +++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
>>>> @@ -59,6 +59,14 @@
>>>>       status = "okay";
>>>> };
>>>> 
>>>> +&upg_gio {
>>>> +       status = "okay";
>>>> +};
>>>> +
>>>> +&upg_gio_aon {
>>>> +       status = "okay";
>>>> +};
>>>> +
>>> 
>>> You don't set their status in the dtsi, they will be enabled by
>>> default, and you can drop this change.
>>> 
>>>> &enet0 {
>>>>       status = "okay";
>>>> };
>>> 
>>> 
>>> Regards
>>> Jonas
>> 
>> The status="disabled" has been missing. It will be added in v2.
>> The interrupt-controller@ will also be changed.
> 
> I thought that was indented, since GPIO controllers usually are always
> present (you don't disable the irq controllers by default either).
> 
> Not that I want to tell you how you do your dts(i) files, but I would
> expect things that you usually always need (irq, clocks, gpios) are
> present by default.
> 
> 
> Regards
> Jonas

I checked the BCM7445 ARM based SoC device tree and other BRCM boards, and
I agree with your point. The status="okay" nodes will be removed in v2.

Thanks,
Jaedon
