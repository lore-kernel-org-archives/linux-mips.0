Received: from localhost (localhost.lan [127.0.0.1])
	by mail.romat.com (Postfix) with ESMTP id 0AD8CEB2E8
	for <linux-mips@linux-mips.org>; Wed, 24 Nov 2004 16:32:33 +0200 (IST)
Received: from mail.romat.com ([127.0.0.1])
 by localhost (mail.romat.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22539-02 for <linux-mips@linux-mips.org>;
 Wed, 24 Nov 2004 16:32:30 +0200 (IST)
Received: from gilad (unknown [192.168.1.167])
	by mail.romat.com (Postfix) with ESMTP id ADF81EB2E4
	for <linux-mips@linux-mips.org>; Wed, 24 Nov 2004 16:32:29 +0200 (IST)
From: "Gilad Rom" <gilad@romat.com>
Subject: Au1500 Chip Select
Date: Wed, 24 Nov 2004 16:32:42 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20041124143229.ADF81EB2E4@mail.romat.com>
Return-Path: <gilad@romat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041124143242.Lwdw2yA5wAotss4YBtMrQe9P6AxOAhbNS4_4CxhiPaY@z>

Hello,

I am trying to implement a simple program which
Will be used to communicate with an I/O peripheral 
Over CS1 (Chip select 1) of the au1500.

Has anyone ever attempted this? Could someone 
Point me to some sample code, perhaps? I am grepping
Through the kernel, yet having trouble locating
Chip-select specific code for reference.

Thanks,
Gilad.
