From: =?UTF-8?B?5pyx5Yek?= <zhufeng@koretide.com.cn>
Subject: RE: gdbserver and gdb debugging stub for mips 
Date: Fri, 15 Aug 2003 22:49:21 +0800
Message-ID: <MGEELAPMEFMLFBMDBLKLIEKICEAA.zhufeng@koretide.com.cn>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20030815135018.B55C0C59E4@atlas.denx.de>
Return-Path: <zhufeng@koretide.com.cn>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: wd@denx.de
Cc: Wilson Chan <wilsonc@cellvision1.com.tw>, linux-mips@linux-mips.org
Message-ID: <20030815144921.thZK6zd0YUdfUf4K5uN30u71RsKRnKwZi1wa9HKUm58@z>

 what do you mean by "MIPS is NOT MIPS"? Does it mean there are too many mips boards?

-----Original Message-----
From: wd@denx.de [mailto:wd@denx.de]
Sent: 2003年8月15日 21:50
To: Öì·ï
Cc: Wilson Chan; linux-mips@linux-mips.org
Subject: Re: gdbserver and gdb debugging stub for mips 


In message <MGEELAPMEFMLFBMDBLKLGEKGCEAA.zhufeng@koretide.com.cn> you wrote:
> I'm also looking for them . If anybody who has , please tell me , thank you.

MIPS isn't MIPS. What exactly are you looking for?

We have gdb (cross and native) / gdbserver included with our ELDK for
MIPS - this is for 4Kc CPUs.

See section "3. Embedded Linux Development Kit" at
http://www.denx.de/twiki/bin/view/DULG/BoardSelect (select incaip).

Hope this helps.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
"If you can, help others. If you can't, at least don't hurt  others."
- the Dalai Lama
