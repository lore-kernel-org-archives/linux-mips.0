Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:38992 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990406AbdL1IG7vABks convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 28 Dec 2017 09:06:59 +0100
Subject: Re: [PATCH 1/2] nvmem: add driver for JZ4780 efuse
References: <20171227122722.5219-1-malat@debian.org>
 <20171227122722.5219-2-malat@debian.org>
 <bbc64846-e12e-aea8-c516-5e03f6253fed@mips.com>
 <CA+7wUsxM4Cq-K6ONSO-WzmYYvq8PmT92Jfrf7M-MqY-ntObi-g@mail.gmail.com>
From: Marcin Nowakowski <marcin.nowakowski@mips.com>
Message-ID: <0a3b0b12-80c0-9d6d-bfdb-8d2541947750@mips.com>
Date: Thu, 28 Dec 2017 09:05:31 +0100
MIME-Version: 1.0
In-Reply-To: <CA+7wUsxM4Cq-K6ONSO-WzmYYvq8PmT92Jfrf7M-MqY-ntObi-g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
Return-Path: <Marcin.Nowakowski@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Mathieu Malaterre <malat@debian.org>
Cc: Zubair.Kakakhel@mips.com, PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linus.walleij@linaro.org>, Harvey Hunt <harvey.hunt@imgtec.com>, James Hogan <jhogan@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20171228080531.wv0MI3IQLaLXq3ED6Pnc6_ZWPwKjLTvRq5kKI17J_LI@z>

Hi Mathieu,

On 28.12.2017 08:26, Mathieu Malaterre wrote:
> Hi Marcin,
> 
> On Thu, Dec 28, 2017 at 8:13 AM, Marcin Nowakowski 
> <marcin.nowakowski@mips.com <mailto:marcin.nowakowski@mips.com>> wrote:
>  > Hi Mathieu, PrasannaKumar,
>  >
>  > On 27.12.2017 13:27, Mathieu Malaterre wrote:
>  >>
>  >> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com 
> <mailto:prasannatsmkumar@gmail.com>>
>  >>
>  >> This patch brings support for the JZ4780 efuse. Currently it only expose
>  >> a read only access to the entire 8K bits efuse memory.
>  >>
>  >> Tested-by: Mathieu Malaterre <malat@debian.org 
> <mailto:malat@debian.org>>
>  >> Signed-off-by: PrasannaKumar Muralidharan 
> <prasannatsmkumar@gmail.com <mailto:prasannatsmkumar@gmail.com>>
>  >> ---
>  >
>  >
>  >> +
>  >> +/* main entry point */
>  >> +static int jz4780_efuse_read(void *context, unsigned int offset,
>  >> +                                       void *val, size_t bytes)
>  >> +{
>  >> +       static const int nsegments = sizeof(segments) / 
> sizeof(*segments);
>  >> +       struct jz4780_efuse *efuse = context;
>  >> +       char buf[32];
>  >> +       char *cur = val;
>  >> +       int i;
>  >> +       /* PM recommends read/write each segment separately */
>  >> +       for (i = 0; i < nsegments; ++i) {
>  >> +               unsigned int *segment = segments[i];
>  >> +               unsigned int lpos = segment[0];
>  >> +               unsigned int buflen = segment[1] / 8;
>  >> +               unsigned int ncount = buflen / 32;
>  >> +               unsigned int remain = buflen % 32;
>  >> +               int j;
>  >
>  >
>  > This doesn't look right, as offset & bytes are completely ignored. This
>  > means it will return data from an offset other than requested and may 
> also
>  > overrun the provided output buffer?
> 
> 
> Thanks for the review ! That was the part of nvmem framework I was not 
> totally clear. Let say I want to expose only a portion of efuse space, eg:

Do you need to expose this to the userspace or to other drivers only?
For the second case have a look at the description of nvmem cell interface.


> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi 
> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index 2f26922718559..44d97c06a6d15 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -299,6 +299,15 @@
> clocks = <&cgu JZ4780_CLK_AHB2>;
> clock-names = "bus_clk";
> +
> +#address-cells = <1>;
> +#size-cells = <1>;
> +
> +eth_mac: eth_mac@12 {
> +/* six byte/48bit MAC address stored as 8-bit integers */
> +reg = <0x12 0x6>;
> +};
> +
> };
> };
> What should I do to expose that chunk only in the user space ?

The nvmem interface's userspace interface (via /sys/.../nvmem) provides 
access to the complete device raw memory so the only way to achieve that 
would be to parse the devicetree description in your driver and only 
register part of the memory with the nvmem driver - but that would be a 
slight abuse of the interface.
The nvmem devicetree binding document shows clearly how to define the 
cell interface that can later be used by any consumer - that way you 
could have the ethernet driver access the cell directly. However, as the 
dm9000 driver isn't designed to do that and this is a SoC-specific 
extention, I don't know how it fits with the general eth driver design ...

Potentially a good and useful compromise would be to have all of the 
cell regs exposed via /sys/.../nvmem-cellname file (or something 
similar), but this is not currently supported and I don't know what the 
view of nvmem maintainers on adding such extension would be.


>  >
>  >> +               /* EFUSE can read or write maximum 256bit in each 
> time */
>  >> +               for (j = 0; j < ncount ; ++j) {
>  >> +                       jz4780_efuse_read_32bytes(efuse, buf, lpos);
>  >> +                       memcpy(cur, buf, sizeof(buf));
>  >> +                       cur += sizeof(buf);
>  >> +                       lpos += sizeof(buf);
>  >> +                       }
>  >> +               if (remain) {
>  >> +                       jz4780_efuse_read_32bytes(efuse, buf, lpos);
>  >> +                       memcpy(cur, buf, remain);
>  >> +                       cur += remain;
>  >> +                       }
>  >> +               }
>  >> +
>  >> +       return 0;
>  >> +}

Regardless of the choices above, you still always have to make sure in 
your reg_read method that you only read from the offset specified in 
method arguments and never return more than 'bytes' of data requested.

Marcin
