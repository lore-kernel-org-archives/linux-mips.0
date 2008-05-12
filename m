Received: from sj-iport-3.cisco.com ([171.71.176.72]:36656 "EHLO
	sj-iport-3.cisco.com") by ftp.linux-mips.org with ESMTP
	id S20024551AbYELROr (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 12 May 2008 18:14:47 +0100
Message-ID: <48287AEC.6090300@cisco.com>
Date: Mon, 12 May 2008 10:14:20 -0700
From: David VomLehn <dvomlehn@cisco.com>
MIME-Version: 1.0
Subject: Re: [RFC] [PATCH 1/1] [MIPS] Advanced Kernel Stack Backtrace
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Ralf Baechle [ralf"@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20080512171420.12PZtuJECvetSl1cvQ2hIdkwedjkT5XczwwfP4V7YeE@z>

> On Wed, May 07, 2008 at 04:49:53PM -0700, David VomLehn wrote:
> 
>> This patch contains the kernel stack backtrace code we've been running 
>> for about a year on our MIPS-based settop box. ...

>  o Use ARRAY_SIZE() from <linux/kernel.h> instead of numberof.

Oops, missed this one in the port from 2.6.14 to 2.6.24.

>  o Please run the patch through scripts/checkpatch.pl and fix the resulting
>    errors.

Will do.

>  o Your patch got linewrapped by your mail client.

Ouch. I'll fix that next time.

>   Ralf

Thanks!
