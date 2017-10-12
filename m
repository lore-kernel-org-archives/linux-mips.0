Received: from mail-it0-x243.google.com ([IPv6:2607:f8b0:4001:c0b::243]:46065
        "EHLO mail-it0-x243.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992241AbdJLR3W3q1p5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 12 Oct 2017 19:29:22 +0200
MIME-Version: 1.0
In-Reply-To: <20171012143011.GA30173@gondor.apana.org.au>
References: <20170918140241.24003-1-prasannatsmkumar@gmail.com> <20171012143011.GA30173@gondor.apana.org.au>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Thu, 12 Oct 2017 22:59:15 +0530
Message-ID: <CANc+2y5VzWx+kLBO+=aWHLE5OGAGvuB_eVAzJ52ZVy79ad9Nxg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] crypto: Add driver for JZ4780 PRNG
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
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh+dt@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, "David S . Miller" <davem@davemloft.net>, Paul Cercueil <paul@crapouillou.net>, linux-crypto@vger.kernel.org, linux-mips@linux-mips.org, Mathieu Malaterre <malat@debian.org>, noloader@gmail.com
Message-ID: <20171012172915.cLhhVTdaX6LckE2AoNavuLbfzFD0T8Kpjpoe4klomoQ@z>

Hi Herbert,

On 12 October 2017 at 20:00, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> On Mon, Sep 18, 2017 at 07:32:37PM +0530, PrasannaKumar Muralidharan wrote:
>> This patch series adds support of pseudo random number generator found
>> in Ingenic's JZ4780 and X1000 SoC.
>>
>> Create cgublock node which has CGU and RNG node as its children. The
>> cgublock node uses "simple-bus" compatible which helps in exposing CGU
>> and RNG nodes without changing CGU driver. Add 'syscon' compatible in
>> CGU node in jz4780.dtsi. The jz4780-rng driver uses regmap exposed via
>> syscon interface to access the RNG registers. CGU driver is not
>> modified in this patch set as registers used by CGU driver and this
>> driver are different.
>>
>> PrasannaKumar Muralidharan (4):
>>   crypto: jz4780-rng: Add JZ4780 PRNG devicetree binding documentation
>>   crypto: jz4780-rng: Add Ingenic JZ4780 hardware PRNG driver
>>   crypto: jz4780-rng: Add RNG node to jz4780.dtsi
>>   crypto: jz4780-rng: Enable PRNG support in CI20 defconfig
>
> Please indicate which patches are intended to go through the crypto
> trees.
