Received: from mail-qa0-f51.google.com ([209.85.216.51]:46506 "EHLO
        mail-qa0-f51.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27012688AbaKNG2ik0ZuG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 14 Nov 2014 07:28:38 +0100
MIME-Version: 1.0
In-Reply-To: <20141031113358.GY32045@tbergstrom-lnx.Nvidia.com>
References: <1414666135-14313-1-git-send-email-tomeu.vizoso@collabora.com> <20141031113358.GY32045@tbergstrom-lnx.Nvidia.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Fri, 14 Nov 2014 07:28:12 +0100
Message-ID: <CAAObsKARz=Y3J74Fm+MVOuH-ftK6yGSxWnNtd3LpHZjebKCGsg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Per-user clock constraints
Content-Type: text/plain; charset=UTF-8
Return-Path: <tomeu.vizoso@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Stephen Boyd <sboyd@codeaurora.org>, Alex Elder <elder@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org, linux-omap@vger.kernel.org, Manuel Lauss <manuel.lauss@gmail.com>, Matt Porter <mporter@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Zhangfei Gao <zhangfei.gao@linaro.org>
Message-ID: <20141114062812.P-qVLQGbO6Ppayw7Rp7NlQKknTJ8rsMn2ZV24qS2vMc@z>

On 31 October 2014 12:33, Peter De Schrijver <pdeschrijver@nvidia.com> wrote:
> On Thu, Oct 30, 2014 at 11:48:26AM +0100, Tomeu Vizoso wrote:
>> Hello,
>>
>> this fifth version of the series has just one change, suggested by Stephen:

Hi Mike, how is this looking for 3.19?

Regards,

Tomeu

>> * Initialize clk.ceiling_constraint to ULONG_MAX and warn about new floor
>> constraints being higher than the existing ceiling.
>>
>> The first five patches are just cleanups that should be desirable on their own,
>> and that should make easier to review the actual per-user clock patch.
>>
>> The sixth patch actually moves the per-clock data that was stored in struct
>> clk to a new struct clk_core and adds references to it from both struct clk and
>> struct clk_hw. struct clk is now ready to contain information that is specific
>> to a given clk consumer.
>>
>> The seventh patch adds API for setting floor and ceiling constraints and stores
>> that information on the per-user struct clk, which is iterable from struct
>> clk_core.
>>
>> They are based on top of 3.18-rc1.
>>
>> http://cgit.collabora.com/git/user/tomeu/linux.git/log/?h=per-user-clk-constraints-v5
>>
>
> Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
>
> Mike,
>
> Do you think this will be merged for 3.19?
>
> Thanks,
>
> Peter.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
