Received: from localhost (localhost.lan [127.0.0.1])
	by mail.romat.com (Postfix) with ESMTP id 8CFE0EB2F8
	for <linux-mips@linux-mips.org>; Tue, 30 Nov 2004 11:56:45 +0200 (IST)
Received: from mail.romat.com ([127.0.0.1])
 by localhost (mail.romat.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13726-04 for <linux-mips@linux-mips.org>;
 Tue, 30 Nov 2004 11:56:40 +0200 (IST)
Received: from gilad (unknown [192.168.1.167])
	by mail.romat.com (Postfix) with ESMTP id 499DFEB2EF
	for <linux-mips@linux-mips.org>; Tue, 30 Nov 2004 11:56:40 +0200 (IST)
From: "Gilad Rom" <gilad@romat.com>
Subject: CP0 EntryLo
Date: Tue, 30 Nov 2004 11:56:39 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20041130095640.499DFEB2EF@mail.romat.com>
Return-Path: <gilad@romat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041130095639.OeenjjuH47x0LwpRl9mm2yuT89cQ6SI2Jx4SKMJyQII@z>

Hello List,

I am attempting to access a peripheral device over the Au1500 static bus.

According to the Au1500 Databook, Whenever I set the Chip Select config
Register DTY bits to 1 (for "I/O Device"), I must also set 
Bits 29:26 of CoProcessor 0 to 0xD, to represent bits 35:32 of the 
Physical address. 

My question is, if anyone can answer it, is how do I setup
The CoProcessor0 registers 29:26 in my driver?

I have noticed a set of functions called write/read_c0_entrylo[0,1],
But I keep getting random values when invoking these from my driver.

Thanks,
Gilad.
