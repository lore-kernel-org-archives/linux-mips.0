Received: from rtsoft2.corbina.net ([85.21.88.2]:45449 "HELO
	mail.dev.rtsoft.ru") by ftp.linux-mips.org with SMTP
	id S8133369AbWBGPXZ (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 7 Feb 2006 15:23:25 +0000
Message-ID: <43E8BD84.60308@ru.mvista.com>
Date: Tue, 07 Feb 2006 18:32:20 +0300
From: Sergei Shtylylov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
Subject: Re: [PATCH] TX49 MFC0 bug workaround
References: <43E25381.4060309@ru.mvista.com>	<20060203.101705.41198541.nemoto@toshiba-tops.co.jp>	<43E2BC1F.7080505@ru.mvista.com> <20060203.112253.104030567.nemoto@toshiba-tops.co.jp>
In-Reply-To: <20060203.112253.104030567.nemoto@toshiba-tops.co.jp>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <sshtylyov@ru.mvista.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mips@linux-mips.org
Message-ID: <20060207153220.XwutJ9xxeq2tGnlMttuexHSa6r7qAxhUsZO7ZnJ88Kc@z>

Hello.

Atsushi Nemoto wrote:
>>>>>>On Fri, 03 Feb 2006 05:12:47 +0300, Sergei Shtylylov <sshtylyov@ru.mvista.com> said:
> 
> sshtylyov>     If I don't mistake, the offending code is in
> sshtylyov> local_irq_disable, local_irq_save, and local_irq_restore
> sshtylyov> macros. The effect would be a crash on any exception taken
> sshtylyov> once interrupts get disabled in a module (*and* that code
> sshtylyov> happens to fall on a page boundary)... nasty. :-(

    ... and yet worse: any external interrupts actually blocked from CPU 
forever by Status.EXL set (which then will never be cleared after the errata 
triggers).

> Right.  And it can really happen.

> ---
> Atsushi Nemoto

WBR, Sergei
