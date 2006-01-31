Received: from deliver-1.mx.triera.net ([213.161.0.31]:61400 "HELO
	deliver-1.mx.triera.net") by ftp.linux-mips.org with SMTP
	id S8133489AbWAaKeU (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 31 Jan 2006 10:34:20 +0000
Received: from localhost (in-1.mx.triera.net [213.161.0.25])
	by deliver-1.mx.triera.net (Postfix) with ESMTP id 385C9C094
	for <linux-mips@linux-mips.org>; Tue, 31 Jan 2006 11:39:13 +0100 (CET)
Received: from smtp.triera.net (smtp.triera.net [213.161.0.30])
	by in-1.mx.triera.net (Postfix) with SMTP id CA4361BC095
	for <linux-mips@linux-mips.org>; Tue, 31 Jan 2006 11:39:14 +0100 (CET)
Received: from kupljenlap (unknown [213.161.20.162])
	by smtp.triera.net (Postfix) with ESMTP id A1E001A18C2
	for <linux-mips@linux-mips.org>; Tue, 31 Jan 2006 11:39:14 +0100 (CET)
Subject: PCMCIA on AU1200
From: Matej Kupljen <matej.kupljen@ultra.si>
Content-Type: text/plain
Date: Tue, 31 Jan 2006 11:39:13 +0100
Message-ID: <1138703953.7932.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <matej.kupljen@ultra.si>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060131103913.lf73LY3O70KAEvYTV1Sga1L613M84pEADrlyFCB4rnA@z>

Hi

I am trying to use PCMCIA on a DBAU1200 with 16bit card.
From the docs for the board, I see that the PCMCIA interface 
is on CE[3], but the value of the mem_staddr3 is
0x1000000.

Looking at the Linux source code, I see that the PCMCIA is
ioremap-ed to 0xf00000000 (36 bit). It also uses PSEUDO
addresses for the skt->phys_attr and skt->phys_mem.

At what (physical) address can I find the card's I/O space,
so I can use tools like devmem2 to see the cards CIS?
Should I configure mem_stadd3 to same other value?
To 0xf0000000?

BR,
Matej
