In-Reply-To: <0a2201c4ca62$25d37f80$a701a8c0@lan>
References: <20041112181335.13362.qmail@web81008.mail.yahoo.com> <09ac01c4ca24$e68a6740$a701a8c0@lan> <0a2201c4ca62$25d37f80$a701a8c0@lan>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-ID: <FA00299D-3765-11D9-A70B-003065F9B7DC@embeddededge.com>
Content-Transfer-Encoding: 7bit
From: Dan Malek <dan@embeddededge.com>
Subject: Re: GPIO on the Au1500
Date: Mon, 15 Nov 2004 19:25:10 -0500
Return-Path: <dan@embeddededge.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Gilad Rom <gilad@romat.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20041116002510.f-Z5NQzQ5MlP247JDki0DFGcBn0MSSlMpPenL5dGcOE@z>


On Nov 14, 2004, at 10:53 AM, Gilad Rom wrote:

> For some reason, I keep getting that magical value, 0x10000001 for 
> EVERY address I try to read, be it SYS_BASE (0xB1900000) or every 
> other address.

It's not working because that is not the address of the device(s).
The 0xB1900000 is the Kernel Virtual address of these devices, the real
physical address, and the one you have to use with mmap() is the
system control block address 0x11900000.

Just be very, very careful with user space access of any IO using this
method.  The kernel can ensure atomic updates using various methods,
but user applications can't and may cause system failures.  This is why
a GPIO driver is a much better approach.

	-- Dan
