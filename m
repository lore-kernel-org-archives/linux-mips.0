Received: from mail-fx0-f225.google.com ([209.85.220.225]:46013 "EHLO
	mail-fx0-f225.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492897AbZJYWSV convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Sun, 25 Oct 2009 23:18:21 +0100
MIME-Version: 1.0
In-Reply-To: <1256078002-27919-1-git-send-email-linus.walleij@stericsson.com>
References: <1256078002-27919-1-git-send-email-linus.walleij@stericsson.com>
Date: Sun, 25 Oct 2009 23:18:12 +0100
Message-ID: <63386a3d0910251518i42149642g183f2d3f6c43384f@mail.gmail.com>
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
Message-ID: <20091025221812.cwcnpv4vrrHBGCrYeSvfZv43CrTHhS15lSFQtAZjM14@z>

2009/10/21 Linus Walleij <linus.walleij@stericsson.com>:

> Changes v1->v2:
> - Fixed Mikaels comments: spelling, terminology.
> - Kept the functions inline: all uses and foreseen uses
>  are once per kernel and all are in __init or __cpuinit sections.
> - Unable to break out common code - the code is not common and
>  implementing two execution paths will be more awkward.
> - Hoping the tglx likes it anyway.

Ping on tglx on this, I will uninline the functions if you think
it's better in the long run, just tell me, else can you pick this
patch?

Linus Walleij
