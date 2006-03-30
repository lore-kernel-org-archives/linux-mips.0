Received: from mf2.realtek.com.tw ([60.248.182.46]:50450 "EHLO
	mf2.realtek.com.tw") by ftp.linux-mips.org with ESMTP
	id S8133814AbWC3CFC (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 30 Mar 2006 03:05:02 +0100
Message-ID: <002d01c6539f$d040a200$106215ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
References: <024c01c65337$63931c90$106215ac@realtek.com.tw> <442A94D0.1020106@mips.com>
Subject: Re: Using hardware watchpoint for applications debugging
Date: Thu, 30 Mar 2006 10:15:28 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Nigel Stephens <nigel@mips.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20060330021528.ll8X5TfViz4iWRX9zSYUYPVmByAVbuyzPA4X06yD6Eg@z>


Hi Nigel,
We use the same way with you to handle the issue 2.

As to adding watchpoint to kernel, there will be another problem.
ASID in kernel is variable. Therefore, we cannot indicate which thread we
want to watch by ASID.
What we can do is setting G (global) bit to WatchHi Register and then all
threads accessing that address will cause the exception.
In the exception, it will filter the threads by PID to find out the thread
we are watching.

Regards,
Colin

----- Original Message ----- 
From: "Nigel Stephens" <nigel@mips.com>
To: "colin" <colin@realtek.com.tw>
Cc: <linux-mips@linux-mips.org>
Sent: Wednesday, March 29, 2006 10:08 PM
Subject: Re: Using hardware watchpoint for applications debugging


>
>
> colin wrote:.
> >     2. When an exception happens and we find that it's not touching the
righ
> > address, we will discard it. However, exception will happen again
because
> > the former instruction will be re-executed when the exception is
finished.
> >
> >
>
> You'll need to single-step over the instruction which generated the
> unwanted watchpoint exception, with the watchpoint disabled. Then after
> handling the single step reenable the watchpoint and resume normal
> execution.
>
> It would be best if you added watchpoint support to the kernel ptrace
> code: since that would make the watchpoints usable by GDB also.
>
> Nigel
>
