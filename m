Subject: Re: hot patching
Date: Fri, 15 Feb 2002 14:55:22 +0000 (GMT)
In-Reply-To: <7DF7BFDC95ECD411B4010090278A44CA1B7579@ATVX> from "Siders, Keith" at Feb 15, 2002 08:17:30 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16bjli-0003Lr-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: "Siders, Keith" <keith_siders@toshibatv.com>
Cc: 'Alan Cox' <alan@lxorguk.ukuu.org.uk>, "'linux-mips@oss.sgi.com'" <linux-mips@oss.sgi.com>
Message-ID: <20020215145522.1QSt6C-1Q4fpJFNRA6MjxkyZa3z7sU5_F_p_EmBXktY@z>

> When I looked at the ptrace code it looked to me like it was intended for
> inserting breakpoints for the most part. Are you saying that I can patch

Mostly yes

> into a process and have it vector off to executable code? At this point I've
> identified at least three types of patches: a jump, a call, and simply
> overwrite a few instructions (the easiest and common to all types). I'd love
> to _not_ need a driver.

Have a look at how gdb implements "call functionname"
