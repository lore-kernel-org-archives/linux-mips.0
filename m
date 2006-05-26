Received: from [220.76.242.187] ([220.76.242.187]:63183 "EHLO
	localhost.localdomain") by ftp.linux-mips.org with ESMTP
	id S8133389AbWEZDFZ (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 26 May 2006 05:05:25 +0200
Message-ID: <002e01c68071$3ad42800$9d0ba8c0@mrv>
From: "Roman Mashak" <mrv@corecom.co.kr>
References: <C28979E4F697C249ABDA83AC0C33CDF80DE0F2@sjc1exm07.pmc_nt.nt.pmc-sierra.bc.ca>
Subject: Re: booting with NFS root
Date: Fri, 26 May 2006 12:05:17 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="koi8-r";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <mrv@corecom.co.kr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Kiran Thota <Kiran_Thota@pmc-sierra.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20060526030517.aPimnQ3OXqPyOmYv3n2qY2lNYOWFOr0vJeeocMhii2I@z>

Hello, Kiran!
You wrote to "Roman Mashak" <mrv@corecom.co.kr>; <linux-mips@linux-mips.org> 
on Thu, 25 May 2006 19:07:13 -0700:

KT> Roman,
KT>  You have an older version of the linux kernel. I can send you latest 
snapshot.
I've taken the latest 2.4.x available on ftp.pmc-sierra.com

KT> There was a software bug. I don't know your source version to send patch 
but I am
KT> attaching the source titan_ge.c

Thank you Kiran, I recompliled the kernel with driver you attached and now 
there's no panic at least, kernel only hangs up waiting for reply from NFS:

NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Looking up port of RPC 100003/2 on 192.168.11.43

I ran 'tcpdump' on server's side and observed that it's unable to obtain MAC 
address of Sequoia board. Where have I done mistake?

With best regards, Roman Mashak.  E-mail: mrv@corecom.co.kr 
