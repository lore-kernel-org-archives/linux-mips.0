Received: from mail-bw0-f221.google.com ([209.85.218.221]:37270 "EHLO
	mail-bw0-f221.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492370AbZKCNvu convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 3 Nov 2009 14:51:50 +0100
MIME-Version: 1.0
In-Reply-To: <63386a3d0910251518i42149642g183f2d3f6c43384f@mail.gmail.com>
References: <1256078002-27919-1-git-send-email-linus.walleij@stericsson.com>
	 <63386a3d0910251518i42149642g183f2d3f6c43384f@mail.gmail.com>
Date: Tue, 3 Nov 2009 14:51:41 +0100
Message-ID: <63386a3d0911030551j1accd6fby7038895df544385b@mail.gmail.com>
Subject: Re: [PATCH] Make MIPS dynamic clocksource/clockevent clock code
	generic v2
From: Linus Walleij <linus.ml.walleij@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <linus.ml.walleij@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Mikael Pettersson <mikpe@it.uu.se>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20091103135141.GKLubJjhrWbxK2QmMlu94iwoFy0MYBUSjBMt_HNFnV0@z>

2009/10/25 Linus Walleij <linus.ml.walleij@gmail.com>:
> 2009/10/21 Linus Walleij <linus.walleij@stericsson.com>:
>
>> Changes v1->v2:
>> - Fixed Mikaels comments: spelling, terminology.
>> - Kept the functions inline: all uses and foreseen uses
>>  are once per kernel and all are in __init or __cpuinit sections.
>> - Unable to break out common code - the code is not common and
>>  implementing two execution paths will be more awkward.
>> - Hoping the tglx likes it anyway.
>
> Ping on tglx on this, I will uninline the functions if you think
> it's better in the long run, just tell me, else can you pick this
> patch?

Ping again...

Linus Walleij
