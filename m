Received: from mail-fx0-f225.google.com ([209.85.220.225]:40096 "EHLO
	mail-fx0-f225.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1493595AbZJTWRC (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 21 Oct 2009 00:17:02 +0200
MIME-Version: 1.0
In-Reply-To: <4ADE3225.5050001@caviumnetworks.com>
References: <1255819715-19763-1-git-send-email-linus.walleij@stericsson.com>
	 <alpine.LFD.2.00.0910200454300.2863@localhost.localdomain>
	 <4ADE3225.5050001@caviumnetworks.com>
Date: Wed, 21 Oct 2009 00:16:56 +0200
Message-ID: <63386a3d0910201516r71100657y92e3e6c2fab38db9@mail.gmail.com>
Subject: Re: [PATCH] Make MIPS dynamic clocksource/clockevent clock code
	generic
From: Linus Walleij <linus.ml.walleij@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <linus.ml.walleij@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Mikael Pettersson <mikpe@it.uu.se>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20091020221656.c59rpF5vqkjPs9cZCtI7PX5tVz43QhyKukyvy0rNZDk@z>

2009/10/20 David Daney <ddaney@caviumnetworks.com>:

>> Please do not make that functions inline. They are too large and there
>> is no benefit of inlining them.
>
> If that is the case, then perhaps they should not be defined in a header
> file.

Of course not. There are apropriate places to put them, but as stated
I think the use as it is today warrants having them inlined.

Linus Walleij
