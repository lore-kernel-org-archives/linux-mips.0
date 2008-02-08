Received: from mail.gmx.net ([213.165.64.20]:15068 "HELO mail.gmx.net")
	by ftp.linux-mips.org with SMTP id S20022283AbYBHJYP (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 8 Feb 2008 09:24:15 +0000
Message-ID: <47AC1FB5.4060208@gmx.net>
Date: Fri, 08 Feb 2008 10:24:05 +0100
From: Andi <opencode@gmx.net>
MIME-Version: 1.0
Subject: Re: Problems booting Linux kernel on Sigma SMP8634
References: <47AB50DD.2050504@gmx.net> <47AB5614.5010804@avtrex.com>
In-Reply-To: <47AB5614.5010804@avtrex.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-Path: <opencode@gmx.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20080208092405.sP4qQOg4Y6aRMcAxCdTh8lt2ptGhSJatRScGDmX7ftE@z>

Hey David,

> You need symbols so that you can interpret the stack trace.  It is
> impossible to tell anything without that.

Unfortunately, we don't have much more than just the binary kernel
image. No sources. No memory map.
How can I find out which functions do correspondent to these addresses?


I thought about that this might be a common problem, if one doesn't load
a certain ucode, maybe the interrupt-handler or so ..


>> Determined physical RAM map:
>>  memory: 05ee0000 @ 10020000 (usable)
> 
> This seems like an odd value.  I would expect either 03fe0000 or 07fe0000

This was also my first guess. But this seems to be ok, as you can see on
the "reference" output here:
http://www.networkedmediatank.com/viewtopic.php?t=457

This box has a total of 128MB of memory ..

> 
> David Daney
> 

Regards,
	Andi
