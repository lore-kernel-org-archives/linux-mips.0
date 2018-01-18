Received: from mail.kernel.org ([198.145.29.99]:47486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23994711AbeARB7hIE37X (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 18 Jan 2018 02:59:37 +0100
MIME-Version: 1.0
In-Reply-To: <CANc+2y4nBcVPUjTiXXDDUD_qph0zHAmr-SDCt74C8gCZdNQ4Fw@mail.gmail.com>
References: <20171228212954.2922-1-malat@debian.org> <20171228212954.2922-2-malat@debian.org>
 <20180103200211.u56tqesyumsofoff@rob-hp-laptop> <CANc+2y5Y9fYh5V5OG_o+-92-uLYew7yNObLGTYPhGyx2eExywA@mail.gmail.com>
 <CAL_JsqJHHPJY0Yg+kmMbjZVsq=VVC0dPgtvXoN+sxL9gjBtMLA@mail.gmail.com> <CANc+2y4nBcVPUjTiXXDDUD_qph0zHAmr-SDCt74C8gCZdNQ4Fw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Jan 2018 19:59:08 -0600
Message-ID: <CAL_JsqJ9FQyOO_yaHjjMvwvL_CrWrZz7r4hom6n5hgdx0Z=RNw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] nvmem: add driver for JZ4780 efuse
Content-Type: text/plain; charset="UTF-8"
Return-Path: <robh@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Cc: Mathieu Malaterre <malat@debian.org>, Marcin Nowakowski <marcin.nowakowski@mips.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zubair.Kakakhel@mips.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20180118015908.tvMJl0aVoAdyaIErOQf4jlbNo_1bM6inMKUJhvx_lU8@z>

On Wed, Jan 17, 2018 at 11:31 AM, PrasannaKumar Muralidharan
<prasannatsmkumar@gmail.com> wrote:
> Hi Rob,
>
> On 11 January 2018 at 20:38, Rob Herring <robh@kernel.org> wrote:
>> On Sat, Jan 6, 2018 at 6:43 AM, PrasannaKumar Muralidharan
>> <prasannatsmkumar@gmail.com> wrote:
>>> Hi Rob,
>>>
>>> On 4 January 2018 at 01:32, Rob Herring <robh@kernel.org> wrote:
>>>> On Thu, Dec 28, 2017 at 10:29:52PM +0100, Mathieu Malaterre wrote:
>>>>> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>

[...]

>>>>> +             nemc: nemc@13410000 {
>>>>> +                     compatible = "ingenic,jz4780-nemc";
>>>>> +                     reg = <0x13410000 0x10000>;
>>>>> +                     #address-cells = <2>;
>>>>> +                     #size-cells = <1>;
>>>>> +                     ranges = <1 0 0x1b000000 0x1000000
>>>>> +                               2 0 0x1a000000 0x1000000
>>>>> +                               3 0 0x19000000 0x1000000
>>>>> +                               4 0 0x18000000 0x1000000
>>>>> +                               5 0 0x17000000 0x1000000
>>>>> +                               6 0 0x16000000 0x1000000>;
>>>>> +
>>>>> +                     clocks = <&cgu JZ4780_CLK_NEMC>;
>>>>> +
>>>>> +                     status = "disabled";
>>>>> +             };
>>>>>
>>>>> -             clocks = <&cgu JZ4780_CLK_NEMC>;
>>>>> +             efuse: efuse@134100d0 {
>>>>> +                     compatible = "ingenic,jz4780-efuse";
>>>>> +                     reg = <0x134100d0 0xff>;
>>>>
>>>> You are creating an overlapping region here with nemc above. Don't do
>>>> that.
>>>
>>> Should "reg = <0x13410000 0x10000>;" be used instead?
>>
>> No, that still overlaps with nemc. What's in registers 0x00-0xcf and
>> 0x1d0-0xffff? Either get rid of this node altogether and make the
>> driver for nemc also instantiate the efuse driver (DT is not the only
>> way to instantiate drivers), or create sub-nodes under nemc for each
>> distinct h/w block in the 13410000-13420000 address space.
>
> My idea was not to change nemc driver.
>
> By "create sub-nodes under nemc" do you mean something like below?

Yes.

> nemc: nemc@13410000 {
>                      compatible = "ingenic,jz4780-nemc";
>                      reg = <0x13410000 0x10000>;
>                      <...>
>                      status = "disabled";

Though having disabled here is strange. We'd normally ignore all the
child nodes.

>
>                      efuse: efuse@134101d0 {
>                                           compatible = "ingenic,jz4780-efuse";
>                                           reg = <0x134100d0 0xff>;
>                      }
> }
>
> Will this instantiate efuse driver? I do not know how to do that with
> sub-node. I will explore more on this.

The nemc driver just needs to call of_platform_default_populate.

>> Or a third option is make nemc reg:
>>
>> reg = <0x13410000 0xd0>, <0x134101d0 0xfe30>;
>>
>> But I suspect that is wrong and you probably have some other function in there.
>>
>> Rob
>
> If the efuse block were to use a different base register address (that
> does not overlap with nemc register range) in future SoC how the node
> should be? Using nemc to instantiate efuse won't be the best choice if
> that happens.

Then you will have a different compatible for nemc (because it is
different) and then the driver should skip the above step.

Rob
