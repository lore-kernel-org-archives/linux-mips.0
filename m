Received: from mail-iy0-f177.google.com ([209.85.210.177]:39277 "EHLO
        mail-iy0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1493206Ab1APOix (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 16 Jan 2011 15:38:53 +0100
Received: by iyj21 with SMTP id 21so4080185iyj.36
        for <linux-mips@linux-mips.org>; Sun, 16 Jan 2011 06:38:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTik8hQfd8cvNj=qeq5U=6zpQHw33a9hfK-q8+x1Z@mail.gmail.com>
References: <AANLkTinvdEPwQ=DmcF8nnTAa0Py_O=+p7x1pobcTNHom@mail.gmail.com>
        <AANLkTik8hQfd8cvNj=qeq5U=6zpQHw33a9hfK-q8+x1Z@mail.gmail.com>
Date: Sun, 16 Jan 2011 22:38:47 +0800
Message-ID: <AANLkTikpUBtg2zz8tcbcz2rcG-O+fTFwb_pTi88uZe0h@mail.gmail.com>
Subject: Re: about udelay in mips
From: loody <miloody@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <miloody@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>
Message-ID: <20110116143847.nrzUzfh8HrFHvWVpF0589QkwWYd2RDquRt6KZ48HQOg@z>

hi wu, winfred:
Thanks for your reply ;)
2011/1/14 wu zhangjin <wuzhangjin@gmail.com>:
> On Thu, Jan 13, 2011 at 6:02 PM, loody <miloody@gmail.com> wrote:
>> hi all:
>> If i trace source in the correct place, I found udelay(100) is
>> implemented as a loop which decrease 1 per iteration until the count,
>> 100, as 0.
>> What makes me confused is since the speed of cpus are different and
>> that will make udelay not precise on different platform, right?
>
> Yeah, it may be not precise, so, some processors, like Cavium octeon
> have added their own timestamp register based delay functions, please
> refer to:
>
> arch/mips/cavium-octeon/csrc-octeon.c
>
> The delay_tsc() for X86 defined in arch/x86/lib/delay.c is similar.
>
> But both of them are 64bit timestamp registers.
>
> We can also apply similar method to add the precise delays for the
> other CPUs, but we may need to take extra notice:
>
> 1. If the CPU only provides 32bit timestamp registers(e.g R4K MIPS),
> overflow should be considered.
> 2. If the CPU support dynamic CPU frequency and the frequency of the
> timestamp binds to the CPU's frequency, the scaled down timestamp
> should be converted to the real timestamp.
below is the formula about calculating the delay
(us  *   0x000010c7   *   HZ   *   lpj   )) >> 32)
I cannot figure out why we need to multiply 0x10c7, and what lpj mean?
Does lpj mean if jiffies increase 1, how many "subu    %0, 1" may need?
Regards,
miloody
