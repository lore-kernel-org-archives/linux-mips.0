Received: from mba.ocn.ne.jp ([122.1.235.107]:45541 "HELO smtp.mba.ocn.ne.jp")
	by ftp.linux-mips.org with SMTP id S21920237AbYJTOPQ (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 20 Oct 2008 15:15:16 +0100
Date: Mon, 20 Oct 2008 23:15:24 +0900 (JST)
Message-ID: <20081020.231524.52129378.anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH] ide: Add tx4938ide driver
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <48FB610D.3020901@ru.mvista.com>
References: <20081017.231130.82350696.anemo@mba.ocn.ne.jp>
	<48FB610D.3020901@ru.mvista.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-Path: <anemo@mba.ocn.ne.jp>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: sshtylyov@ru.mvista.com
Cc: linux-mips@linux-mips.org, linux-ide@vger.kernel.org, bzolnier@gmail.com, ralf@linux-mips.org
Message-ID: <20081020141524.EnH-qyKpW6Jc-TimPOlGisupKw5HB_ZLXB2ZRnAFH-Q@z>

On Sun, 19 Oct 2008 20:32:13 +0400, Sergei Shtylyov <sshtylyov@ru.mvista.com> wrote:
> > +	/* IORDY setup time: 35ns */
> > +	wt = (35 + cycle - 1) / cycle;
> 
>     It's not that simple I'm afraid: you can't just wait IORDY for 35 ns as 
> that won't guarantee the minimum DIOx- actime time for the current PIO mode; 
> so t->act8 (since it's >= t->act) should be part of the equation here, 
> possibly with subtraction of couple cycles, if I'm interpreting the timing 
> diagrams in the datasheet correctly...

Hmm... so, does this statement seems correct?

	wt = (t->act8b + 35 + cycle - 1) / cycle - 2;

> > +	/* actual wait-cycle is max(wt & ~1, 1) */
> 
>     I got an impression that WT[0] bit is used otherwise in the ready mode, 
> and PWT[1:0]:WT[3:1] = 00000 would mean 0 cycles, not 1...
