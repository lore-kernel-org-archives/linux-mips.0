Received: from mailapp01.imgtec.com ([195.59.15.196]:19913 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991965AbdHWJJrgTYOd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Aug 2017 11:09:47 +0200
Subject: Re: [PATCH v2 4/4] crypto: jz4780-rng: Enable PRNG support in CI20
 defconfig
References: <20170823025707.27888-1-prasannatsmkumar@gmail.com>
 <20170823025707.27888-5-prasannatsmkumar@gmail.com>
From: Harvey Hunt <Harvey.Hunt@imgtec.com>
Message-ID: <9da7ab8b-aa81-e012-596c-54355758da83@imgtec.com>
Date: Wed, 23 Aug 2017 10:09:41 +0100
MIME-Version: 1.0
In-Reply-To: <20170823025707.27888-5-prasannatsmkumar@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>, herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paul@crapouillou.net, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org, malat@debian.org, noloader@gmail.com
Message-ID: <20170823090941.f2B11fRc2H53_kF_seX8nvQc8gtxBPKFKvz7fB5QTi8@z>

Hi PrasannaKumar,

On 23/08/17 03:57, PrasannaKumar Muralidharan wrote:
> Enable PRNG driver support in MIPS Creator CI20 default config.
> 
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> ---
> No changes in v2
> 
>   arch/mips/configs/ci20_defconfig | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
> index b42cfa7..9f48f2c 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -88,6 +88,11 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=5
>   CONFIG_SERIAL_8250_INGENIC=y
>   CONFIG_SERIAL_OF_PLATFORM=y
>   # CONFIG_HW_RANDOM is not set
> +CONFIG_CRYPTO_USER=y
> +CONFIG_CRYPTO_USER_API=y
> +CONFIG_CRYPTO_USER_API_RNG=y
> +CONFIG_CRYPTO_HW=y
> +CONFIG_CRYPTO_DEV_JZ4780_RNG=y
>   CONFIG_I2C=y
>   CONFIG_I2C_JZ4780=y
>   CONFIG_GPIO_SYSFS=y
> 

You need to regenerate your defconfig as it is missing CONFIG_MFD_SYSCON.

Thanks,

Harvey
