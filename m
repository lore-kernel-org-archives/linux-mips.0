Message-ID: <3AE86354.117899E@jungo.com>
Date: Thu, 26 Apr 2001 20:05:08 +0200
From: Michael Shmulevich <michaels@jungo.com>
MIME-Version: 1.0
Subject: Re: usermode gdb / remote gdb
References: <3AE67CBA.4060606@jungo.com> <3AE69AAA.76A20F08@lineo.com> <3AE6A795.1080004@jungo.com> <3AE6B14F.B5844932@lineo.com> <3AE70BBA.2BD8B387@mvista.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: Ian Soanes <ians@lineo.com>, Linux/MIPS <linux-mips@oss.sgi.com>
Message-ID: <20010426180508.-QlO7HFnNPu0P1cRvOaZBobT2RAOdZ3W2d0UlqIyZ0s@z>

Jun,

Jun Sun wrote:

>
> Hmm, I added linux-mips target for gdbserver in gdb 4.17.  And I thought Ralf
> sent the patch back to FSF (as I had to fill out some copyright forms).
> Perhaps it is lost somewhere?
>
> Anyhow, here is the patch that I submitted.  Hopefully it helps.
>
> Jun
>

From the patch you've sent I see most of changes were made for mipsel.
Could I use similar updates
for mips(EB)?
Anyway, in my default  gdb-5.0 gdb/config/mips/  doesn't contain any
?m-linux.h headers. That's why
configure fails, I suppose.

Thanks,
Michael.
