Received: from mail-it0-x244.google.com ([IPv6:2607:f8b0:4001:c0b::244]:37809
        "EHLO mail-it0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994721AbeCGOvKoxt5t convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 7 Mar 2018 15:51:10 +0100
MIME-Version: 1.0
In-Reply-To: <788bf0bf0d0aaa97f59bc908ebf34ebf@crapouillou.net>
References: <20170918140241.24003-1-prasannatsmkumar@gmail.com>
 <20170918140241.24003-4-prasannatsmkumar@gmail.com> <20180306091932.GM4197@saruman>
 <788bf0bf0d0aaa97f59bc908ebf34ebf@crapouillou.net>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Wed, 7 Mar 2018 20:21:03 +0530
Message-ID: <CANc+2y7m0Z0Nnwv31gGd_PFAyKpSxfi2YY7Ngk_K86Qnr_tvyQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] crypto: jz4780-rng: Add RNG node to jz4780.dtsi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-Path: <prasannatsmkumar@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Cercueil <paul@crapouillou.net>
Cc: James Hogan <jhogan@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, "David S . Miller" <davem@davemloft.net>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Mathieu Malaterre <malat@debian.org>, noloader@gmail.com
Message-ID: <20180307145103.uTWo1mfX4wScr-hcpLjosrtUFZMXQdT0H5WgGDTOIug@z>

Hi Paul,

On 7 March 2018 at 04:31, Paul Cercueil <paul@crapouillou.net> wrote:
> Le 2018-03-06 10:32, James Hogan a écrit :
>>
>> On Mon, Sep 18, 2017 at 07:32:40PM +0530, PrasannaKumar Muralidharan
>> wrote:
>>>
>>> Add RNG node to jz4780 dtsi. This driver uses registers that are part of
>>> the register set used by Ingenic CGU driver. Use regmap in RNG driver to
>>> access its register. Create 'simple-bus' node, make CGU and RNG node as
>>> child of it so that both the nodes are visible without changing CGU
>>> driver code.
>>>
>>> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>>
>>
>> Better late than never:
>> Acked-by: James Hogan <jhogan@kernel.org>
>>
>> (I presume its okay for the reg ranges to overlap, ISTR that being an
>> issue a few years ago, but maybe thats fixed now).
>>
>> Cheers
>> James
>
>
> What bothers me is that the CGU code has not been modified to use regmap, so
> the
> registers area is actually mapped twice (once in the CGU driver, once with
> regmap).

One of my previous versions changed CGU code to use regmap. I got a
review comment saying that is not required
(https://patchwork.kernel.org/patch/9906889/). The points in the
comment were valid so I reverted the change. Please have a look at the
discussion.

> Besides, regmap would be useful if the RNG registers were actually located
> in the
> middle of the register area used by the CGU driver, which is not the case
> here.
> The CGU block does have some registers after the RNG ones on the X1000 SoC,
> but
> I don't think they will ever be used (and if they are it won't be by the CGU
> driver).
>
> Regards,
> -Paul

Ingenic M200 SoC's CGU has clock and power related registers after the
RNG registers. Paul Burton suggested using regmap to expose registers
to CGU and RNG drivers
(https://patchwork.linux-mips.org/patch/14094/).

Regards,
PrasannaKumar
