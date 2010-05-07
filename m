Received: from mail-gy0-f177.google.com ([209.85.160.177]:64246 "EHLO
        mail-gy0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491000Ab0EGDMm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 May 2010 05:12:42 +0200
MIME-Version: 1.0
In-Reply-To: <1273164852.23734.6.camel@localhost>
References: <1273067734-4758-1-git-send-email-dengcheng.zhu@gmail.com>
         <1273067734-4758-2-git-send-email-dengcheng.zhu@gmail.com>
         <1273162909.23734.4.camel@localhost>
         <1273164852.23734.6.camel@localhost>
Date: Fri, 7 May 2010 11:12:35 +0800
Message-ID: <l2o1b4d75291005062012hd00ceb1cqe5045ac854212f38@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] MIPS/Oprofile: extract PMU defines/helper
        functions for sharing
From: Deng-Cheng Zhu <dengcheng.zhu@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <dengcheng.zhu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: wuzhangjin@gmail.com
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, a.p.zijlstra@chello.nl, paulus@samba.org, mingo@elte.hu, acme@redhat.com, jamie.iles@picochip.com
Message-ID: <20100507031235.vg36ZCoEHuxYstBAuI3BN7-TJrWDCJrUj6QM_8lPiZY@z>

>> For we will use the save_perf_irq in the common function:
>> mipspmu_get_irq() of the next patch, so, we need to move the definition
>> of it out of the #if ... and put it before the #if:
>>
>> ...
>> +static int (*save_perf_irq)(void);
>>
>> #if defined(CONFIG_CPU_MIPS32)
>> ...
>
> oh, no, For Oprofile not use it, we can define it before
> mipspmu_get_irq() directly.
>

Thanks for your comments!

Just a correction: op_model_mipsxx.c will also use save_perf_irq. So
when taking your 2nd solution, we need to define another static
save_perf_irq in op_model_mipsxx.c.
