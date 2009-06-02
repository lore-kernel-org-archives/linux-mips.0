Received: from mail-bw0-f177.google.com ([209.85.218.177]:58833 "EHLO
	mail-bw0-f177.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S20021816AbZFBHPg convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 2 Jun 2009 08:15:36 +0100
MIME-Version: 1.0
In-Reply-To: <20090601215034.7352ddca.akpm@linux-foundation.org>
References: <200906011357.09966.florian@openwrt.org>
	 <20090601215034.7352ddca.akpm@linux-foundation.org>
Date: Tue, 2 Jun 2009 09:15:29 +0200
Message-ID: <10f740e80906020015t2d63fdadmaa1fa6bc204ec33a@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: export sound/core/pcm_timer.c gcd
	implementation
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-Path: <geert.uytterhoeven@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Florian Fainelli <florian@openwrt.org>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Ingo Molnar <mingo@elte.hu>
Message-ID: <20090602071529.tqwJae9k7r-iLRVd7aP2TXT_5ewvqjl6JP6jIjgL95U@z>

On Tue, Jun 2, 2009 at 06:50, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Mon, 1 Jun 2009 13:57:09 +0200 Florian Fainelli <florian@openwrt.org> wrote:
>
>> This patch exports the gcd implementation from
>> sound/core/pcm_timer.c into include/linux/kernel.h.
>> AR7 uses it in its clock routines.
>>
>> ...
>>
>> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
>> index 883cd44..878a27a 100644
>> --- a/include/linux/kernel.h
>> +++ b/include/linux/kernel.h
>> @@ -147,6 +147,22 @@ extern int _cond_resched(void);
>>               (__x < 0) ? -__x : __x;         \
>>       })
>>
>> +/* Greatest common divisor */
>> +static inline unsigned long gcd(unsigned long a, unsigned long b)
>> +{
>> +        unsigned long r;
>> +        if (a < b) {
>> +                r = a;
>> +                a = b;
>> +                b = r;
>> +        }
>> +        while ((r = a % b) != 0) {
>> +                a = b;
>> +                b = r;
>> +        }
>> +        return b;
>> +}
>
> a) the name's a bit sucky.   Is there some convention for this name?

Well, `gcd' is a quite common acronym, probably almost as well known as `min'
and `max'...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
