Received: from mail-bw0-f221.google.com ([209.85.218.221]:50448 "EHLO
	mail-bw0-f221.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1493575AbZJTV2D (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 20 Oct 2009 23:28:03 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0910200454300.2863@localhost.localdomain>
References: <1255819715-19763-1-git-send-email-linus.walleij@stericsson.com>
	 <alpine.LFD.2.00.0910200454300.2863@localhost.localdomain>
Date: Tue, 20 Oct 2009 23:27:55 +0200
Message-ID: <63386a3d0910201427i1dd8c789i1c9bceeea250d98c@mail.gmail.com>
Subject: Re: [PATCH] Make MIPS dynamic clocksource/clockevent clock code
	generic
From: Linus Walleij <linus.ml.walleij@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <linus.ml.walleij@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Mikael Pettersson <mikpe@it.uu.se>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20091020212755.U-cKZ_KqT8XSnjbXjZyDMBKADlCsUpJURuUz-lHouv8@z>

2009/10/20 Thomas Gleixner <tglx@linutronix.de>:

> On Sun, 18 Oct 2009, Linus Walleij wrote:
>> This moves the clocksource_set_clock() and clockevent_set_clock()
>> from the MIPS timer code into clockchips and clocksource where
>> it belongs.
> (...)
> Please do not make that functions inline. They are too large and there
> is no benefit of inlining them.

I think there is, because these functions in MIPS if I'm not misreading it, are
used once each in one and one spot only in the clocksource/clockevent
set-up at boot time for each platform in which they are currently used.

Further these spots tend to be __init or even __cpuinit code segments,
so they will be discarded and if we inline the code it will be discarded
after boot as well.

If you foresee that the code will be used in other ways under other
circumstances, I will make them non-inlined of course, but I have a
hard time seeing that.

OK?

Linus Walleij
