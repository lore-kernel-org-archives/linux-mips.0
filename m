Message-ID: <3E6C5DE2.6090403@prosyst.bg>
Date: Mon, 10 Mar 2003 11:41:54 +0200
From: Alexander Popov <s_popov@prosyst.bg>
MIME-Version: 1.0
Subject: Re: Mycable XXS board
References: <3E6C4DF1.3020304@mycable.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <s_popov@prosyst.bg>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20030310094154.utRqv3fDHRgjKCWfBoKSkdLCNS_3yV-8IGXxYdBi7Ys@z>

Thanks to all that helped me up with that...

I managed to compile the kernel (2.4.21). There were some problems with unresolved symbols, but when 
I fixed the support to only pb1500 and removed the MTD CFI support , the framebuffer and a few other 
things it worked.

Thanks againg guys.

Best Regards,

-- 
Alexander Popov
RTOS&JVM Team Leader
Prosyst Bulgaria, Inc.
email: s_popov@prosyst.bg
mobile: +35987663193
icq: 29207350
