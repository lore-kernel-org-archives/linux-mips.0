Received: from mail-it0-x242.google.com ([IPv6:2607:f8b0:4001:c0b::242]:37848
        "EHLO mail-it0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994726AbeCGOyvJMhvt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Mar 2018 15:54:51 +0100
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJiNpnVC7X=viKZRjEJBe8ZEp0mJLDKhPYKugoxpiQJNQ@mail.gmail.com>
References: <20170918140241.24003-1-prasannatsmkumar@gmail.com>
 <20170918140241.24003-4-prasannatsmkumar@gmail.com> <20180306091932.GM4197@saruman>
 <CAL_JsqJiNpnVC7X=viKZRjEJBe8ZEp0mJLDKhPYKugoxpiQJNQ@mail.gmail.com>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Wed, 7 Mar 2018 20:24:43 +0530
Message-ID: <CANc+2y63OnEkgXC43zDq3Fw34QxxTY3yz3Dag8fAE3muX7cpEw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] crypto: jz4780-rng: Add RNG node to jz4780.dtsi
Content-Type: text/plain; charset="UTF-8"
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
To: Rob Herring <robh+dt@kernel.org>
Cc: James Hogan <jhogan@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Ralf Baechle <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, Paul Cercueil <paul@crapouillou.net>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Mathieu Malaterre <malat@debian.org>, noloader@gmail.com
Message-ID: <20180307145443.EO48IAj8Ja6_yyNqDW3WRyYZKEM0mIkcrJP0HSvIc18@z>

Hi Rob,

On 6 March 2018 at 19:25, Rob Herring <robh+dt@kernel.org> wrote:
> On Tue, Mar 6, 2018 at 3:32 AM, James Hogan <jhogan@kernel.org> wrote:
>> On Mon, Sep 18, 2017 at 07:32:40PM +0530, PrasannaKumar Muralidharan wrote:
>>> Add RNG node to jz4780 dtsi. This driver uses registers that are part of
>>> the register set used by Ingenic CGU driver. Use regmap in RNG driver to
>>> access its register. Create 'simple-bus' node, make CGU and RNG node as
>>> child of it so that both the nodes are visible without changing CGU
>>> driver code.
>
> The goal should be to avoid changing the DT (because the h/w hasn't
> changed), not avoid changing a driver.

Please have a look at the discussion happened at
https://patchwork.linux-mips.org/patch/14094/. Looks like there is a
difference in though process between you and mips folks. I am not an
expert in DT so please suggest me the correct way to go about this.

>>>
>>> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>>
>> Better late than never:
>> Acked-by: James Hogan <jhogan@kernel.org>
>>
>> (I presume its okay for the reg ranges to overlap, ISTR that being an
>> issue a few years ago, but maybe thats fixed now).
>
> No, that should be avoided. It does work because we have existing
> cases that have to be supported.

I am sorry but I require guidance here. Do you have any suggestion on
how this should be.

>>
>> Cheers
>> James

Thanks and regards,
PrasannaKumar
