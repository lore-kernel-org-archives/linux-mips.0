Received: from mail-wm0-f45.google.com ([74.125.82.45]:36655 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992630AbcHPN5hYVYH4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 16 Aug 2016 15:57:37 +0200
Received: by mail-wm0-f45.google.com with SMTP id q128so145657686wma.1
        for <linux-mips@linux-mips.org>; Tue, 16 Aug 2016 06:57:36 -0700 (PDT)
Subject: Re: [PATCH] clocksource: mips-gic-timer: make gic_clocksource_of_init
 return int
References: <20160801033546.26472-1-paul.gortmaker@windriver.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <57B31BC7.8000401@linaro.org>
Date: Tue, 16 Aug 2016 15:57:27 +0200
MIME-Version: 1.0
In-Reply-To: <20160801033546.26472-1-paul.gortmaker@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-Path: <daniel.lezcano@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org

On 08/01/2016 05:35 AM, Paul Gortmaker wrote:
> In commit d8152bf85d2c057fc39c3e20a4d623f524d9f09c:
>   ("clocksource/drivers/mips-gic-timer: Convert init function to return error")
> 
> several return values were added to a void function resulting in:
> 
>  clocksource/mips-gic-timer.c: In function 'gic_clocksource_of_init':
>  clocksource/mips-gic-timer.c:175:3: warning: 'return' with a value, in function returning void [enabled by default]
>  clocksource/mips-gic-timer.c:183:4: warning: 'return' with a value, in function returning void [enabled by default]
>  clocksource/mips-gic-timer.c:190:3: warning: 'return' with a value, in function returning void [enabled by default]
>  clocksource/mips-gic-timer.c:195:3: warning: 'return' with a value, in function returning void [enabled by default]
>  clocksource/mips-gic-timer.c:200:3: warning: 'return' with a value, in function returning void [enabled by default]
>  clocksource/mips-gic-timer.c:211:2: warning: 'return' with a value, in function returning void [enabled by default]
>  clocksource/mips-gic-timer.c: At top level:
>  clocksource/mips-gic-timer.c:213:1: warning: comparison of distinct pointer types lacks a cast [enabled by default]
>  clocksource/mips-gic-timer.c: In function 'gic_clocksource_of_init':
>  clocksource/mips-gic-timer.c:183:18: warning: ignoring return value of 'PTR_ERR', declared with attribute warn_unused_result [-Wunused-result]
> 
> Given that the addition of the return values was intentional, it seems
> that the conversion of the containing function from void to int was
> simply overlooked.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: linux-mips@linux-mips.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---

Hi Paul,

Thomas is in vacation and I'm returning back.

So I applied this patch as a fix.

Thanks!

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
