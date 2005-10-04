Received: from smtp101.biz.mail.mud.yahoo.com ([68.142.200.236]:54391 "HELO
	smtp101.biz.mail.mud.yahoo.com") by ftp.linux-mips.org with SMTP
	id S3465666AbVJDAo0 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 4 Oct 2005 01:44:26 +0100
In-Reply-To: <000f01c5c876$a2b78740$0400a8c0@buzz>
References: <000f01c5c876$a2b78740$0400a8c0@buzz>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-ID: <2e5c8ef0628b1886bde6e6ca6d76b79e@embeddedalley.com>
Content-Transfer-Encoding: 7bit
From: Dan Malek <dan@embeddedalley.com>
Subject: Re: Au1550 Serial port - linux-2.6.13.2
Date: Mon, 3 Oct 2005 17:43:56 -0700
Return-Path: <dan@embeddedalley.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Kyle Unice <unixe@comcast.net>
Cc: linux-mips@linux-mips.org
Message-ID: <20051004004356.gr_Wzh8pABWsKAPPYCIeaZN7eHHSrY9psE0O0EFsGik@z>


On Oct 3, 2005, at 5:00 PM, Kyle Unice wrote:

> I have configured linux-2.6.13.2 for a db1550_defconfig build.  When I
> compile it, I get this error when compiling au1x00_uart.c:

You need to use the linux-mips.org CVS tree.  Current top of
tree is 2.6.14-rc2, which builds and boots fine on the db1550.

Thanks.

	-- Dan
