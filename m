Received: from mail-pz0-f196.google.com ([209.85.222.196]:43114 "EHLO
	mail-pz0-f196.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492489AbZILHWv convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Sat, 12 Sep 2009 09:22:51 +0200
MIME-Version: 1.0
In-Reply-To: <4AAA73A4.9010601@caviumnetworks.com>
References: <4AA991C1.1050800@caviumnetworks.com>
	 <1252627011-2933-1-git-send-email-ddaney@caviumnetworks.com>
	 <200909111633.00665.mb@bu3sch.de>
	 <4AAA73A4.9010601@caviumnetworks.com>
Date: Sat, 12 Sep 2009 09:22:43 +0200
Message-ID: <10f740e80909120022m72ad5ea7t692fba93cd3114e9@mail.gmail.com>
Subject: Re: [PATCH 01/10] Add support for GCC-4.5's __builtin_unreachable()
	to compiler.h
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-Path: <geert.uytterhoeven@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: Michael Buesch <mb@bu3sch.de>, linuxppc-dev@lists.ozlabs.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux-mips@linux-mips.org, Heiko Carstens <heiko.carstens@de.ibm.com>, linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, linux-s390@vger.kernel.org, linux-am33-list@redhat.com, Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Mike Frysinger <vapier@gentoo.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, uclinux-dist-devel@blackfin.uclinux.org, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Haavard Skinnemoen <hskinnemoen@atmel.com>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, Kyle McMartin <kyle@mcmartin.ca>, linux-alpha@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux390@de.ibm.com, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>
Message-ID: <20090912072243.sqj2OLOesgEX9nvWVcuZX4_APej9KMWv_gK56h-SsUQ@z>

On Fri, Sep 11, 2009 at 17:58, David Daney<ddaney@caviumnetworks.com> wrote:
> Michael Buesch wrote:
>>
>> On Friday 11 September 2009 01:56:42 David Daney wrote:
>>>
>>> +/* Unreachable code */
>>> +#ifndef unreachable
>>> +# define unreachable() do { for (;;) ; } while (0)
>>> +#endif
>>
>> # define unreachable() do { } while (1)
>>
>> ? :)
>
> Clearly I was not thinking clearly when I wrote that part.  RTH noted the
> same thing.  I will fix it.

However, people are so used to seeing the `do { } while (0)' idiom,
that they might miss
there's a `1' here, not a `0'.

So perhaps it's better to use plain `for (;;)' for infinite loops?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
